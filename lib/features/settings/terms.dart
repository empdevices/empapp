import 'package:flutter/material.dart';

class Terms extends StatelessWidget {
  const Terms({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            'Terms Policy',
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.w300,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primaryFixed,
      ),
      backgroundColor: Theme.of(context).colorScheme.primaryFixed,
      body: Column(
        children: [
          const SizedBox(height: 30.0),
          const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Row(
              children: [
                SizedBox(
                  height: 70,
                )
              ],
            ),
          ),
          const SizedBox(height: 30.0),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: SingleChildScrollView(
                padding:  const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        "Emission Pulse \nOur Terms Policy",
                        style: TextStyle(
                          fontSize: 26.0,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        """
Last Updated: 26th May 2024
                    
Welcome to Emission Pulse! These Terms and Conditions outline the rules and regulations for the use of our device and services. By accessing or using Emission Pulse, you agree to comply with and be bound by these terms. If you do not agree with any part of these terms, please do not use our services.
                    
1. Definitions
                    
  "Service" refers to the use of the Emission  Pulse device and any associated software and services.
                    
  "We," "us," and "our" refer to Emission Pulse.
                    
  "User," "you," and "your" refer to the individual using our Service.
                    
2. Use of Service
                    
  Eligibility:
  You must be at least 18 years old to use our Service. By using our Service, you represent and warrant that you meet this requirement.       
                    """,
                        style: TextStyle(fontSize: 16.0),
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
}
