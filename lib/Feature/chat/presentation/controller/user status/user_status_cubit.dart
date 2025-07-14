import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:chat_app/Feature/chat/data/model/user_status_model.dart';
import 'package:chat_app/core/services/connections_services.dart';
import 'package:chat_app/core/services/get_it_services.dart';
import 'package:chat_app/core/services/secure_storage.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

import '../../../data/repo/chat_message_repository_implmentation.dart';

part 'user_status_state.dart';

class UserStatusCubit extends Cubit<UserStatusState> {
  final String reciverId;
  final ChatMessageRepositoryImplmentation messagesReposiotry;
  UserStatusCubit(this.reciverId, this.messagesReposiotry)
    : super(UserStatusInitial());

  void listenToUserStatus() {
    ConnectionsServices.connection.on("friendstate", (arguments) {
      if (arguments != null && arguments.isNotEmpty) {
        var status = arguments[0] as bool;
        log("Iam listening");
        if (status) {
          emit(UserOnlineStatus());
        } else {
          emit(UserLastSeenStatus(DateTime.now()));
        }
      }
    });

    ConnectionsServices.connection.on("typing", (arguments) {
      if (arguments != null && arguments.isNotEmpty) {
        var status = arguments[0] as bool;
        if (status) {
          emit(UserTypingStatus());
        } else {
          emit(UserOnlineStatus());
        }
      }
    });
  }

  Future<void> getUserStatus() async {
    log("hello world");
    String? token = await GetItServices.getIt<SecureStorage>().getUserToken();
    var result = await messagesReposiotry.getUserStatus(token!, reciverId);

    result.fold(
      (failure) {
        log("failure message");
      },
      (status) async {
        await getState(status);
      },
    );
  }

  Future<void> getState(UserStatusModel status) async {
    log(status.state.toLowerCase());

    if (status.state.toLowerCase().contains("online")) {
      emit(UserOnlineStatus());
      return;
    }
    if (status.state.toLowerCase().contains("typing")) {
      emit(UserTypingStatus());
      return;
    }

    DateFormat format = DateFormat("M/d/yyyy h:mm:ss a");
    emit(UserLastSeenStatus(format.parse(status.state)));
  }
}
