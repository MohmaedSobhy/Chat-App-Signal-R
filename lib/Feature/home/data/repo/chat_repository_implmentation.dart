import 'dart:developer';

import 'package:chat_app/Feature/home/data/model/chat_model.dart';
import 'package:chat_app/Feature/home/data/model/contact_model.dart';
import 'package:chat_app/Feature/home/data/repo/chat_repository.dart';
import 'package:chat_app/core/api/api_end_points.dart';
import 'package:chat_app/core/api/dio_services.dart';
import 'package:chat_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';

class ChatRepositoryImplmentation implements ChatRepository {
  @override
  Future<Either<Failure, List<ContactModel>>> getAllContacts(
    String token,
    int page,
  ) async {
    try {
      var response = await DioService.getData(
        url: ApiEndPoints.getAllUsers,
        token: token,
        queryParameters: {'page': page},
      );
      List<ContactModel> contacts = [];
      for (var contact in response.data['data']) {
        contacts.add(ContactModel.fromJson(contact));
      }
      return Right(contacts);
    } catch (error) {
      return Left(ServerFailure(""));
    }
  }

  @override
  Future<Either<Failure, List<ChatModel>>> getAllChats(String token) async {
    try {
      List<ChatModel> chats = [];
      var response = await DioService.getData(
        url: ApiEndPoints.allChats,
        token: token,
      );
      for (var item in response.data['data']) {
        chats.add(ChatModel.fromJson(item));
      }
      return Right(chats);
    } catch (error) {
      log(error.toString());
      return Left(ServerFailure(error.toString()));
    }
  }
}
