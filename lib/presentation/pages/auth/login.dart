import 'package:everlink_lottery_app/presentation/pages/auth/widgets/auth_top_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:everlink_lottery_app/presentation/pages/auth/sign_up.dart';
import 'package:everlink_lottery_app/presentation/widgets/background.dart';
import 'package:everlink_lottery_app/presentation/widgets/blurred_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:solar_icons/solar_icons.dart';

class Login extends ConsumerStatefulWidget {
  const Login({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: CustomBackground(
            child: Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AuthTopBar(
                    height: MediaQuery.of(context).size.height * 0.2,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.15,
                    child: Text(
                      AppLocalizations.of(context)!.loginWelcome,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.25,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        BlurredTextField(
                          controller: TextEditingController(),
                          hintText: AppLocalizations.of(context)!.emailField,
                          textFieldPrefixIcon: SolarIconsOutline.letter,
                          blurColor: Theme.of(context).primaryColor,
                          blurSigma: 100.0,
                          height: 0.06,
                        ),
                        BlurredTextField(
                          controller: TextEditingController(),
                          hintText: AppLocalizations.of(context)!.passwordField,
                          textFieldPrefixIcon: SolarIconsOutline.lockPassword,
                          blurColor: Theme.of(context).primaryColor,
                          blurSigma: 100.0,
                          height: 0.06,
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.only(
                              right: MediaQuery.of(context).size.width * 0.05),
                          child: Text(
                            AppLocalizations.of(context)!.forgetPasswordPrompt,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.05),
                    child: ElevatedButton(
                        onPressed: () {},
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.6,
                          alignment: Alignment.center,
                          child: Text(
                            AppLocalizations.of(context)!.loginButton,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(color: Colors.black),
                          ),
                        )),
                  ),
                  Expanded(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(AppLocalizations.of(context)!.signUpPrompt,
                              style: Theme.of(context).textTheme.titleSmall),
                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const SignUp(),
                                  ),
                                );
                              },
                              child: Text(
                                AppLocalizations.of(context)!.signUpButton,
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
