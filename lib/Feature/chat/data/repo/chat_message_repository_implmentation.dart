import 'dart:developer';

import 'package:chat_app/Feature/chat/data/model/message_model.dart';
import 'package:chat_app/Feature/chat/data/model/text_message_model.dart';
import 'package:chat_app/Feature/chat/data/model/user_status_model.dart';
import 'package:chat_app/Feature/chat/data/repo/chat_message_repository.dart';
import 'package:chat_app/core/api/api_end_points.dart';
import 'package:chat_app/core/api/dio_services.dart';
import 'package:chat_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';

class ChatMessageRepositoryImplmentation implements ChatMessageRepository {
  @override
  Future<Either<Failure, List<MessageModel>>> getChatMessages(
    String token,
    String userId,
  ) async {
    try {
      List<MessageModel> messages = [];
      var response = await DioService.getData(
        url: "${ApiEndPoints.allChatMessage}$userId",
        token: token,
      );
      for (var message in response.data['data']) {
        messages.add(TextMessageModel.fromJson(message));
      }
      return Right(messages);
    } catch (error) {
      log(error.toString());
      return Left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, UserStatusModel>> getUserStatus(
    String token,
    String userId,
  ) async {
    try {
      var response = await DioService.getData(
        url: "${ApiEndPoints.getUserStatus}$userId",
        token: token,
      );
      return Right(UserStatusModel.fromJson(response.data['data']));
    } catch (error) {
      log(error.toString());
      return Left(ServerFailure(error.toString()));
    }
  }
}
