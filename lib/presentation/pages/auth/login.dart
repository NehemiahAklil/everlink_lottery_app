import 'package:everlink_lottery_app/application/authentication_provider.dart';
import 'package:everlink_lottery_app/application/user_provider.dart';
import 'package:everlink_lottery_app/presentation/pages/auth/widgets/auth_top_bar.dart';
import 'package:everlink_lottery_app/presentation/providers/auth_field_controller_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:everlink_lottery_app/presentation/widgets/background.dart';
import 'package:everlink_lottery_app/presentation/widgets/blurred_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:solar_icons/solar_icons.dart';

class Login extends ConsumerWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(authNotifierProvider, (previous, next) {
      next.maybeWhen(
        orElse: () {
          String? email = ref.watch(userNotifierProvider)?.email;
          if (email != null) {
            print(email);
            // return email;
          }
          return null;
        },
        authenticated: (user) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('User Authenticated'),
            behavior: SnackBarBehavior.floating,
            duration: Duration(milliseconds: 500),
          ));
          debugPrint("ON LOGIN");
          debugPrint(user.email);
          ref.read(userNotifierProvider.notifier).set(user);
          context.go("/ticket");
          ref.read(authFieldsNotifierProvider.notifier).clear();
        },
        unauthenticated: (message) =>
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(message!),
          behavior: SnackBarBehavior.floating,
          duration: const Duration(milliseconds: 700),
        )),
      );
    });
    ref.read(authFieldsNotifierProvider.notifier).setLogin();
    final authFields = ref.watch(authFieldsNotifierProvider);
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
                          controller:
                              ref.watch(authFieldsNotifierProvider).email,
                          hintText: AppLocalizations.of(context)!.emailField,
                          textFieldPrefixIcon: SolarIconsOutline.letter,
                          blurColor: Theme.of(context).primaryColor,
                          blurSigma: 100.0,
                          height: 0.06,
                        ),
                        BlurredTextField(
                          controller:
                              ref.watch(authFieldsNotifierProvider).password,
                          hintText: AppLocalizations.of(context)!.passwordField,
                          textFieldPrefixIcon: SolarIconsOutline.lockPassword,
                          blurColor: Theme.of(context).primaryColor,
                          blurSigma: 100.0,
                          height: 0.06,
                          isObscured: true,
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
                        onPressed: () {
                          ref.read(authNotifierProvider.notifier).login(
                              email: authFields.email.text,
                              password: authFields.password.text);
                          // context.go('/home');
                          // ref
                          //     .read(authFieldsNotifierProvider(true).notifier)
                          //     .clear();
                        },
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
                  // Center(child: SignInButton(Buttons.),),
                  Container(
                      margin: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.05,
                      ),
                      child: GestureDetector(
                        onTap: () => {
                          ref
                              .read(authNotifierProvider.notifier)
                              .continueWithGoogle(),
                          debugPrint('Google Sign Up')
                        },
                        child: SvgPicture.asset(
                            'assets/images/android_dark_rd_ctn.svg',
                            width: MediaQuery.of(context).size.width * 0.6,
                            semanticsLabel: "Continue with Google"),
                      )),
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
                                context.push('/signup');
                                // Navigator.of(context).push(
                                //   MaterialPageRoute(
                                //     builder: (context) => const SignUp(),
                                //   ),
                                // );
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
