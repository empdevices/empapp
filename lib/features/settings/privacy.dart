import 'package:flutter/material.dart';

class Privacy extends StatelessWidget {
  const Privacy({super.key});

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
            'Privacy Policy',
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.w300,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Column(
        children: [
          const SizedBox(height: 30.0),
          const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Row(
              children: [
                Text(
                  "Privacy Policies",
                  style: TextStyle(fontSize: 30.0, color: Colors.white),
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
              child: const SingleChildScrollView(
                padding:  EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    Center(
                      child: Text(
                        "Emission Pulse \nOur Privacy Policy",
                        style: TextStyle(
                          fontSize: 26.0,
                          color: Color(0xFF0F0159),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        """
Last Updated: 26th MAY 2024
                    
Welcome to Emission Pulse! Your privacy is critically important to us. This Privacy Policy outlines our policies and procedures on the collection, use, and disclosure of your information when you use our device and services. By using Emission Pulse, you agree to the collection and use of information in accordance with this policy.
                      
1. Information We Collect
                    
  Personal Information:
    - When you register for an account or use our device, we may collect personal information such as your name, email address, phone number, and vehicle identification number (VIN).
                    
  Usage Data:
    - We collect data on how the device is used, including but not limited to the duration and frequency of usage, diagnostic data, and performance metrics.
                    
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
