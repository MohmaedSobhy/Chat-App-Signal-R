import 'package:chat_app/Feature/auth/presentation/controller/register%20cubit/register_cubit.dart';
import 'package:chat_app/Feature/auth/presentation/widget/password_text_field.dart';
import 'package:chat_app/core/services/get_it_services.dart';
import 'package:chat_app/core/widgets/custom_text_form_field.dart';
import 'package:chat_app/core/widgets/sliver_sized_box_height.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_string.dart';
import '../../data/repository/auth_repository_implmentation.dart';
import '../widget/already_have_account_widget.dart';

class RegisterScreenBodyView extends StatefulWidget {
  const RegisterScreenBodyView({super.key});

  @override
  State<RegisterScreenBodyView> createState() => _RegisterScreenBodyViewState();
}

class _RegisterScreenBodyViewState extends State<RegisterScreenBodyView> {
  late final RegisterCubit registerCubit;

  @override
  void initState() {
    super.initState();
    registerCubit = RegisterCubit(
      GetItServices.getIt<AuthRepositoryImplmentation>(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: registerCubit,
      child: Form(
        key: registerCubit.formKey,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Text(
                AppString.createAccount,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SliverSizedBoxHeight(height: 10),
            SliverToBoxAdapter(
              child: Text(
                AppString.fillDetails,
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(color: Colors.grey),
              ),
            ),
            const SliverSizedBoxHeight(height: 30),
            SliverToBoxAdapter(
              child: CustomTextField(
                controller: registerCubit.nameController,
                hintText: AppString.usernameHint,
                validator: (value) {
                  return null;
                },
                prefixIcon: const Icon(Icons.alternate_email),
              ),
            ),
            const SliverSizedBoxHeight(height: 16),
            SliverToBoxAdapter(
              child: CustomTextField(
                controller: registerCubit.phoneController,
                validator: (value) {
                  if (value.toString().isEmpty) {
                    return "Phone Required";
                  }
                  if (value.toString().length < 11 ||
                      value.toString().length > 11) {
                    return "Enter Valid Phone Number";
                  }
                  return null;
                },
                hintText: AppString.phoneHint,
                prefixIcon: const Icon(Icons.phone_outlined),
              ),
            ),
            const SliverSizedBoxHeight(height: 16),
            SliverToBoxAdapter(
              child: TextPasswordField(
                textEditingController: registerCubit.passwordController,
                hint: "password",
                validator: (value) {
                  if (value.toString().isEmpty) {
                    return "password required";
                  }
                  return null;
                },
              ),
            ),
            const SliverSizedBoxHeight(height: 30),
            SliverToBoxAdapter(
              child: BlocBuilder<RegisterCubit, RegisterState>(
                builder: (context, state) {
                  return ElevatedButton(
                    onPressed: () {},
                    child:
                        (state is RegisterLoadingState)
                            ? const Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                            : const Text(
                              AppString.createAccount,
                              style: TextStyle(color: Colors.white),
                            ),
                  );
                },
              ),
            ),
            const SliverSizedBoxHeight(height: 20),
            const AlreadyHaveAccountWidget(),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    registerCubit.close();
    super.dispose();
  }
}
