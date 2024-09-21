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
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 45, left: 7),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    context.go('/home');
                    // Navigator.of(context).pop();
                    // Navigator.pop(context);
                  },
                  // icon: Icon(Ionicons.chevron_back_outline,
                  icon: Icon(Icons.arrow_back, color: softWhite),
                  iconSize: 30,
                ),
              ],
            ),
          ),
          const SizedBox(height: 80),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            alignment: Alignment.centerLeft,
            child: Text(
              AppLocalizations.of(context)!.aboutus,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: softWhite,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
            child: Center(
              child: Container(
                padding: const EdgeInsets.only(
                    left: 20, top: 20, right: 30, bottom: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: softWhite.withOpacity(0.5)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Text(
                      AppLocalizations.of(context)!.aboutustext,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        height: 1.5,
                        color: softWhite,
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(
                      AppLocalizations.of(context)!.contactus,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: softWhite,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.phone, color: softWhite),
                        SizedBox(width: 12),
                        Text(
                          "0955667788",
                          style: TextStyle(fontSize: 20, color: softWhite),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.email, color: softWhite),
                        SizedBox(width: 12),
                        Text(
                          "Example@gmail.com",
                          style: TextStyle(fontSize: 20, color: softWhite),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.location_on, color: softWhite),
                        SizedBox(width: 12),
                        Text(
                          AppLocalizations.of(context)!.mexico,
                          style: TextStyle(fontSize: 20, color: softWhite),
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
    );
  }
}
