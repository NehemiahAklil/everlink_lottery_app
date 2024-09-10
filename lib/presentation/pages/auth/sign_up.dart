import 'package:everlink_lottery_app/presentation/pages/auth/widgets/auth_top_bar.dart';
import 'package:everlink_lottery_app/presentation/widgets/background.dart';
import 'package:everlink_lottery_app/presentation/widgets/blurred_text_field.dart';
import 'package:flutter/material.dart';
import 'package:everlink_lottery_app/presentation/pages/auth/login.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:solar_icons/solar_icons.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: CustomBackground(
            child: Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AuthTopBar(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: Text(
                      AppLocalizations.of(context)!.signUpWelcome,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.15,
                    child: Text(
                      AppLocalizations.of(context)!.signUpDescription,
                      style: Theme.of(context).textTheme.titleMedium,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        BlurredTextField(
                          controller: TextEditingController(),
                          hintText: AppLocalizations.of(context)!.emailField,
                          textFieldPrefixIcon: SolarIconsOutline.letter,
                          blurColor: Theme.of(context).primaryColor,
                          blurSigma: 10.0,
                          height: 0.06,
                        ),
                        BlurredTextField(
                          controller: TextEditingController(),
                          hintText: AppLocalizations.of(context)!.passwordField,
                          textFieldPrefixIcon: SolarIconsOutline.lockPassword,
                          blurColor: Theme.of(context).primaryColor,
                          blurSigma: 10.0,
                          height: 0.06,
                          isObscured: true,
                        ),
                        BlurredTextField(
                          controller: TextEditingController(),
                          hintText: AppLocalizations.of(context)!
                              .confirmPasswordField,
                          textFieldPrefixIcon: SolarIconsOutline.lockPassword,
                          blurColor: Theme.of(context).primaryColor,
                          blurSigma: 10.0,
                          height: 0.06,
                          isObscured: true,
                        ),
                      ],
                    ),
                  ),
                  // Login Button
                  Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.05),
                    child: ElevatedButton(
                        onPressed: () {},
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.6,
                          alignment: Alignment.center,
                          child: Text(
                            AppLocalizations.of(context)!.signUpButton,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(color: Colors.black),
                          ),
                        )),
                  ),
                  Expanded(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(AppLocalizations.of(context)!.loginPrompt,
                              style: Theme.of(context).textTheme.titleSmall),
                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const Login(),
                                  ),
                                );
                              },
                              child: Text(
                                AppLocalizations.of(context)!.loginButton,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ))
                        ]),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
