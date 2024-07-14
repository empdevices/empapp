import 'package:empapp/barrel.dart';
// ignore: depend_on_referenced_packages

class SplashPge extends StatelessWidget {
  const SplashPge({super.key});

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
              child: const Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   SizedBox(
                    width: 210,
                    child: Text("emission pulse",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
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
