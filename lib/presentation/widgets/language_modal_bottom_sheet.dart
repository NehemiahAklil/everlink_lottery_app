import 'package:everlink_lottery_app/application/locale_provider.dart';
import 'package:everlink_lottery_app/domain/value_objects/language.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:solar_icons/solar_icons.dart';

Widget LanguageModalBottomSheet(BuildContext context, WidgetRef ref) {
  final localeNotifier = ref.read(localeStateProvider.notifier);
  final locale = ref.watch(localeStateProvider);
  return SingleChildScrollView(
    child: Container(
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("App Language", style: Theme.of(context).textTheme.bodyLarge),
          ListView.builder(
              shrinkWrap: true,
              itemCount: Language.values.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {
                      localeNotifier.changeLocale(Language.values[index]);
                      Navigator.pop(context);
                    },
                    child: ListTile(
                      title: Text(
                        Language.values[index].name,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      // leading: Icon(SolarIconsOutline.pinCircle,
                      leading: Icon(
                          locale != Language.values[index]
                              ? SolarIconsOutline.pinCircle
                              : SolarIconsOutline.checkCircle,
                          color: locale != Language.values[index]
                              ? Theme.of(context).primaryColor.withOpacity(0.5)
                              : Theme.of(context).primaryColor),
                    ));
              }),
        ],
      ),
    ),
  );
}
