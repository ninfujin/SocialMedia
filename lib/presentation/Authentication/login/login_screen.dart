import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/core/bacground.dart';
import 'package:social_media/core/colors.dart';
import 'package:social_media/core/size.dart';
import 'package:social_media/presentation/MainPage/main_page.dart';
import 'package:social_media/utils/validation.dart';
import 'package:social_media/presentation/Authentication/widgets/password_text_field.dart';
import 'package:social_media/BLoC/Authentication/authentication_bloc.dart';
import 'package:social_media/presentation/CustomWidgets/custom_snackbar.dart';
import 'package:social_media/presentation/CustomWidgets/loading_button.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          customSnackbar(
            context: context,
            message: "Success",
            color: successColor,
          );
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => MainPage(),
            ),
            (Route<dynamic> route) => false,
          );
        }
        if (state is LoginErrorState) {
          customSnackbar(
            context: context,
            message: state.error,
            color: errorColor,
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "登陆",
              style: theme.textTheme.headlineLarge,
            ),
          ),
          body: Background(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      constHeight50,
                      constHeight50,
                      Text(
                        "邮箱",
                        style: theme.textTheme.titleLarge,
                      ),
                      constHeight10,
                      TextFormField(
                        validator: Validation.validateEmail,
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          hintText: "邮箱",
                        ),
                        style: theme.textTheme.titleLarge,
                      ),
                      constHeight20,
                      Text(
                        "密码",
                        style: theme.textTheme.titleLarge,
                      ),
                      constHeight10,
                      PasswordTextField(
                        controller: _passwordController,
                      ),
                      constHeight20,

                      constHeight50,
                      state is LoginLoadingState
                          ? const LoadingButton()
                          : ElevatedButton(
                              onPressed: () {
                                log("ButtonClicked");
                                if (_formKey.currentState!.validate()) {
                                  log("ok");
                                  context
                                      .read<AuthenticationBloc>()
                                      .add(LoginButtonClickEvent(
                                        email: _emailController.text,
                                        password: _passwordController.text,
                                      ));
                                } else {
                                  log("No");
                                }
                              },
                              child: const Text("登陆"),
                            ),
                      constHeight50,
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
