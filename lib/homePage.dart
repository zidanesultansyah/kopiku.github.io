import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kopiku_kelompok11/home_screens/body_home.dart';
import 'package:kopiku_kelompok11/widgets/constants.dart';
import 'package:kopiku_kelompok11/ProfilePage.dart';

class HomePage extends StatelessWidget {
  static String routeName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: BodyHome(),
    );
  }

  AppBar buildAppBar() {
    BuildContext context;
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
        ),
        SizedBox(width: kDefaultPaddin / 2)
      ],
    );
  }
}
