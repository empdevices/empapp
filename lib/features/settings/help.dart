import 'package:flutter/material.dart';

class HelpAndAssistance extends StatelessWidget {
  const HelpAndAssistance({super.key});

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
            'Help & Assistance',
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
              child: const SingleChildScrollView(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Text(
                        "   Emission Pulse \n   Help & Assistance",
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
If you need assistance or have any questions, please reach out to us through the following channels:

1. Help Line:
   - Phone: +254 704 469422

2. Email:
   - Support Email: emissionpulse.@gmail.com

3. Social Media:
   - Facebook: @EmissionPulse
   - Twitter: @EmissionPulse
   - Instagram: @EmissionPulse

We are here to help and will get back to you as soon as possible. Thank you for using Emission Pulse!
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
