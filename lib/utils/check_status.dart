import 'package:flutter/material.dart';
import 'package:home_service_flutter_app/pages/home_page.dart';
import 'package:home_service_flutter_app/pages/start_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../pages/welcome_page.dart';

class CheckStatus extends StatelessWidget {
  const CheckStatus({super.key});

  Future<bool> checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final uid = prefs.getString('uid');
    if (uid == null) return false;
    return true;
  }

  @override
  Widget build(BuildContext context) => FutureBuilder(
        future: checkLoginStatus(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.data == false) {
            return const WelcomePage();
          }
          return const HomePage();
        },
      );
}
