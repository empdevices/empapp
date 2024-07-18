import 'package:empapp/barrel.dart';

class RecoverPass extends StatelessWidget {
  const RecoverPass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      PageTransition(
                        type: PageTransitionType.leftToRightWithFade,
                        childCurrent: this,
                        duration: const Duration(milliseconds: 400),
                        reverseDuration: const Duration(milliseconds: 400),
                        child: const Login(),
                      ),
                    ); // Handle back action
                  },
                  child: const Text(
                    'Back',
                    style: TextStyle(color: Colors.green, fontSize: 16),
                  ),
                ),
                const Text(
                  '     Recover Password',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 200),
            const Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0),
              child: Text(
                'Email',
                style: TextStyle(fontSize: 16),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: '   Email/Phone',
                  border: UnderlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 150),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    PageTransition(
                      type: PageTransitionType.rightToLeftJoined,
                      childCurrent: this,
                      duration: const Duration(milliseconds: 400),
                      reverseDuration: const Duration(milliseconds: 400),
                      child: const VerifyPge(),
                    ),
                  ); //
                },
                child: Container(
                    width: 270,
                    height: 51,
                    decoration: BoxDecoration(
                        color: const Color(0xFF0F0159),
                        borderRadius: BorderRadius.circular(14.0)),
                    child: const Center(
                        child: Text(
                      'Confirm',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ))),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const Center(
              child: Text(
                'Have an Account ?',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    PageTransition(
                      type: PageTransitionType.leftToRightWithFade,
                      childCurrent: this,
                      duration: const Duration(milliseconds: 400),
                      reverseDuration: const Duration(milliseconds: 400),
                      child: const Signup(),
                    ),
                  ); // Handle sign up navigation
                },
                child: const Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 26, color: Color(0xFF0F0159)),
                ),
              ),
            ),
          ]),
        ));
  }
}
