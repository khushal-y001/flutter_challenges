import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organic_farm/features/authentication/bloc/authentication_bloc.dart';
import 'package:organic_farm/features/authentication/bloc/authentication_event.dart';
import 'package:organic_farm/features/authentication/bloc/authentication_state.dart';

import '../../../constants/constants.dart';
import '../../../widgets/widgets.dart';

class LoginFormView extends StatefulWidget {
  const LoginFormView({Key? key}) : super(key: key);

  @override
  State<LoginFormView> createState() => _LoginFormViewState();
}

class _LoginFormViewState extends State<LoginFormView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final authOptions = <AuthOptions>[
    AuthOptions(icon: Icons.email, title: "${AppConstants.continueWith} ${AppConstants.github}"),
    AuthOptions(
        icon: Icons.facebook, title: "${AppConstants.continueWith} ${AppConstants.facebook}"),
    AuthOptions(icon: Icons.apple, title: "${AppConstants.continueWith} ${AppConstants.apple}"),
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return SingleChildScrollView(
        child: SizedBox(
      height: size.height * 0.96,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: BlocBuilder<AuthenticationBloc, AuthenticationState>(builder: (context, state) {
            if (state == AuthenticationState.success()) {
              ScaffoldMessenger.of(context).showSnackBar(snackBar("Login successfully"));
            }
            if (state == AuthenticationState.failure()) {
              ScaffoldMessenger.of(context).showSnackBar(snackBar("Login Failed"));
            }
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                topIcons(theme, context),
                30.sh,
                loginTitle(theme),
                40.sh,
                emailForm(theme, context, emailController),
                15.sh,
                passwordForm(theme, context, passwordController),
                25.sh,
                mainButton(theme, emailController.text, passwordController.text),
                30.sh,
                haveAnAccountButton(theme),
                30.sh,
                const Divider(),
                30.sh,
                authOptionsButton(theme, authOptions, size), //create an account button
              ],
            );
          }),
        ),
      ),
    ));
  }
}

topIcons(ThemeData theme, BuildContext context) => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.close, color: AppColors.textGrey)),
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Text(
            AppConstants.later,
            textAlign: TextAlign.center,
            style: theme.textTheme.titleMedium?.copyWith(color: AppColors.textGrey),
          ),
        )
      ],
    );

loginTitle(ThemeData theme) => Text(
      AppConstants.createAccount,
      textAlign: TextAlign.center,
      style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w800),
    );

emailForm(ThemeData theme, BuildContext context, TextEditingController emailController) =>
    BlocBuilder<AuthenticationBloc, AuthenticationState>(builder: (context, state) {
      return Column(
        children: [
          AppTextField(
            controller: emailController,
            hintText: AppConstants.emailAddress,
            onChanged: (email) =>
                context.read<AuthenticationBloc>().add(OnChangeEmailEvent(email: email)),
          ),
          5.sh,
          !state.isEmailValid
              ? emailController.text.isEmpty
                  ? const SizedBox()
                  : errorText(theme, AppConstants.emailErrorText)
              : const SizedBox(),
        ],
      );
    });

passwordForm(ThemeData theme, BuildContext context, TextEditingController passwordController) =>
    BlocBuilder<AuthenticationBloc, AuthenticationState>(builder: (context, state) {
      return Column(
        children: [
          AppTextField(
            obscureText: true,
            controller: passwordController,
            hintText: AppConstants.password,
            onChanged: (password) =>
                context.read<AuthenticationBloc>().add(OnChangePasswordEvent(password: password)),
          ),
          5.sh,
          !state.isPasswordValid
              ? passwordController.text.isEmpty
                  ? const SizedBox()
                  : errorText(theme, AppConstants.passwordErrorText)
              : const SizedBox(),
        ],
      );
    });

errorText(ThemeData theme, String errorText) => Row(
      children: [
        10.sw,
        Text(errorText,
            textAlign: TextAlign.left,
            style: theme.textTheme.labelSmall?.copyWith(
              color: AppColors.red500,
            )),
      ],
    );

haveAnAccountButton(ThemeData theme) => Text(
      AppConstants.alreadyHaveAnAccount,
      textAlign: TextAlign.center,
      style: theme.textTheme.titleSmall?.copyWith(color: AppColors.textGrey),
    );

mainButton(ThemeData theme, String? email, String? password) =>
    BlocBuilder<AuthenticationBloc, AuthenticationState>(builder: (context, state) {
      return Visibility(
        visible: !(state == AuthenticationState.logging()),
        replacement: const AppButton(
            onPressed: null,
            child: CircularProgressIndicator(
              color: AppColors.black,
            )),
        child: AppButton(
          onPressed: () {
            if (!state.isFormValid) {
            } else {
              context
                  .read<AuthenticationBloc>()
                  .add(SignupEvent(email: email ?? "", password: password ?? ""));
            }
          },
          child: Text(
            AppConstants.createAccount,
            textAlign: TextAlign.center,
            style: theme.textTheme.titleMedium
                ?.copyWith(color: AppColors.black, fontWeight: FontWeight.w500),
          ),
        ),
      );
    });

authOptionsButton(ThemeData theme, List<AuthOptions> authOptionsList, Size size) => Expanded(
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: authOptionsList.length,
          itemBuilder: (context, index) {
            return BlocBuilder<AuthenticationBloc, AuthenticationState>(builder: (context, state) {
              return Column(
                children: [
                  10.sh,
                  AppButton(
                    backgroundColor: AppColors.white,
                    onPressed: () {
                      if (index == 0) {
                        context.read<AuthenticationBloc>().add(GithubAuth());
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(authOptionsList[index].icon, color: AppColors.black),
                        10.sw,
                        SizedBox(
                          width: size.width * 0.5,
                          child: Text(
                            authOptionsList[index].title,
                            textAlign: TextAlign.left,
                            style: theme.textTheme.titleMedium
                                ?.copyWith(color: AppColors.black, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            });
          }),
    );

class AuthOptions {
  final String title;
  final IconData icon;
  AuthOptions({required this.title, required this.icon});
}
