import 'package:empapp/barrel.dart';

class Login extends StatefulWidget {

  
  const Login({super.key});
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                          type: PageTransitionType.fade,
                          childCurrent: const LogorSign(),
                          duration: const Duration(milliseconds: 400),
                          reverseDuration: const Duration(milliseconds: 400),
                          child: const LogorSign(),
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
                  '    Login',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                const Spacer(flex: 2),
              ],
            ),
            const SizedBox(height: 200),
            const Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0),
              child: Text(
                'User Name',
                style: TextStyle(fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: '   Username/Phone/Email',
                  border: UnderlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0),
              child: Text(
                'Password',
                style: TextStyle(fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                  hintText: '   Password',
                  border: UnderlineInputBorder(),
                ),
                obscureText: true,
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    PageTransition(
                      type: PageTransitionType.fade,
                      childCurrent: const RecoverPass(),
                      duration: const Duration(milliseconds: 400),
                      reverseDuration: const Duration(milliseconds: 400),
                      child: const RecoverPass(),
                    ),
                  ); // Handle back action
                },
                child: const Text(
                  'Forgot Password ?',
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: AppButton(
                onPressed: () async {
                  await AuthService().login(
                    context: context,
                    email: emailController.text,
                    password: passwordController.text,
                  );
                },
                buttonText: 'Login',
              ),
            ),
            const Spacer(),
            const Center(
              child: Text(
                '-sign in with-',
                style: TextStyle(fontSize: 14),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Image.asset('assets/img/google_icon.png'),
                  onPressed: () {
                    // Handle Google sign-in
                  },
                ),
                IconButton(
                  icon: Image.asset('assets/img/facebook_icon.png'),
                  onPressed: () {
                    // Handle Facebook sign-in
                  },
                ),
                IconButton(
                  icon: Image.asset('assets/img/X_icon.png'),
                  onPressed: () {
                    // Handle Twitter sign-in
                  },
                ),
              ],
            ),
            const Spacer(),
            const Center(
              child: Text(
                'Dont have an Account ?',
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
                      type: PageTransitionType.rightToLeftWithFade,
                      childCurrent: const Signup(),
                      duration: const Duration(milliseconds: 450),
                      reverseDuration: const Duration(milliseconds: 450),
                      child: const Signup(),
                    ),
                  ); // Handle sign up navigation
                },
                child: const Text(
                  'Sign Up ',
                  style: TextStyle(fontSize: 26, color: Color(0xFF0F0159)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
