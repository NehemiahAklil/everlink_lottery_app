import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class ForwardButton extends StatelessWidget {
  final Function() onTap;

  const ForwardButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: const SizedBox(
        height: 40,
        width: 40,
        child: Icon(
          Ionicons.chevron_forward_outline,
          color: Colors.white,
        ),
      ),
    );
  }
}