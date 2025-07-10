import 'package:chat_app/Feature/auth/data/repository/auth_repository_implmentation.dart';
import 'package:chat_app/Feature/auth/presentation/controller/login%20cubit/login_cubit.dart';
import 'package:chat_app/Feature/auth/presentation/widget/password_text_field.dart';
import 'package:chat_app/core/helper/show_toast_notification.dart';
import 'package:chat_app/core/routes/app_route.dart';
import 'package:chat_app/core/services/get_it_services.dart';
import 'package:chat_app/core/utils/app_string.dart';
import 'package:chat_app/core/widgets/custom_text_form_field.dart';
import 'package:chat_app/core/widgets/sliver_sized_box_height.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widget/dont_have_account_widget.dart';

class LoginScreenBodyView extends StatefulWidget {
  const LoginScreenBodyView({super.key});

  @override
  State<LoginScreenBodyView> createState() => _LoginScreenBodyViewState();
}

class _LoginScreenBodyViewState extends State<LoginScreenBodyView> {
  late final LoginCubit loginCubit;

  @override
  void initState() {
    super.initState();
    loginCubit = LoginCubit(GetItServices.getIt<AuthRepositoryImplmentation>());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: loginCubit,
      child: Form(
        key: loginCubit.formKey,
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccessState) {
              Navigator.pushReplacementNamed(context, AppRoute.homeScreen);
            } else if (state is LoginFailedState) {
              ShowToastMessage.showErrorToastMessage(
                context,
                message: "Phone or Password Wrong",
              );
            }
          },
          builder: (context, state) {
            return CustomScrollView(
              slivers: [
                const SliverSizedBoxHeight(),
                SliverToBoxAdapter(
                  child: Text(
                    AppString.welcome,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SliverSizedBoxHeight(),
                SliverToBoxAdapter(
                  child: Text(
                    AppString.signUpToContinue,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge?.copyWith(color: Colors.grey),
                  ),
                ),
                const SliverSizedBoxHeight(height: 20),
                SliverToBoxAdapter(
                  child: CustomTextField(
                    controller: loginCubit.phoneController,
                    hintText: "Phone",
                    validator: (value) {
                      if (value.toString().isEmpty) {
                        return "Phone Required";
                      }
                      if (!RegExp(r'^\d+$').hasMatch(value.toString())) {
                        return "Phone must contain only digits";
                      }
                      return null;
                    },
                  ),
                ),
                const SliverSizedBoxHeight(height: 16),
                SliverToBoxAdapter(
                  child: TextPasswordField(
                    textEditingController: loginCubit.passwordController,
                    hint: "Password",
                    validator: (value) {
                      if (value.toString().isEmpty) {
                        return "Password Required";
                      }
                      return null;
                    },
                  ),
                ),
                const SliverSizedBoxHeight(height: 35),
                SliverToBoxAdapter(
                  child: BlocBuilder<LoginCubit, LoginState>(
                    builder: (context, state) {
                      return ElevatedButton(
                        onPressed: () {
                          if (loginCubit.formKey.currentState!.validate()) {
                            loginCubit.login();
                          }
                        },
                        child:
                            (state is LoginLoadingState)
                                ? const Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                )
                                : const Text(
                                  AppString.login,
                                  style: TextStyle(color: Colors.white),
                                ),
                      );
                    },
                  ),
                ),
                const SliverSizedBoxHeight(height: 20),
                const DontHaveAccountWidget(),
              ],
            );
          },
        ),
      ), // Replace with your actual widget tree
    );
  }

  @override
  void dispose() {
    loginCubit.close();
    super.dispose();
  }
}
