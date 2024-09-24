import 'package:everlink_lottery_app/presentation/pages/onboarding/middle_page.dart';
import 'package:everlink_lottery_app/presentation/widgets/background.dart';
import 'package:everlink_lottery_app/presentation/widgets/language_modal_bottom_sheet.dart';
import 'package:everlink_lottery_app/presentation/widgets/logo.dart';
import 'package:everlink_lottery_app/presentation/widgets/pulsing_horizontal_dot_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:solar_icons/solar_icons.dart';

class OnboardingPage extends ConsumerStatefulWidget {
  const OnboardingPage({super.key});

  @override
  ConsumerState<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends ConsumerState<OnboardingPage> {
  @override
  void initState() {
    _checkOnboardingStatus(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  showModalBottomSheet<void>(
                      context: context,
                      builder: (context) {
                        return LanguageModalBottomSheet(context, ref);
                      });
                },
                icon: const Icon(SolarIconsOutline.globus))
          ],
          // centerTitle: true,
          // title: Text(
          //   AppLocalizations.of(context)!.title,
          //   style: GoogleFonts.islandMoments(
          //       fontSize: Theme.of(context).textTheme.displayMedium?.fontSize,
          //       color: Colors.white),
          // ),
          backgroundColor: Colors.transparent,
        ),
        body: CustomBackground(
          child: Container(
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.01,
              bottom: MediaQuery.of(context).size.height * 0.05,
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Logo(),
                SvgPicture.asset('assets/images/undraw_winners.svg',
                    height: MediaQuery.of(context).size.height * 0.4,
                    semanticsLabel: "Bg Shape"),
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.05,
                      bottom: MediaQuery.of(context).size.height * 0.01),
                  child: Text(
                    AppLocalizations.of(context)!.onboardingStartTitle,
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
                    AppLocalizations.of(context)!.onboardingStartDescription,
                    style: Theme.of(context).textTheme.titleMedium,
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: const PulsingHorizontalDotMenu(index: 0),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: ElevatedButton(
                    onPressed: () {
                      context.go('/onboarding_middle');
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (context) => const OnboardingMiddlePage(),
                      //   ),
                      // );
                    },
                    style: const ButtonStyle(
                      padding: WidgetStatePropertyAll(
                          EdgeInsets.symmetric(horizontal: 100, vertical: 15)),
                    ),
                    child: SizedBox(
                      child: Text(
                        AppLocalizations.of(context)!.onboardingContinue,
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

  void _checkOnboardingStatus(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? onboardingComplete = prefs.getBool('onboarding_complete');

    if (onboardingComplete == true) {
      context.push('/home');
    }
  }
}
