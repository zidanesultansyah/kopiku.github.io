import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kopiku_kelompok11/home_screens/body_home.dart';
<<<<<<< HEAD
import 'package:kopiku_kelompok11/register.dart';
=======
>>>>>>> 1c8781166a55d96f0c323e5d2720ad3f85397b7c
import 'package:kopiku_kelompok11/widgets/constants.dart';
import 'package:kopiku_kelompok11/ProfilePage.dart';

class HomePage extends StatelessWidget {
<<<<<<< HEAD
  final globalkey = GlobalKey<ScaffoldState>();
=======
  static String routeName;
>>>>>>> 1c8781166a55d96f0c323e5d2720ad3f85397b7c

  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
      key: globalkey,
=======
>>>>>>> 1c8781166a55d96f0c323e5d2720ad3f85397b7c
      appBar: buildAppBar(),
      body: BodyHome(),
    );
  }

  AppBar buildAppBar() {
    BuildContext context;
<<<<<<< HEAD
    return AppBar(
      actions: <Widget>[
        // IconButton(
        //   icon: SvgPicture.asset(
        //     "assets/icons/search.svg",
        //     // By default our  icon color is white
        //     color: kTextColor,
        //   ),
        //   onPressed: () {},
        // ),
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/Cart Icon.svg",
            // By default our  icon color is white
            color: kTextColor,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/Chat bubble Icon.svg",
            // By default our  icon color is white
            color: kTextColor,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/User Icon.svg",
            // By default our  icon color is white
            color: kTextColor,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RegisterPage(),
              ),
            );
          },
=======
        return AppBar(
          
          actions: <Widget>[
            // IconButton(
            //   icon: SvgPicture.asset(
            //     "assets/icons/search.svg",
            //     // By default our  icon color is white
            //     color: kTextColor,
            //   ),
            //   onPressed: () {},
            // ),
            IconButton(
              icon: SvgPicture.asset(
                "assets/icons/Cart Icon.svg",
                // By default our  icon color is white
                color: kTextColor,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: SvgPicture.asset(
                "assets/icons/Chat bubble Icon.svg",
                // By default our  icon color is white
                color: kTextColor,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: SvgPicture.asset(
                "assets/icons/User Icon.svg",
                // By default our  icon color is white
                color: kTextColor,
              ),
              onPressed: () =>
                        Navigator.pushNamed(context, ProfilePage.routeName),
>>>>>>> 1c8781166a55d96f0c323e5d2720ad3f85397b7c
        ),
        SizedBox(width: kDefaultPaddin / 2)
      ],
    );
  }
}
