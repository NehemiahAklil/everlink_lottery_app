import 'dart:ui';
import 'package:flutter/material.dart';

class BlurredTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Color blurColor;
  final double blurSigma;
  final double height;
  final IconData textFieldPrefixIcon;
  final bool? isObscured;
  const BlurredTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.blurColor,
    required this.blurSigma,
    required this.height,
    required this.textFieldPrefixIcon,
    this.isObscured,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(25)),
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
            obscureText: isObscured ?? false,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
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
