import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void showLogoutDialog(BuildContext context, Function onLogout) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
         AppLocalizations.of(context)!.logout,
          style: TextStyle(
            fontWeight: FontWeight.w400,
          ),
        ),
        content: Text(AppLocalizations.of(context)!.logout_text,
            style: TextStyle(
              fontSize: 18,
            )),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(AppLocalizations.of(context)!.cancel),
          ),
          TextButton(
            onPressed: () {
              onLogout();
              Navigator.of(context).pop();
            },
            child: Text(AppLocalizations.of(context)!.logout),
          ),
        ],
      );
    },
  );
}
