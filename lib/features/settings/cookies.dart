import 'package:flutter/material.dart';

class Cookies extends StatelessWidget {
  const Cookies({super.key});

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
            'Cookies Policy',
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
              child:  SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        "Emission Pulse \nOur Cookies Policy",
                        style: TextStyle(
                          fontSize: 26.0,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        """
Last Updated: 26TH MAY 2024
                    
This Cookie Policy explains how Emission Pulse ("we," "us," or "our") uses cookies and similar technologies to recognize you when you visit our website and use our services.
What Are Cookies?
Cookies are small text files that are stored on your device (computer, tablet, or mobile) when you visit a website. They help the website recognize your device and remember certain information about your visit.

How We Use Cookies
  
  We use cookies to:
  
  1 Enhance User Experience: Remember your preferences and settings.
  
  2 Analytics: Understand how you use our website and services, so we can improve them.
  
  3 Functionality: Ensure our website and services work correctly and efficiently.
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
