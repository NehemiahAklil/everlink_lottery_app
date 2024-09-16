import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBackground extends StatelessWidget {
  const CustomBackground({super.key, required this.child});
  final Widget child;
  final String assetName = 'assets/background_shape.svg';

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(color: Colors.black),
          child: Stack(clipBehavior: Clip.antiAlias, children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.3),
                  child: ImageFiltered(
                      imageFilter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                      child: SvgPicture.asset(assetName,
                          height: MediaQuery.of(context).size.height * 0.2,
                          semanticsLabel: "Bg Shape")),
                ),
                Container(
                  margin: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height * 0.1),
                  child: ImageFiltered(
                      imageFilter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                      child: SvgPicture.asset(assetName,
                          height: MediaQuery.of(context).size.height * 0.2,
                          semanticsLabel: "Bg Shape")),
                ),
                Container(
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.1,
                      bottom: MediaQuery.of(context).size.height * 0.04),
                  child: ImageFiltered(
                      imageFilter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                      child: SvgPicture.asset(assetName,
                          height: MediaQuery.of(context).size.height * 0.2,
                          semanticsLabel: "Bg Shape")),
                ),
              ],
            ),
          ]),
        ),
        child
      ],
    );
  }
}
