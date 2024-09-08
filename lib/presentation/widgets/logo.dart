import 'package:everlink_lottery_app/domain/value_objects/language.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Logo extends StatelessWidget {
  final double? fontSize;
  const Logo({super.key, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Localizations.override(
      context: context,
      locale: Locale(Language.english.code),
      child: Builder(builder: (context) {
        return Text(
          AppLocalizations.of(context)!.title,
          style: GoogleFonts.islandMoments(
              fontSize: fontSize ??
                  Theme.of(context).textTheme.displayMedium?.fontSize,
              color: Colors.white),
        );
      }),
    );
  }
}
