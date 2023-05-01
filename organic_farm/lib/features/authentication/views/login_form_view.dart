import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
import '../../../widgets/widgets.dart';

class LoginFormView extends StatelessWidget {
  const LoginFormView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    final authOptions = <AuthOptions>[
      AuthOptions(
          icon: Icons.email,
          title: "${AppConstants.continueWith} ${AppConstants.google}"),
      AuthOptions(
          icon: Icons.facebook,
          title: "${AppConstants.continueWith} ${AppConstants.facebook}"),
      AuthOptions(
          icon: Icons.apple,
          title: "${AppConstants.continueWith} ${AppConstants.apple}"),
    ];
    return SizedBox(
        height: size.height * 0.96,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  topIcons(theme,context),
                  30.sh,
                  loginTitle(theme),
                  40.sh,
                  const AppTextField(hintText: "Email",),
                  20.sh,
                  const AppTextField(hintText: "Password",),
                  30.sh,
                  mainButton(theme),
                  30.sh,
                  haveAnAccountButton(theme),
                  30.sh,
                  const Divider(),
                  30.sh,
                  authOptionsButton(
                      theme, authOptions), //create an account button
                ],
              ),
          ),
        ));
  }
}

topIcons(ThemeData theme,BuildContext context) => Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
          InkWell(
          onTap: (){
            Navigator.pop(context);
          },
            child:  const Icon(Icons.close,color: AppColors.textGrey)),
        InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Text(
            AppConstants.later,
            textAlign: TextAlign.center,
            style:
                theme.textTheme.titleMedium?.copyWith(color: AppColors.textGrey),
          ),
        )
      ],
    );

loginTitle(ThemeData theme) => Text(
      AppConstants.createAccount,
      textAlign: TextAlign.center,
      style:
          theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w800),
    );
haveAnAccountButton(ThemeData theme) => Text(
      AppConstants.alreadyHaveAnAccount,
      textAlign: TextAlign.center,
      style: theme.textTheme.titleSmall?.copyWith(color: AppColors.textGrey),
    );

mainButton(ThemeData theme) => AppButton(
      onPressed: () {},
      child: Text(
        AppConstants.createAccount,
        textAlign: TextAlign.center,
        style: theme.textTheme.titleMedium
            ?.copyWith(color: AppColors.black, fontWeight: FontWeight.w500),
      ),
    );
authOptionsButton(ThemeData theme, List<AuthOptions> authOptionsList) =>
    Expanded(
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: authOptionsList.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                10.sh,
                AppButton(
                  backgroundColor: AppColors.white,
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(authOptionsList[index].icon, color: AppColors.black),
                      10.sw,
                      Text(
                        authOptionsList[index].title,
                        textAlign: TextAlign.left,
                        style: theme.textTheme.titleMedium?.copyWith(
                            color: AppColors.black,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
    );

class AuthOptions {
  final String title;
  final IconData icon;
  AuthOptions({required this.title, required this.icon});
}
