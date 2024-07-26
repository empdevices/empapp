import 'package:empapp/barrel.dart';

class AuthService {
  Future<void> signup({
    required String email,
    required String password,
    required String name,
    required String gender,
    required String phone,
    required BuildContext context,
  }) async {
    try {
      if (email.isEmpty || password.isEmpty || name.isEmpty || phone.isEmpty) {
        Fluttertoast.showToast(
          msg: 'Please fill all the fields',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        return;
      }

      if (password.length < 6) {
        Fluttertoast.showToast(
          msg: 'Password must be at least 6 characters',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        return;
      }

      RegExp regExp = RegExp(
        r'^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$',
      );
      if (!regExp.hasMatch(password)) {
        Fluttertoast.showToast(
          msg:
              'Password should contain at least one letter, one number, and one special character.',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        return;
      }

      await Firebase.initializeApp();
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        // Save user information to Firestore
        await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
          'fullname': name,
          'gender': gender.toLowerCase(),
          'phone': phone,
          'email': email,
          'hasprofpic': false,
          'userimage': '', 
          'userems':{
            'devices': {'empu24233d1': {
              'name': 'Carbon EX 500',
              'machine' : 'Benz C100'
            }},
            'overall': {
              'total': 0,
              'CO2': 0,
              'NOx': 0,
              'SO2': 0,
            },
             EmpAppDate().getDate(): {
              'total': 0,
              'CO2': 0,
              'NOx': 0,
              'SO2': 0,
            },
        }
        });
      }

      Fluttertoast.showToast(
        msg: 'Account created successfully',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      await Future.delayed(const Duration(seconds: 2));
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const Dashboard()),
      );
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      } else {
        message = 'Invalid Credentials';
      }
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await Firebase.initializeApp();
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const Dashboard()),
      );
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'user-not-found') {
        message = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        message = 'Wrong password provided for that user.';
      } else if (e.code == 'invalid-email') {
        message = 'Invalid email provided.';
      } else {
        message = 'Invalid Credentials';
      }
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signout({required BuildContext context}) async {
    try {
      await FirebaseAuth.instance.signOut();
      await Future.delayed(const Duration(seconds: 1));
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const LogorSign()),
        (Route<dynamic> route) => false,
      );
    } catch (e) {
      rethrow;
    }
  }
}
