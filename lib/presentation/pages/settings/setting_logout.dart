import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void showLogoutDialog(BuildContext context, Function onLogout) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.black87, 
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), 
          side: const BorderSide(color: Color(0xFFB07A4E)), 
        ),
        title: Text(
          AppLocalizations.of(context)!.logout,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
        content: Text(
          AppLocalizations.of(context)!.logout_text,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white, 
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              AppLocalizations.of(context)!.cancel,
              style: const TextStyle(color: Colors.white), 
            ),
          ),
          TextButton(
            onPressed: () {
              onLogout();
              Navigator.of(context).pop();
            },
            child: Text(
              AppLocalizations.of(context)!.logout,
              style: const TextStyle(color: Colors.white), 
            ),
          ),
        ],
      );
    },
  );
}