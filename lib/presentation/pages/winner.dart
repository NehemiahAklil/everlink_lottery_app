import 'package:everlink_lottery_app/presentation/widgets/background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';
import 'package:solar_icons/solar_icons.dart';

class Winner extends StatefulWidget {
  const Winner({super.key});

  @override
  State<Winner> createState() => _WinnerState();
}

class _WinnerState extends State<Winner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: CustomBackground(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        context.go('/home');
                      },
                      icon: Icon(
                        Ionicons.chevron_back_outline,
                        color: Colors.white,
                      ),
                      iconSize: 30,
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(SolarIconsBold.bell,
                              color: Colors.white, size: 36.0),
                          onPressed: () {
                           
                          },
                        ),
                        const SizedBox(width: 15),
                        
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 26),
                Container(
                  width: MediaQuery.of(context).size.width * 1.2,
                  height: MediaQuery.of(context).size.height * 0.22,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage('assets/cup.png'),
                      alignment: Alignment.centerLeft,
                    ),
                    border: Border.all(
                      color: const Color(0xFFD7B58D),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.35,
                      top: MediaQuery.of(context).size.height * 0.03,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.winnertext,
                          style: const TextStyle(fontSize: 25),
                        ),
                        const SizedBox(height: 13),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Column(
                  children: [
                    _buildWinnerItem(
                      context,
                      AppLocalizations.of(context)!.sofa,
                      'assets/sofa.jpeg',
                      '56', 
                    ),
                    const SizedBox(height: 15),
                   
                    _buildWinnerItem(
                      context,
                      AppLocalizations.of(context)!.diningtable,
                      'assets/diningtable.jpg',
                      '7', 
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWinnerItem(BuildContext context, String title, String imagePath, String winnerNumber) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.25,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SizedBox(width: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.black54.withOpacity(0.8),
                border: Border.all(
                  color: const Color(0xFFD7B58D),
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                '${AppLocalizations.of(context)!.winnernumber}: $winnerNumber',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(width: 10),
          ],
        ),
      ],
    );
  }
}
