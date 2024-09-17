import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LanguageSelectionDialog extends StatelessWidget {
  final ValueChanged<String> onLanguageSelected;
  final String selectedLanguage;

  const LanguageSelectionDialog({
    Key? key,
    required this.onLanguageSelected,
    this.selectedLanguage = 'English',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        width: 350,
        height: 150,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16.0, left: 16, right: 16, bottom: 7),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.selectlanguage,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  DropdownButton<String>(
                    value: selectedLanguage,
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        onLanguageSelected(newValue);
                      }
                    },
                    items: ['English', 'አማርኛ'].map<DropdownMenuItem<String>>((String language) {
                      return DropdownMenuItem<String>(
                        value: language,
                        child: Text(language),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            TextButton(
              child: Text(AppLocalizations.of(context)!.cancel),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
