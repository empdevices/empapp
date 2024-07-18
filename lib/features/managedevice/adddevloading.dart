import 'package:empapp/barrel.dart';

class LoadScreen extends StatefulWidget {
  const LoadScreen({super.key});

  @override
  State<LoadScreen> createState() => _LoadScreenState();
}

class _LoadScreenState extends State<LoadScreen> {
  double progress = 0.01;

  @override
  void initState() {
    super.initState();
    _startLoading();
  }

  void _startLoading() {
    Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {
        progress += 0.01;
        if (progress >= 1.0) {
          progress = 1.0;
          timer.cancel();
          showEmpPopup(context: context, 
          message: 'Device Server not\nactive.', 
          icon: Icons.dangerous, 
          iconColor: Colors.red, 
          buttontext: 'Continue');
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const Scan(),
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
                  '    Setup',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                const Spacer(flex: 2),
              ],
            ),
            const SizedBox(height: 280),
            Text(
              '${(progress * 100).toStringAsFixed(0)}% Completed...',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey[300],
              valueColor: const AlwaysStoppedAnimation<Color>(Color.fromARGB(255, 112, 224, 0)),
            ),
            const SizedBox(height: 20),
            Image.asset('assets/icons/nfc.png'),
            const SizedBox(height: 20),
            const Text(
              'Connecting via NFC',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Hold your phone near to the device, using NFC phone will automatically connect to the device.',
              style: TextStyle(fontSize: 12, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
