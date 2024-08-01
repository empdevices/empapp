import 'package:empapp/barrel.dart';
// ignore: depend_on_referenced_packages

class SplashPge extends StatefulWidget {
  const SplashPge({super.key});

  @override
  State<SplashPge> createState() => _SplashPgeState();
}

class _SplashPgeState extends State<SplashPge> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/img/splash.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(75, 0, 0, 0),
                    Color.fromARGB(150, 0, 0, 0)
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  addVertSpace(300),
                 const  SizedBox(
                    width: 210,
                    child: Text("emission pulse",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ),
                  addVertSpace(230),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      margin: const EdgeInsets.only(top: 50),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        "TAP TO START",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w200,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
