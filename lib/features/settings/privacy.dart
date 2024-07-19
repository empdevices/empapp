import 'package:empapp/barrel.dart';

class Privacy extends StatelessWidget {
  const Privacy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, // Set your desired color here
        ),
        title: const Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            '    ',
            style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w300,
                color: Colors.white),
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primaryFixed,
      ),
      backgroundColor: Theme.of(context).colorScheme.primaryFixed,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30.0),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                children: [
                  Text(
                    "Privacy Policies",
                    style: TextStyle(fontSize: 30.0, color: Colors.white),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            Expanded(
                child: Stack(children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 80.0, top: 40),
                child: Row(children: [
                  Text(
                    """Emission Pulse 
        Our Terms and 
        Conditions""",
                    style: TextStyle(fontSize: 30.0, color: Color(0xFF0F0159)),
                  ),
                ]),
              ),
              Positioned(
                top: 180,
                child: Column(
                  children: [
                    Text(
                      """
              Terms and Conditionsdghethtegrfedegfhdfgert
              Terms and Conditionsdghethtegrfedegfhdf
              Terms and Conditionsdghethtegrfedegfhdfgert
              Terms and Conditionsdghethtegrfede
              Terms and Conditionsdghethtegrfedegfhdfgert
              Terms and Conditionsdghethtegrfedegfhdfgert
              Terms and Conditionsdghethtegrfede
              Terms and Conditionsdghethtegrfedegfhdfgert
              Terms and Conditionsdghethtegrfed
              Terms and Conditionsdghethtegrfedegfhdfgert
              Terms and Conditionsdghethtegrfedegfhdfgert
              Terms and Conditionsdghethtegrfe
             Terms and Conditionsdghethtegrfedegfhdfgert
              s and Conditionsdghethtegrfedegfhd
              s and Conditionsdghethtegrfedegfhdfgert
              Terms and Conditionsdghethtegrfede
              and Conditionsdghethtegrfedegfhdfgert
              Terms and Conditionsdghethtegrfedegfhdfgert
             nd Conditionsdghethtegrfedegfhdfgert
              Terms and Conditionsdghethtegrfedegfhdfgert
              Terms and Conditionsdghethtegrfedegfhdfgert
              Terms and Conditionsdghethtegrfede
              Terms and Conditionsdghethtegrfedegfhdfgert
               and Conditionsdghethtegrfedegf
              Terms and Conditionsdghethtegrfedegfhdfgert
              Terms and Conditionsdghethtegrfed
              Terms and Conditionsdghethtegrfedegfhdfgert
              s and Conditionsdghethtegrfedegfhd
              s and Conditionsdghethtegrfedegfhdfgert
              Terms and Conditionsdghethtegrfede
              and Conditionsdghethtegrfedegfhdfgert
              Terms and Conditionsdghethtegrfedegfhdfgert
             nd Conditionsdghethtegrfedegfhdfgert
              Terms and Conditionsdghethtegrfedegfhdfgert
              Terms and Conditionsdghethtegrfedegfhdfgert
              Terms and Conditionsdghethtegrfede
              Terms and Conditionsdghethtegrfedegfhdfgert
               and Conditionsdghethtegrfedegf
              Terms and Conditionsdghethtegrfedegfhdfgert
              Terms and Conditionsdghethtegrfed
              Terms and Conditionsdghethtegrfedegfhdfgert
              """,
                    ),
                  ],
                ),
              )
            ]))
          ],
        ),
      ),
    );
  }
}
