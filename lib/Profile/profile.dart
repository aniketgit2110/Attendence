import 'package:attendence_taker/Profile/profilemenu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'UpdateProfile.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Color primary = const Color(0xfffBC02D);
  String ProfileHeading = 'Aniket';
  String ProfileSubHeading = '2021.aniket.pradhan@ves.ac.in';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text(
              "Profile",
              style: Theme.of(context).textTheme.headlineSmall,
            )),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Center(
                  child: Stack(
                    children: [
                      const SizedBox(
                        width: 120,
                        height: 120,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(200)),
                          child: Image(
                              image:
                                  AssetImage('assets/images/profilepic.png')),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: primary),
                            child: const Icon(
                              LineAwesomeIcons.alternate_pencil,
                              size: 25,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  ProfileHeading,
                  style: const TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                  ),
                ),
                Text(
                  ProfileSubHeading,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const UpdateProfile()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primary,
                        shape: const StadiumBorder(),
                      ),
                      child: const Text(
                        "Edit Profile",
                        style: TextStyle(color: Colors.black),
                      )),
                ),
                const SizedBox(height: 20),
                const Divider(),
                const SizedBox(height: 10),
                ProfileMenuWidget(
                  title: "settings",
                  press: () {},
                  icon: LineAwesomeIcons.cog,
                  endicon: true,
                ),
                ProfileMenuWidget(
                  title: "User setting",
                  press: () {},
                  icon: LineAwesomeIcons.user_check,
                  endicon: true,
                ),
                ProfileMenuWidget(
                  title: "Information",
                  press: () {},
                  icon: LineAwesomeIcons.info,
                  endicon: true,
                ),
                ProfileMenuWidget(
                  title: "Logout",
                  press: () {},
                  icon: LineAwesomeIcons.alternate_sign_out,
                  textcolor: Colors.red,
                  endicon: false,
                ),
              ],
            ),
          ),
        ));
  }
}
