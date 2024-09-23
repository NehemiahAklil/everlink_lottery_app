// import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
//
// class LanguageSelectionDialog extends StatelessWidget {
//   final ValueChanged<String> onLanguageSelected;
//   final String selectedLanguage;
//
//   const LanguageSelectionDialog({
//     super.key,
//     required this.onLanguageSelected,
//     this.selectedLanguage = 'English',
//   });
//   final softWhite = const Color(0xFFF5F5F5);
//
//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.black87,
//           border: Border.all(color: const Color(0xFFB07A4E)),
//           borderRadius: BorderRadius.circular(50),
//         ),
//         width: 350,
//         height: 155,
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(top: 16.0, left: 16, right: 16, bottom: 7),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     AppLocalizations.of(context)!.selectlanguage,
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: softWhite),
//                   ),
//                   DropdownButton<String>(
//                     value: selectedLanguage,
//                     onChanged: (String? newValue) {
//                       if (newValue != null) {
//                         onLanguageSelected(newValue);
//                       }
//                     },
//                     items: ['English', 'አማርኛ'].map<DropdownMenuItem<String>>((String language) {
//                       return DropdownMenuItem<String>(
//                         value: language,
//                         child: Text(language, style: TextStyle(color: softWhite)),
//                       );
//                     }).toList(),
//                     dropdownColor: Colors.black54,
//
//                   ),
//                 ],
//               ),
//             ),
//
//             const SizedBox(height: 20),
//
//             TextButton(
//               child: Text(AppLocalizations.of(context)!.cancel, style: TextStyle(color: softWhite, fontSize: 18)),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }