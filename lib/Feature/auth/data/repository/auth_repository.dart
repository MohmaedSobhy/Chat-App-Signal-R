import 'package:chat_app/Feature/auth/data/model/login_request_model.dart';
import 'package:chat_app/Feature/auth/data/model/register_request_model.dart';
import 'package:chat_app/Feature/auth/data/model/user_model.dart';
import 'package:chat_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserModel>> login(LoginRequestModel loginModel);
  Future<Either<Failure, UserModel>> register(
    RegisterRequestModel regsterModel,
  );
}
