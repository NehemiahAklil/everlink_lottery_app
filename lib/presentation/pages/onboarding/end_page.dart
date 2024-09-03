import 'dart:ui';
import 'package:everlink_lottery_app/presentation/pages/login.dart';
import 'package:everlink_lottery_app/presentation/widgets/background.dart';
import 'package:everlink_lottery_app/presentation/widgets/language_modal_bottom_sheet.dart';
import 'package:everlink_lottery_app/presentation/widgets/pulsing_horizontal_dot_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:solar_icons/solar_icons.dart';

class OnboardingEndPage extends ConsumerWidget {
  const OnboardingEndPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          centerTitle: true,
          title: Text(
            AppLocalizations.of(context)!.title,
            style: GoogleFonts.islandMoments(
                fontSize: Theme.of(context).textTheme.headlineMedium?.fontSize,
                color: Colors.white),
          ),
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
                Container(
                  margin: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.05),
                  child: SvgPicture.asset(
                      'assets/images/undraw_eating_together.svg',
                      height: MediaQuery.of(context).size.height * 0.35,
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
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                      );
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
