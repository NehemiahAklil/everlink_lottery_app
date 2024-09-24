import 'package:everlink_lottery_app/presentation/pages/auth/sign_up.dart';
import 'package:everlink_lottery_app/presentation/pages/bottomnav.dart';
import 'package:everlink_lottery_app/presentation/pages/home.dart';
import 'package:everlink_lottery_app/presentation/pages/ticketpage.dart';
import 'package:everlink_lottery_app/presentation/widgets/background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class Aboutus extends StatefulWidget {
  const Aboutus({super.key});

  @override
  State<Aboutus> createState() => _AboutusState();
}

class _AboutusState extends State<Aboutus> {
  @override
  Widget build(BuildContext context) {
    const Color softWhite = Color(0xFFF5F5F5);
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: CustomBackground(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(screenWidth * 0.04),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 35, left: screenWidth * 0.02),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          context.go('/home');
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: softWhite,
                        ),
                        iconSize: screenWidth * 0.075,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 18),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    AppLocalizations.of(context)!.aboutus,
                    style: TextStyle(
                      fontSize: screenWidth * 0.08,
                      fontWeight: FontWeight.bold,
                      color: softWhite,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.only(
                      top: 30,
                      left: screenWidth * 0.05,
                      right: screenWidth * 0.05),
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: screenWidth * 0.05,
                        horizontal: screenWidth * 0.075,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: softWhite.withOpacity(0.5)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.aboutustext,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: screenWidth * 0.05,
                              height: 1.5,
                              color: softWhite,
                            ),
                          ),
                          const SizedBox(height: 30),
                          Text(
                            AppLocalizations.of(context)!.contactus,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: screenWidth * 0.06,
                              color: softWhite,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Row(
                            children: [
                              Icon(Icons.phone, color: softWhite),
                              SizedBox(width: 12),
                              Text(
                                "0955667788",
                                style:
                                    TextStyle(fontSize: 20, color: softWhite),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Row(
                            children: [
                              Icon(Icons.email, color: softWhite),
                              SizedBox(width: 12),
                              Text(
                                "Example@gmail.com",
                                style:
                                    TextStyle(fontSize: 20, color: softWhite),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              const Icon(Icons.location_on, color: softWhite),
                              const SizedBox(width: 12),
                              Text(
                                AppLocalizations.of(context)!.mexico,
                                style: const TextStyle(
                                    fontSize: 20, color: softWhite),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
