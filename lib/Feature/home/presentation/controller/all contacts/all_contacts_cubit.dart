import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:chat_app/Feature/home/data/model/contact_model.dart';
import 'package:chat_app/Feature/home/data/repo/chat_repository_implmentation.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'all_contacts_state.dart';

class AllContactsCubit extends Cubit<AllContactsState> {
  late final ChatRepositoryImplmentation chatRepo;
  int currentPage = 1;
  List<ContactModel> contacts = [];
  bool noMoreContacts = false;
  AllContactsCubit(this.chatRepo) : super(AllContactsInitial());

  Future<void> loadAllContacts() async {
    contacts.clear();
    emit(LoadingContactsState());
    var result = await chatRepo.getAllContacts(currentPage);
    result.fold(
      (failure) {
        log(failure.message.toLowerCase());
        emit(FailedContactsState());
      },
      (contacts) {
        currentPage++;
        this.contacts.addAll(contacts);
        emit(SuccessContactsState());
      },
    );
  }

  Future<void> loadMoreContacts() async {
    if (noMoreContacts) return;
    var result = await chatRepo.getAllContacts(currentPage);
    result.fold(
      (failure) {
        emit(FailedContactsState());
      },
      (contacts) {
        if (contacts.isEmpty) {
          noMoreContacts = true;
          return;
        }
        this.contacts.addAll(contacts);
        emit(SuccessContactsState());
      },
    );
  }
}
