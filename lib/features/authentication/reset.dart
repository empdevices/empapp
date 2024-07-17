import 'package:empapp/barrel.dart';

class Reset extends StatelessWidget {
  const Reset({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        PageTransition(
                          type: PageTransitionType.leftToRightWithFade,
                          childCurrent: this,
                          duration: const Duration(milliseconds: 450),
                          reverseDuration: const Duration(milliseconds: 450),
                          child: const RecoverPass(),
                        ),
                      ); // Handle back action
                    },
                    child: const Text(
                      'Back',
                      style: TextStyle(color: Colors.green, fontSize: 16),
                    ),
                  ),
                ),
                const Spacer(),
                const Text(
                  '   Reset Password',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                const Spacer(flex: 2),
              ],
            ),
            const SizedBox(height: 200),
            const Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0),
              child: Text(
                'Now',
                style: TextStyle(fontSize: 16),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: '   Enter password',
                  border: UnderlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0),
              child: Text(
                'Confirm',
                style: TextStyle(fontSize: 16),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: '   Confirm Password',
                  border: UnderlineInputBorder(),
                ),
                obscureText: true,
              ),
            ),
            const SizedBox(height: 15),
            const Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0),
              child: Text(
                'At least 8 characters',
                style: TextStyle(fontSize: 14),
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    PageTransition(
                      type: PageTransitionType.rightToLeftWithFade,
                      childCurrent: this,
                      duration: const Duration(milliseconds: 450),
                      reverseDuration: const Duration(milliseconds: 450),
                      child: const Login(),
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
                      'Verify',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ))),
              ),
            ),
          ]),
        ));
  }
}
