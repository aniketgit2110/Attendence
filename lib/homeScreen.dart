import 'package:attendence_taker/attendence.dart';
import 'package:attendence_taker/Profile/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentindex = 0;
  Color primary = const Color(0xffeef444c);
  double pagewidth = 0;
  double pageheight = 0;
  List<IconData> navigationIcons = [
    FontAwesomeIcons.house,
    FontAwesomeIcons.check,
    FontAwesomeIcons.user,
  ];
  @override
  Widget build(BuildContext context) {
    pagewidth = MediaQuery.of(context).size.height;
    pageheight = MediaQuery.of(context).size.width;
    return Scaffold(
      body: IndexedStack(
        index: currentindex,
        children: const [Home(), Attendence(), Profile()],
      ),
      bottomNavigationBar: Container(
        height: 70,
        margin: EdgeInsets.only(left: 12, right: 12, bottom: 24),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(40)),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(2, 2),
            )
          ],
        ),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < navigationIcons.length; i++) ...<Expanded>{
                Expanded(
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          currentindex = i;
                        });
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(navigationIcons[i],
                              color:
                                  i == currentindex ? primary : Colors.black54,
                              size: i == currentindex ? 30 : 26),
                          i == currentindex
                              ? Container(
                                  margin: EdgeInsets.only(top: 5),
                                  width: 25,
                                  height: 4,
                                  decoration: BoxDecoration(
                                      color: primary,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(40))),
                                )
                              : const SizedBox()
                        ],
                      ),
                    ),
                  ),
                )
              }
            ]),
      ),
    );
  }
}
