import 'package:empapp/barrel.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
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
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const LogorSign(),
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
                      '     SignUp',
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    const Spacer(flex: 2),
                  ],
                ),
                const SizedBox(height: 70),
                const Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Text(
                    'Name',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                 Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      hintText: 'Full Name',
                      border: UnderlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Text(
                    'Number/Phone',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                 Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: TextField(
                    controller: phoneController,
                    decoration: const InputDecoration(
                      hintText: 'Phone',
                      border: UnderlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Text(
                    'Email',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                 Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      hintText: 'Active Email Address',
                      border: UnderlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Text(
                    'User Password',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                 Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: TextField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                      hintText: 'Password',
                      border: UnderlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Text(
                    'Set Up Device',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                const SizedBox(height: 10),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const AddDeviceHome(),
                        ),
                      ); // Handle log in navigation
                    },
                    child: Container(
                      width: 280,
                      height: 51,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 3,
                              offset: const Offset(0, 3),
                            )
                          ]),
                      child: const Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Text(
                              'Add Device',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 150),
                            child: Icon(Icons.add),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Center(
                  child: AppButton(
                onPressed: () async {
                  await AuthService().signup(
                    context: context,
                    name: nameController.text,
                    phone: phoneController.text,
                    email: emailController.text,
                    password: passwordController.text,
                  );
                },
                buttonText: 'Sign Up',
              ),
                ),
                const Spacer(),
                const Center(
                  child: Text(
                    'Have an Account ?',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const Login(),
                        ),
                      ); // Handle sign up navigation
                    },
                    child: const Text(
                      'Log In',
                      style: TextStyle(fontSize: 26, color: Color(0xFF0F0159)),
                    ),
                  ),
                ),
              ],
            )));
  }
}
