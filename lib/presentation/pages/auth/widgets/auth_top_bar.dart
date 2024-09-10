import 'package:everlink_lottery_app/presentation/widgets/language_modal_bottom_sheet.dart';
import 'package:everlink_lottery_app/presentation/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:solar_icons/solar_icons.dart';

class AuthTopBar extends ConsumerWidget {
  final double height;
  const AuthTopBar({super.key, required this.height});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      alignment: Alignment.topCenter,
      height: height,
      width: MediaQuery.of(context).size.width * 0.9,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Consumer(
            builder: (context, ref, child) {
              return IconButton(
                  onPressed: () {
                    showModalBottomSheet<void>(
                        context: context,
                        builder: (context) {
                          return LanguageModalBottomSheet(context, ref);
                        });
                  },
                  icon: const Icon(SolarIconsOutline.globus));
            },
          ),
          Logo(
            fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
          ),
        ],
      ),
    );
  }
}
