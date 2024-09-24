import 'package:everlink_lottery_app/application/user_provider.dart';
import 'package:everlink_lottery_app/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:solar_icons/solar_icons.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  String selectedFurniture = 'Sofa';
  Color buttonColor = const Color(0xD99D926E);

  void onSofaButtonPressed() {
    setState(() {
      selectedFurniture = 'Sofa';
    });
  }

  void onKitchencabinetButtonPressed() {
    setState(() {
      selectedFurniture = 'Kitchen Cabinet';
    });
  }

  void onDiningTableButtonPressed() {
    setState(() {
      selectedFurniture = 'Dining Table';
    });
  }

  void onTvStandButtonPressed() {
    setState(() {
      selectedFurniture = 'Tv Stand';
    });
  }

  @override
  Widget build(BuildContext context) {
    String emailName = extractBeforeAt(ref.watch(userNotifierProvider)?.email ?? "");


    String imagePath;
    switch (selectedFurniture) {
      case 'Sofa':
        imagePath = 'assets/sofa.jpeg';
        break;
      case 'Kitchen Cabinet':
        imagePath = 'assets/kitchencabinet.jpg';
        break;
      case 'Dining Table':
        imagePath = 'assets/diningtable.jpg';
        break;
      case 'Tv Stand':
        imagePath = 'assets/TvStand.png';
        break;
      default:
        imagePath = 'assets/sofa.jpeg';
    }

    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(SolarIconsBold.bell,
                      color: Colors.white, size: 36.0),
                  onPressed: () {},
                ),
                const SizedBox(width: 15),
                IconButton(
                  icon: const Icon(SolarIconsOutline.hamburgerMenu,
                      color: Colors.white, size: 36.0),
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                ),
              ],
            ),
            const SizedBox(height: 26,),
            Container(
              width: MediaQuery.of(context).size.width * 1.2,
              height: MediaQuery.of(context).size.height * 0.22,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage('assets/cup.png'),
                  alignment: Alignment.centerLeft,
                ),
                border: Border.all(
                  color: Color(0xFFD7B58D),
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.24,
                  top: MediaQuery.of(context).size.height * 0.03,
                ),
                child: Column(
                  children: [
                    Text(AppLocalizations.of(context)!.welcomeback, style: const TextStyle(fontSize: 25),),
                    const SizedBox(height: 13,),
                    Text(AppLocalizations.of(context)!.transformyourhome, style: TextStyle(fontSize: 17),),
                    Text(AppLocalizations.of(context)!.withourstunning, style: TextStyle(fontSize: 17),),
                     Text(AppLocalizations.of(context)!.furniture, style: TextStyle(fontSize: 17),),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 25,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: onSofaButtonPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedFurniture == AppLocalizations.of(context)!.sofa ? Colors.transparent : buttonColor,
                      foregroundColor: const Color(0xffffffff),
                      side: const BorderSide(color: Color(0xFFD7B58D)),
                    ),
                    child: Text(AppLocalizations.of(context)!.sofa),
                  ),
                  const SizedBox(width: 7,),
                  ElevatedButton(
                    onPressed: onKitchencabinetButtonPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedFurniture == AppLocalizations.of(context)!.kitchencabinet ? Colors.transparent : buttonColor,
                      foregroundColor: const Color(0xffffffff),
                      side: const BorderSide(color: Color(0xFFD7B58D)),
                    ),
                    child: Text(AppLocalizations.of(context)!.kitchencabinet),
                  ),
                  const SizedBox(width: 7,),
                  ElevatedButton(
                    onPressed: onDiningTableButtonPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedFurniture == AppLocalizations.of(context)!.diningtable ? Colors.transparent: buttonColor,
                      foregroundColor: const Color(0xffffffff),
                      side: const BorderSide(color: Color(0xFFD7B58D)),
                    ),
                    child: Text(AppLocalizations.of(context)!.diningtable),
                  ),
                  const SizedBox(width: 7,),
                  ElevatedButton(
                    onPressed: onTvStandButtonPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedFurniture == AppLocalizations.of(context)!.tvstand ? Colors.transparent : buttonColor,
                      foregroundColor: const Color(0xffffffff),
                      side: const BorderSide(color: Color(0xFFD7B58D)),
                    ),
                    child:  Text(AppLocalizations.of(context)!.welcomeback),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25,),

            Container(
              padding: const EdgeInsets.only(top: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  imagePath,
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.3,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}