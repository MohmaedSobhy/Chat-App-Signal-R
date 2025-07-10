import 'package:chat_app/Feature/home/data/model/contact_model.dart';
import 'package:chat_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class ChatRepository {
  Future<Either<Failure, List<ContactModel>>> getAllContacts(int page);
}
