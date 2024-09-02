// import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
import 'dart:ui';

import 'package:solar_icons/solar_icons.dart';

// class BlurredTextField extends StatelessWidget {
//   final TextEditingController controller;
//   final String hintText;

//   const BlurredTextField({
//     super.key,
//     required this.controller,
//     required this.hintText,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return OverflowBox(
//       maxHeight: MediaQuery.of(context).size.height * 0.08,
//       child: Stack(
//         children: [
//           // Blurred red background container
//           Container(
//             height: MediaQuery.of(context).size.height * 0.05,
//             padding: EdgeInsets.symmetric(vertical: 10, horizontal: 100),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.all(Radius.circular(20)),
//               color: Theme.of(context).primaryColor.withOpacity(0.1),
//             ),
//             child: BackdropFilter(
//               filter: ImageFilter.blur(
//                   sigmaX: 10.0, sigmaY: 10.0, tileMode: TileMode.repeated),
//               child: Container(
//                 height: MediaQuery.of(context).size.height * 0.05,
//                 // Transparent container to prevent further blurring
//                 color: Colors.transparent,
//               ),
//             ),
//           ),
//           TextField(
//             controller: controller,
//             decoration: InputDecoration(
//               border: const OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(20))),
//               contentPadding:
//                   EdgeInsets.symmetric(vertical: 10, horizontal: 100),
//               fillColor: Theme.of(context).primaryColor,
//               hintText: hintText,
//               hintStyle: TextStyle(color: Colors.white),
//               prefixIcon: Icon(SolarIconsOutline.letter, color: Colors.grey),
//             ),
//             style: TextStyle(color: Colors.white),
//           ),

//           // Hint text as a separate Text widget
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class BlurredTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Color blurColor;
  final double blurSigma;
  final double height;
  final IconData textFieldPrefixIcon;
  const BlurredTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.blurColor,
    required this.blurSigma,
    required this.height,
    required this.textFieldPrefixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(20)),
          clipBehavior: Clip.hardEdge,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma),
            child: Container(
              color: Colors.white.withOpacity(0.15),
              // Your container content here
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * height,
          width: MediaQuery.of(context).size.width,
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 100),
              fillColor: Colors.transparent,
              enabledBorder: InputBorder.none,
              hintText: hintText,
              hintStyle: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: Colors.white),
              prefixIcon: Icon(textFieldPrefixIcon, color: Colors.white),
            ),
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
