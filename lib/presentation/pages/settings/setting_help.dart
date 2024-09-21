import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:everlink_lottery_app/presentation/widgets/background.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Help extends StatefulWidget {
  const Help({super.key});

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
  @override
  Widget build(BuildContext context) {
    const Color softWhite = Color(0xFFF5F5F5);
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.transparent,
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
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Ionicons.chevron_back_outline,
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
                    AppLocalizations.of(context)!.help,
                    style: TextStyle(
                      fontSize: screenWidth * 0.08,
                      fontWeight: FontWeight.bold,
                      color: softWhite,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  padding: EdgeInsets.only(top: 30, left: screenWidth * 0.05, right: screenWidth * 0.05),
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.all(screenWidth * 0.05),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: softWhite.withOpacity(0.5)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.help_text,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: screenWidth * 0.05,
                              height: 1.5,
                              color: softWhite,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            AppLocalizations.of(context)!.help_text1,
                            style: TextStyle(
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
                          Row(
                            children: const [
                              Icon(
                                Icons.phone,
                                color: softWhite,
                              ),
                              SizedBox(width: 12),
                              Text(
                                "0955667788",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: softWhite,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: const [
                              Icon(
                                Icons.email,
                                color: softWhite,
                              ),
                              SizedBox(width: 12),
                              Text(
                                "Example@gmail.com",
                                style: TextStyle(fontSize: 20, color: softWhite),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on,
                                color: softWhite,
                              ),
                              const SizedBox(width: 12),
                              Text(
                                AppLocalizations.of(context)!.mexico,
                                style: const TextStyle(fontSize: 20, color: softWhite),
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