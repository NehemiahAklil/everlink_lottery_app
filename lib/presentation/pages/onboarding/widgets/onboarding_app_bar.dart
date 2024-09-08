import 'package:everlink_lottery_app/presentation/widgets/language_modal_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solar_icons/solar_icons.dart';

class OnboardingAppBar extends AppBar {
  final WidgetRef ref;
  OnboardingAppBar(
    this.ref, {
    super.key,
  }) : super(
          leading: Builder(builder: (context) {
            return IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(
                  SolarIconsOutline.altArrowLeft,
                  color: Theme.of(context).primaryColor,
                ));
          }),
          actions: [
            Builder(builder: (context) {
              return IconButton(
                  onPressed: () {
                    showModalBottomSheet<void>(
                        context: context,
                        builder: (context) {
                          return LanguageModalBottomSheet(context, ref);
                        });
                  },
                  icon: const Icon(SolarIconsOutline.globus));
            })
          ],
          backgroundColor: Colors.transparent,
          // title: Builder(builder: (context) {
          //   return Text(
          //     'Everlink Lottery',
          //     style: GoogleFonts.islandMoments(
          //         fontSize:
          //             Theme.of(context).textTheme.headlineLarge?.fontSize,
          //         color: Colors.white),
          //   );
          // }),
          // centerTitle: true
        );
}
