import 'package:empapp/barrel.dart';
import 'firebase_options.dart';

late SharedPreferences logindata;
bool newuser = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: EmpAppTheme.lightTheme,
      darkTheme: EmpAppTheme.darkTheme,
      home: const SplashWrapper(),
    );
  }
}

class SplashWrapper extends StatefulWidget {
  const SplashWrapper({super.key});

  @override
  State<SplashWrapper> createState() => _SplashWrapperState();
}

class _SplashWrapperState extends State<SplashWrapper> {
  void checkIfAlreadyLogin() async {
    logindata = await SharedPreferences.getInstance();
    newuser = (logindata.getBool('login') ?? true);
    if (!newuser) {
      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (context) => const Dashboard()),
      );
    } else {
      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (context) => const LogorSign()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () {
      checkIfAlreadyLogin();
    });
    return const SplashPge();
  }
}
