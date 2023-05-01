import 'package:flutter/material.dart';
import 'package:organic_farm/features/authentication/views/login_form_view.dart';

import '../../constants/constants.dart';
import '../../widgets/widgets.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: AppColors.grey50,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              welcomeImage(),
              15.sh,
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  welcomePageTitle(theme),
                  10.sh,
                  welcomePageSubTitle(theme),
                  30.sh,
                  mainButton(theme, context), //Get Started
                  10.sh,
                  subMainButton(theme), // I already have an account
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

welcomeImage() => Image.asset(AppImages.welcomeImage);

welcomePageTitle(ThemeData theme) => Text(
      AppConstants.welcomePageTitle,
      textAlign: TextAlign.center,
      style:
          theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w800),
    );

welcomePageSubTitle(ThemeData theme) => Text(
      AppConstants.welcomePageParagraph,
      textAlign: TextAlign.center,
      style: theme.textTheme.titleMedium?.copyWith(
        color: AppColors.textGrey,
      ),
    );

mainButton(ThemeData theme, BuildContext context) => AppButton(
      onPressed: () {
        OverLayHelper.modalBottomSheet(context,
            builder: (context) => const LoginFormView());
      },
      child: Text(
        AppConstants.getStarted,
        textAlign: TextAlign.center,
        style: theme.textTheme.titleMedium
            ?.copyWith(color: AppColors.black, fontWeight: FontWeight.w500),
      ),
    );
subMainButton(ThemeData theme) => AppButton(
      backgroundColor: AppColors.white,
      onPressed: () {},
      child: Text(
        AppConstants.alreadyHaveAnAccountSmallCase,
        textAlign: TextAlign.center,
        style: theme.textTheme.titleMedium
            ?.copyWith(color: AppColors.black, fontWeight: FontWeight.w500),
      ),
    );
