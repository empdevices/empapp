import 'package:empapp/barrel.dart';

class NotifBar extends StatefulWidget {
  final String heading;
  final String subheading;
  final IconData icon;
  final String btnType;

  const NotifBar(
      {
      required this.btnType,
      required this.heading,
      required this.subheading,
      required this.icon,
      super.key});

  @override
  State<NotifBar> createState() => _NotifBarState();
}

class _NotifBarState extends State<NotifBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: SizedBox(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             // the nofication icon
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.transparent,
              ),
              width: 50,
              height: 50,
              child: Icon(
                size: 20,
                widget.icon,
                color: widget.btnType == 'danger'
                    ? Colors.red
                    : widget.btnType == 'success'
                        ? Colors.green
                        : widget.btnType == 'warning'
                            ? Colors.orange
                            : widget.btnType == 'info'
                                ? Colors.blue
                                : Colors.black,
              ),),
             Expanded(
               child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.heading,
                    style:  TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      // color based on btnType value
                      color: widget.btnType == 'danger'
                          ? Colors.red
                          : widget.btnType == 'success'
                              ? Colors.green
                              : widget.btnType == 'warning'
                                  ? Colors.orange
                                  : widget.btnType == 'info'
                                      ? Colors.blue
                                      : Colors.black,
                    ),
                  ),
                  Text(
                    widget.subheading,
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ],
                           ),
             ),
            const EmpExitBtn()
          ],
        ),
      ),
    );
  }
}
