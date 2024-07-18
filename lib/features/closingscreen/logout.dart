import 'package:empapp/barrel.dart';

class Logout extends StatelessWidget {
  const Logout({super.key});

  @override
  Widget build(BuildContext context) {

    void updateSharedPrefs() async {
    SharedPreferences logindata = await SharedPreferences.getInstance();
    logindata.setBool('login', true);
  }
    return Scaffold(
        body: Stack(children: [
      Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/img/Logout.png"),
            fit: BoxFit.cover,
          ),
        ),
        height: double.infinity,
        width: double.infinity,
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
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Stack(
                children: [
                  Container(
                      height: 250.0,
                      width: MediaQuery.of(context).size.width - 40,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(35.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            width: 200,
                            child: Text(
                              'Remember Tracking our emissions is a must!',
                              style: TextStyle(fontSize: 20),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 51,
                            width: 200,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                color: mainCol),
                            child: TextButton(
                              onPressed: () async {
                                updateSharedPrefs();
                                await AuthService().signout(
                                  context: context,
                                );
                              },
                              child: const Text(
                                "Confirm Logout",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    ]));
  }
}
