import 'package:chat_app/Feature/home/data/model/chat_model.dart';
import 'package:chat_app/Feature/home/data/model/contact_model.dart';
import 'package:chat_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class ChatRepository {
  Future<Either<Failure, List<ContactModel>>> getAllContacts(
    String token,
    int page,
  );

  Future<Either<Failure, List<ChatModel>>> getAllChats(String token);
}
