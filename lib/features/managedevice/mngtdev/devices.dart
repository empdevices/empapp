import 'package:empapp/barrel.dart';

class DeviceBoxSmall extends StatefulWidget {
  const DeviceBoxSmall({super.key});

  @override
  State<DeviceBoxSmall> createState() => DeviceBoxSmallState();
}

class DeviceBoxSmallState extends State<DeviceBoxSmall> {
  final bool _isSwitched = true;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const Device(),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: appGrey),
          width: 170,
          height: 120,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    "assets/img/device.png",
                  ),
                  Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: Transform.scale(
                        scale:
                            0.75, // Adjust the scale factor to make the switch smaller
                        child: Switch(
                          activeColor: Colors.green,
                          activeTrackColor: Colors.greenAccent,
                          inactiveThumbColor: Colors.black45,
                          inactiveTrackColor: Colors.white,
                          value: _isSwitched,
                          onChanged: (value) {
                            setState(() {
                              showEmpPopup(
                                  context: context,
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  message: 'Action not\nallowed.',
                                  icon: Icons.dangerous,
                                  iconColor: Colors.red,
                                  buttontext: 'Continue');
                              // _isSwitched = value;
                            });
                          },
                        ),
                      )),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Text(
                  'Carbon EX 500',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.only(left: 17.0),
                child: Row(
                  children: [
                    Text(
                      'Active',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(width: 20),
                    Text(
                      'Mercedes Benz',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
