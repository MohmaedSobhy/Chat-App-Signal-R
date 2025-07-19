import 'package:bloc/bloc.dart';
import 'package:chat_app/Feature/auth/data/model/register_request_model.dart';
import 'package:chat_app/Feature/auth/data/repository/auth_repository_implmentation.dart';
import 'package:chat_app/core/services/get_it_services.dart';
import 'package:chat_app/core/services/secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../../app/chat_app.dart';
import '../../../data/model/user_model.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late final AuthRepositoryImplmentation authRepository;
  RegisterCubit(this.authRepository) : super(RegisterInitial());

  Future<void> register() async {
    emit(RegisterLoadingState());
    var result = await authRepository.register(
      RegisterRequestModel(
        userName: nameController.text.toString(),
        phone: phoneController.text.toString(),
        password: passwordController.text.toString(),
      ),
    );

    result.fold(
      (failure) {
        emit(RegisterFailedState(failure.message));
      },
      (userModel) async {
        await saverUserInformation(userModel);
        await UserChatApp.userIsAuthorized();
        emit(RegisterSuccessState());
      },
    );
  }

  Future<void> saverUserInformation(UserModel user) async {
    SecureStorage storage = GetItServices.getIt<SecureStorage>();
    storage.addUserToken(user.token);
    storage.addUserName(user.userName);
  }
}
