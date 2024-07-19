import 'package:empapp/barrel.dart';

class Updateprofile extends StatelessWidget {
  const Updateprofile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                        child: const Profile(),
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
                '    Update Profile',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const Spacer(flex: 2),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Center(
            child: Stack(
              children: [
                Image.asset(
                  "assets/img/usericon.png",
                  width: 120,
                  height: 120,
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.edit,
                      color: Color(0xFF0F0159),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20.0, right: 20.0),
            child: Text(
              'Full Name',
              style: TextStyle(fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: TextField(
              decoration: const InputDecoration(
                hintText: '   Full Name',
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
              decoration: const InputDecoration(
                hintText: '   Active Email Address',
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
              decoration: const InputDecoration(
                hintText: '   Phone Number',
                border: UnderlineInputBorder(),
              ),
            ),
          ),
          SizedBox(
            height: 250,
          ),
          Center(child: AppButton(onPressed: () {}, buttonText: 'Save'))
        ]),
      ),
    );
  }
}
