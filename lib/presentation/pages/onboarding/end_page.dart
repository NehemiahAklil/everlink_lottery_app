import 'dart:ui';
import 'package:everlink_lottery_app/presentation/pages/login.dart';
import 'package:everlink_lottery_app/presentation/pages/onboarding/middle_page.dart';
import 'package:everlink_lottery_app/presentation/pages/onboarding/start_page.dart';
import 'package:everlink_lottery_app/presentation/widgets/background.dart';
import 'package:everlink_lottery_app/presentation/widgets/pulsing_horizontal_dot_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingEndPage extends StatefulWidget {
  const OnboardingEndPage({super.key});

  @override
  State<OnboardingEndPage> createState() => _OnboardingEndPageState();
}

class _OnboardingEndPageState extends State<OnboardingEndPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomBackground(
      child: Stack(clipBehavior: Clip.antiAlias, children: [
        Container(
          margin: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.1,
            bottom: MediaQuery.of(context).size.height * 0.05,
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Everlink Lottery",
                style: GoogleFonts.islandMoments(
                    fontSize:
                        Theme.of(context).textTheme.displaySmall?.fontSize,
                    color: Colors.white),
              ),
              SvgPicture.asset('assets/images/undraw_eating_together.svg',
                  height: MediaQuery.of(context).size.height * 0.4,
                  semanticsLabel: "Bg Shape"),
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.05,
                    bottom: MediaQuery.of(context).size.height * 0.01),
                child: Text(
                  "Sign up to get your first ticket",
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
                  "Don’t miss out on turning your house into a dream home.",
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
                      "Get Started",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ]),
    ));
  }
}
