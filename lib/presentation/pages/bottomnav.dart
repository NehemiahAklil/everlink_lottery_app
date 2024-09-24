import 'package:everlink_lottery_app/presentation/providers/page_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:solar_icons/solar_icons.dart';

class BottomNav extends ConsumerWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = [
      SalomonBottomBarItem(
        icon: const Icon(SolarIconsBold.home),
        title: Text(AppLocalizations.of(context)!.home),
      ),
      SalomonBottomBarItem(
        icon: const Icon(SolarIconsBold.ticket),
        title: Text(AppLocalizations.of(context)!.ticket),
      ),
      SalomonBottomBarItem(
        icon: const Icon(SolarIconsBold.infoCircle),
        title: Text(AppLocalizations.of(context)!.aboutus),
      ),
      SalomonBottomBarItem(
        icon: const Icon(Ionicons.settings),
        title: Text(AppLocalizations.of(context)!.settings),
      ),
    ];

    final currentIndex = ref.watch(pageIndexProvider);

    return ClipRRect(
      child: SalomonBottomBar(
        items: items,
        currentIndex: currentIndex,
        onTap: (index) {
          if (index == currentIndex) {
            return;
          }

          ref.read(pageIndexProvider.notifier).setIndex(index);

          switch (index) {
            case 1:
              context.go('/ticket');
              break;
            case 2:
              context.go('/info');
              break;
            case 3:
              context.go('/settings');
              break;
            case 0:
            default:
              context.go('/home');
              break;
          }
        },
        selectedItemColor: const Color(0xFFD7B58D),
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.black87,
      ),
    );
  }
}
