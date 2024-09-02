import 'dart:ui';

import 'package:everlink_lottery_app/presentation/widgets/background.dart';
import 'package:everlink_lottery_app/presentation/widgets/blurred_text_field.dart';
import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: CustomBackground(
            child: Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.topRight,
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Text(
                      "Logo",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.15,
                    child: Text(
                      "Welcome Back",
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.25,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        BlurredTextField(
                          controller: TextEditingController(),
                          hintText: "Email",
                          textFieldPrefixIcon: SolarIconsOutline.letter,
                          blurColor: Theme.of(context).primaryColor,
                          blurSigma: 100.0,
                          height: 0.06,
                        ),
                        BlurredTextField(
                          controller: TextEditingController(),
                          hintText: "Password",
                          textFieldPrefixIcon: SolarIconsOutline.lockPassword,
                          blurColor: Theme.of(context).primaryColor,
                          blurSigma: 100.0,
                          height: 0.06,
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.only(
                              right: MediaQuery.of(context).size.width * 0.05),
                          child: Text("Forgot password?"),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.05),
                    child: ElevatedButton(
                        onPressed: () {},
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.6,
                          alignment: Alignment.center,
                          child: Text(
                            "Login",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(color: Colors.black),
                          ),
                        )),
                  ),
                  Expanded(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("First time? ",
                              style: Theme.of(context).textTheme.titleSmall),
                          GestureDetector(
                              onTap: () {
                                print("hey");
                              },
                              child: Text(
                                "Sign Up",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ))
                        ]),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
