import 'package:chat_app/Feature/chat/data/model/message_model.dart';
import 'package:chat_app/Feature/chat/data/model/user_status_model.dart';
import 'package:chat_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class ChatMessageRepository {
  Future<Either<Failure, List<MessageModel>>> getChatMessages(
    String token,
    String userId,
  );

  Future<Either<Failure, UserStatusModel>> getUserStatus(
    String token,
    String userId,
  );
}
