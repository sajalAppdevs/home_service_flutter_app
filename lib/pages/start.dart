import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:home_service_flutter_app/pages/home.dart';

import '../gen/assets.gen.dart';
import '../animation/FadeAnimation.dart';
import '../models/service.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  StartPageState createState() => StartPageState();
}

class StartPageState extends State<StartPage> {
  List<Service> services = [
    Service('Cleaning', Assets.images.cleaning.keyName),
    Service('Plumber', Assets.images.plumber.keyName),
    Service('Electrician', Assets.images.electrition.keyName),
    Service('Painter', Assets.images.painter.keyName),
    Service('Carpenter', Assets.images.carpenter.keyName),
    Service('Gardener', Assets.images.gardener.keyName),
    Service('Tailor', Assets.images.tailor.keyName),
    Service('Maid', Assets.images.maid.keyName),
    Service('Driver', Assets.images.driver.keyName),
  ];

  int selectedService = 4;

  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 2), (timer) {
      setState(() {
        selectedService = Random().nextInt(services.length);
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            height: MediaQuery.of(context).size.height * 0.45,
            width: MediaQuery.of(context).size.width,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.0,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              physics: const NeverScrollableScrollPhysics(),
              itemCount: services.length,
              itemBuilder: (BuildContext context, int index) {
                return FadeAnimation(
                  (1.0 + index) / 4,
                  serviceContainer(
                      services[index].imageURL, services[index].name, index),
                );
              },
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(80),
                    topRight: Radius.circular(80),
                  )),
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  FadeAnimation(
                      1.5,
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Center(
                          child: Text(
                            'Easy, reliable way to take \ncare of your home',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade900,
                            ),
                          ),
                        ),
                      )),
                  const SizedBox(height: 20),
                  FadeAnimation(
                    1.5,
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 60),
                      child: Center(
                        child: Text(
                          'We provide you with the best people to help take care of your home.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  FadeAnimation(
                    1.5,
                    Padding(
                      padding: const EdgeInsets.all(50.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ),
                          );
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: const Center(
                            child: Text(
                              'Get Started',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  serviceContainer(String image, String name, int index) {
    return GestureDetector(
      onTap: () {},
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: selectedService == index ? Colors.white : Colors.grey.shade100,
          border: Border.all(
            color: selectedService == index
                ? Colors.blue.shade100
                : Colors.grey.withOpacity(0),
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(image, height: 30),
            const SizedBox(
              height: 10,
            ),
            Text(
              name,
              style: const TextStyle(fontSize: 14),
            )
          ],
        ),
      ),
    );
  }
}
