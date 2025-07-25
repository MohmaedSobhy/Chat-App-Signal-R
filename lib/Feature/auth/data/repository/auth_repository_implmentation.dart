import 'dart:developer';

import 'package:chat_app/Feature/auth/data/model/login_request_model.dart';
import 'package:chat_app/Feature/auth/data/model/register_request_model.dart';
import 'package:chat_app/Feature/auth/data/model/user_model.dart';
import 'package:chat_app/Feature/auth/data/repository/auth_repository.dart';
import 'package:chat_app/core/api/api_end_points.dart';
import 'package:chat_app/core/api/dio_services.dart';
import 'package:chat_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class AuthRepositoryImplmentation implements AuthRepository {
  @override
  Future<Either<Failure, UserModel>> login(LoginRequestModel loginModel) async {
    try {
      var response = await DioService.postData(
        url: ApiEndPoints.login,
        body: loginModel.toJson(),
      );
      return Right(UserModel.fromJson(response.data['data']));
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel>> register(
    RegisterRequestModel register,
  ) async {
    try {
      log(register.toJson().toString());
      var response = await DioService.postData(
        url: ApiEndPoints.register,
        body: register.toJson(),
      );
      log(response.data.toString());
      return Right(UserModel.fromJson(response.data['data']));
    } catch (error) {
      if (error is DioException) {
        log(error.response!.data!.toString());
      }
      return Left(ServerFailure(error.toString()));
    }
  }
}
