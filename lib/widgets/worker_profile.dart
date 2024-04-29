import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WorkerProfileWidget extends StatefulWidget {
  const WorkerProfileWidget({
    super.key,
    required this.name,
    required this.service,
    required this.image,
    required this.phone,
  });

  final String name;
  final String service;
  final String image;
  final String phone;

  @override
  State<WorkerProfileWidget> createState() => _WorkerProfileWidgetState();
}

class _WorkerProfileWidgetState extends State<WorkerProfileWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 30),
              child: Text(widget.service))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            CircleAvatar(
              radius: 80,
              backgroundImage: NetworkImage(widget.image),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () => whatsapp(widget.phone),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: const Center(
                  child: Text(
                    'Whatsapp',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () => launchUrl(
                Uri.parse('tel://${widget.phone}'),
              ),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: const Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Call',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      SizedBox(width: 10),
                      Icon(
                        Icons.call,
                        size: 20,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

whatsapp(String contact) async {
  var androidUrl = "whatsapp://send?phone=$contact&text=Hi, I need some help";
  var iosUrl =
      "https://wa.me/$contact?text=${Uri.parse('Hi, I need some help')}";

  try {
    if (Platform.isIOS) {
      await launchUrl(Uri.parse(iosUrl));
    } else {
      await launchUrl(Uri.parse(androidUrl));
    }
  } on Exception {
    debugPrint('WhatsApp is not installed.');
  }
}
