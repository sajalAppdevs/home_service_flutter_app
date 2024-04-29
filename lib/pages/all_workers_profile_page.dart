import 'package:flutter/material.dart';
import 'package:home_service_flutter_app/widgets/worker_profile.dart';

import '../animation/FadeAnimation.dart';

class AllWorkersProfilesPage extends StatefulWidget {
  const AllWorkersProfilesPage({super.key});

  @override
  State<AllWorkersProfilesPage> createState() => _AllWorkersProfilesPageState();
}

class _AllWorkersProfilesPageState extends State<AllWorkersProfilesPage> {
  List<dynamic> workers = [
    [
      'Isabel Kirkland',
      'Plumber',
      'https://images.pexels.com/photos/355164/pexels-photo-355164.jpeg?crop=faces&fit=crop&h=200&w=200&auto=compress&cs=tinysrgb',
      '+923062207871',
    ],
    [
      'Alfredo Schafer',
      'Electrician',
      'https://images.unsplash.com/photo-1506803682981-6e718a9dd3ee?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&s=c3a31eeb7efb4d533647e3cad1de9257',
      '+923106364191',
    ],
    [
      'Michelle Baldwin',
      'Cleaner',
      'https://images.unsplash.com/photo-1603415526960-f7e0328c63b1?q=80&w=3270&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      '+923246812372',
    ],
    [
      'Brenon Kalu',
      'Driver',
      'https://images.unsplash.com/photo-1463453091185-61582044d556?q=80&w=3270&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      '+923067662650',
    ],
    [
      'Isabel Kirkland',
      'Plumber',
      'https://images.pexels.com/photos/355164/pexels-photo-355164.jpeg?crop=faces&fit=crop&h=200&w=200&auto=compress&cs=tinysrgb',
      '+923360901633',
    ],
    [
      'Alfredo Schafer',
      'Electrician',
      'https://images.unsplash.com/photo-1506803682981-6e718a9dd3ee?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&s=c3a31eeb7efb4d533647e3cad1de9257',
      '+923176252929',
    ],
    [
      'Michelle Baldwin',
      'Cleaner',
      'https://images.unsplash.com/photo-1603415526960-f7e0328c63b1?q=80&w=3270&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      '+923089734238',
    ],
    [
      'Brenon Kalu',
      'Driver',
      'https://images.unsplash.com/photo-1463453091185-61582044d556?q=80&w=3270&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    ],
    [
      'Brenon Kalu',
      'Driver',
      'https://images.unsplash.com/photo-1463453091185-61582044d556?q=80&w=3270&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      '+923068762924',
    ],
    [
      'Isabel Kirkland',
      'Plumber',
      'https://images.pexels.com/photos/355164/pexels-photo-355164.jpeg?crop=faces&fit=crop&h=200&w=200&auto=compress&cs=tinysrgb',
      '+923471420432',
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Services Providers'),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => WorkerProfileWidget(
                name: workers[index][0],
                service: workers[index][1],
                image: workers[index][2],
                phone: workers[index][3],
              ),
            ),
          ),
          child: FadeAnimation(
              1.2,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  height: 180,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        offset: const Offset(0, 4),
                        blurRadius: 10.0,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Image.network(
                              workers[index][2],
                              width: 70,
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                workers[index][0],
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                workers[index][1],
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.7),
                                    fontSize: 18),
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(15.0)),
                        child: const Center(
                          child: Text(
                            'View Profile',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
