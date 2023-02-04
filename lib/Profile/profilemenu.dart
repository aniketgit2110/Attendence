import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ProfileMenuWidget extends StatelessWidget {
  final String title;
  final VoidCallback press;
  final IconData icon;
  final Color? textcolor;
  final bool endicon;

  ProfileMenuWidget(
      {required this.title,
      required this.press,
      required this.icon,
      required this.endicon,
      this.textcolor = Colors.black});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.grey.withOpacity(0.1)),
        child: Icon(
          icon,
          size: 25,
          color: Colors.blueAccent,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(fontSize: 20, color: textcolor),
      ),
      trailing: endicon
          ? Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.grey.withOpacity(0.1)),
              child: const Icon(LineAwesomeIcons.angle_right,
                  size: 20, color: Colors.grey),
            )
          : null,
    );
  }
}
