import 'package:bloc/bloc.dart';
import 'package:chat_app/Feature/auth/data/model/login_request_model.dart';
import 'package:chat_app/Feature/auth/data/model/user_model.dart';
import 'package:chat_app/Feature/auth/data/repository/auth_repository_implmentation.dart';
import 'package:chat_app/app/chat_app.dart';
import 'package:chat_app/core/services/get_it_services.dart';
import 'package:chat_app/core/services/secure_storage.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final AuthRepositoryImplmentation authRepository;
  LoginCubit(this.authRepository) : super(LoginInitial());

  Future<void> login() async {
    emit(LoginLoadingState());
    var result = await authRepository.login(
      LoginRequestModel(
        phone: phoneController.text.toString(),
        password: passwordController.text.toString(),
      ),
    );

    result.fold(
      (failure) {
        emit(LoginFailedState(failure.message));
      },
      (userModel) async {
        await saverUserInformation(userModel);
        await UserChatApp.userIsAuthorized();
        emit(LoginSuccessState());
      },
    );
  }

  Future<void> saverUserInformation(UserModel user) async {
    SecureStorage storage = GetItServices.getIt<SecureStorage>();

    storage.addUserToken(user.token);
    storage.addUserName(user.userName);
  }
}
