import 'package:flutter/material.dart';
import 'package:settings/presentation/pages/forward_button.dart';

class Settingsitem extends StatelessWidget {
  final String title;
  final Color bgcolor;
  final Color iconColor;
  final IconData icon;
  final Function() onTap;
  final String? value;

  const Settingsitem({
    super.key,
    required this.title,
    required this.bgcolor,
    required this.iconColor,
    required this.icon,
    required this.onTap,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    final Color softWhite = Color(0xFFF5F5F5);
    return SizedBox(
      width: double.infinity,
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: bgcolor,
            ),
            child: Icon(icon),
          ),
          const SizedBox(width: 20),
          Text(
            title,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w500,
              color: softWhite,
            ),
          ),
          const Spacer(flex: 30),
          value != null
              ? Text(
                  value!,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey,
                  ),
                )
              : const SizedBox(width: 18),
          Forwardbutton(onTap: onTap),
        ],
      ),
    );
  }
}
