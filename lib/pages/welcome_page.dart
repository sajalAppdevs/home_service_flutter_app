import 'package:flutter/material.dart';
import 'package:home_service_flutter_app/animation/FadeAnimation.dart';

import '../widgets/build_custom_scaffold.dart';
import '../widgets/build_welcome_button.dart';
import 'signin_page.dart';
import 'signup_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) => BuildCustomScaffold(
        child: Column(
          children: [
            Flexible(
              flex: 8,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 40.0),
                child: Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: 'Welcome Back!\n',
                          style: TextStyle(
                            fontSize: 45.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text:
                              '\nEnter personal details to your employee account',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const Flexible(
              flex: 2,
              child: FadeAnimation(
                1,
                Align(
                  alignment: Alignment.bottomRight,
                  child: Row(
                    children: [
                      Expanded(
                        child: BuildWelcomeButton(
                          buttonText: 'Sign in',
                          onTap: SignInPage(),
                          color: Colors.transparent,
                          textColor: Colors.white,
                        ),
                      ),
                      Expanded(
                        child: BuildWelcomeButton(
                          buttonText: 'Sign up',
                          onTap: SignUpPage(),
                          color: Colors.white,
                          textColor: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
