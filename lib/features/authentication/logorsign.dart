import 'package:empapp/features/authentication/login.dart';
import 'package:empapp/features/authentication/signup.dart';
import 'package:flutter/material.dart';

class LogorSign extends StatelessWidget {
  const LogorSign({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/img/logorsign.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 100,
                ),
                const Text(
                  'emission pulse',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                Row(
                  children: [
                    Image.asset(
                      'assets/img/hash.png',
                      height: 100,
                      width: 100,
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Know Your',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          'Emissions',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 55,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 200,
                ),
                Container(
                  height: 200.0,
                  width: 340,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(35.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 100,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (context) => const Login(),
                                    ),
                                  );
                                },
                                child: const Text(
                                  'Log In',
                                  style: TextStyle(
                                    color: Color(0xFF0F0159),
                                    fontSize: 22,
                                  ),
                                ),
                              ),
                            ),
                            Image.asset(
                                "assets/img/line.png",
                                fit: BoxFit.cover,
                              ),
                            SizedBox(
                              width: 100,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => const Signup(),
                                    ),
                                  );
                                },
                                child: const Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    color: Color(0xFF0F0159),
                                    fontSize: 22,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      const SizedBox(
                          width: 280,
                          child: Text(
                              "We guarantee high performance from our devices and software. However, in rare cases, there may be false readings or interpretations of emissions data. Please report such cases to us.",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 10)),
                        ),
                    ],
                  ),
                ),
              ],
            )));
  }
}
