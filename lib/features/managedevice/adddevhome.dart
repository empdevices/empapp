import 'package:empapp/barrel.dart';

class AddDeviceHome extends StatelessWidget {
  const AddDeviceHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.secondary,
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
                      // go back to the previous page using pop
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Back',
                      style: TextStyle(color: appGreen, fontSize: 16),
                    ),
                  ),
                ),
                const Spacer(),
                const Text(
                  'Set Up',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                const Spacer(flex: 2),
              ],
            ),
            const SizedBox(height: 70),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Text(
                      'Add Device',
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Center(
                    child: Text(
                      'Scan code or enter serial number found on the device.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: textGrey, fontSize: 12),
                    ),
                  ),
                  const SizedBox(height: 60),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        PageTransition(
                          type: PageTransitionType.fade,
                          childCurrent: this,
                          duration: const Duration(milliseconds: 400),
                          reverseDuration: const Duration(milliseconds: 400),
                          child: const Scan(),
                        ),
                      );
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // an image here
                        const Icon(Icons.qr_code_scanner_outlined),
                        const SizedBox(width: 10),
                        SizedBox(
                          width: 250,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Scan Code',
                                style: TextStyle(
                                    fontSize: 16),
                              ),
                              Text(
                                'Look for the code on the device, or its packaging and place the code infront of your phone\'s camera to  scan it.',
                                style: TextStyle(color: textGrey, fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // an image here
                        const Icon(Icons.numbers),
                        const SizedBox(width: 10),
                        SizedBox(
                          width: 250,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Serial Number',
                                style: TextStyle(
                                    fontSize: 16),
                              ),
                              Text(
                                'Alternatively, you can enter the serial number found on the device.',
                                style: TextStyle(color: textGrey, fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0, right: 20.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: '   Enter serial number ...',
                        enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black12), // Custom color
                        ),
                      ),
                    ),
                  ),
                  addVertSpace(100),
                  Center(
                    child: AppButton(
                      onPressed: () {
                        // navigate to login page
                      },
                      buttonText: 'Connect with Serial',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
