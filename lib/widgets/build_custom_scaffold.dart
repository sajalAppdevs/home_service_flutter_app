import 'package:flutter/material.dart';
import '../gen/assets.gen.dart';

class BuildCustomScaffold extends StatelessWidget {
  const BuildCustomScaffold({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        extendBodyBehindAppBar: true,
        body: Stack(
          children: [
            Image.asset(
              Assets.images.background.keyName,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            child,
          ],
        ),
      );
}
