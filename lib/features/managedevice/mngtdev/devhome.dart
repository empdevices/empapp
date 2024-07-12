
import 'package:empapp/barrel.dart';

class DevicesHome extends StatefulWidget {
  const DevicesHome({super.key});

  @override
  State<DevicesHome> createState() => _DevicesHomeState();
}

class _DevicesHomeState extends State<DevicesHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF0F0159),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80.0),
          child: AppBar(
            iconTheme: const IconThemeData(
              color: Colors.white, // Set your desired color here
            ),
            title: const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Emission Pulse',
                style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w300,
                    color: Colors.white),
              ),
            ),
            backgroundColor: mainCol, // Setting the background color
            actions: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: IconButton(
                  icon: const Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    // navigate to settings page
                    
                  },
                ),
              ),
            ],
          ),
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text("Devices",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.normal)),
          ),
          const SizedBox(
            height: 40,
          ),
          Expanded(
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  color: Colors.white,
                ),
                child: Wrap(alignment: WrapAlignment.center, children: [
                  const DeviceBoxSmall(),
                  const DeviceBoxSmall(),
                  const DeviceBoxSmall(),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      width: 170,
                      height: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: appGrey),
                      child: IconButton(
                        icon: const Icon(Icons.add_circle_outlined),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AddDeviceHome()),
                          );
                        },
                      ),
                    ),
                  )
                ])),
          ),
        ]));
  }
}
