import 'package:everlink_lottery_app/config/router/routes.dart';
import 'package:everlink_lottery_app/presentation/pages/onboarding/widgets/onboarding_app_bar.dart';
import 'package:everlink_lottery_app/presentation/widgets/background.dart';
import 'package:everlink_lottery_app/presentation/widgets/logo.dart';
import 'package:everlink_lottery_app/presentation/widgets/pulsing_horizontal_dot_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingEndPage extends ConsumerWidget {
  const OnboardingEndPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: OnboardingAppBar(ref),
        body: CustomBackground(
          child: Container(
            margin: EdgeInsets.only(
              // top: MediaQuery.of(context).size.height * 0.01,
              bottom: MediaQuery.of(context).size.height * 0.05,
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Logo(),
                Container(
                  margin: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.05),
                  child: SvgPicture.asset(
                      'assets/images/undraw_eating_together.svg',
                      height: MediaQuery.of(context).size.height * 0.3,
                      semanticsLabel: "Bg Shape"),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.05,
                      bottom: MediaQuery.of(context).size.height * 0.01),
                  child: Text(
                    AppLocalizations.of(context)!.onboardingEndTitle,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.height * 0.03),
                  child: Text(
                    AppLocalizations.of(context)!.onboardingEndDescription,
                    style: Theme.of(context).textTheme.titleMedium,
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: const PulsingHorizontalDotMenu(index: 2)),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: ElevatedButton(
                    onPressed: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      await prefs.setBool('onboarding_complete', true);
                      router.go('/home');
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (context) => const Login(),
                      //   ),
                      // );
                    },
                    style: const ButtonStyle(
                      padding: WidgetStatePropertyAll(
                          EdgeInsets.symmetric(horizontal: 100, vertical: 15)),
                    ),
                    child: SizedBox(
                      child: Text(
                        AppLocalizations.of(context)!.onboardingEnd,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
