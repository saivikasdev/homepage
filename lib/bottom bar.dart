import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:office_register/favourites.dart';
import 'package:office_register/home.dart';
import 'package:office_register/main.dart';
import 'package:office_register/notifications.dart';
import 'package:office_register/profile.dart';
import '../enums.dart';

class CustomBottomNavBar extends StatelessWidget {
   CustomBottomNavBar({
    Key? key,
    required this.selectedMenu,
  }) : super(key: key);

final kPrimaryColor = Color(0xFFFF7643);
  final MenuState selectedMenu;
  final Color inActiveIconColor = Color(0xFFB6B6B6);
  @override
  Widget build(BuildContext context) {
    final Color inActiveIconColor = Color(0xFFB6B6B6);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 75, 207, 244),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(5),
          topRight: Radius.circular(5),
        ),
      ),
      child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/Shop Icon.svg",
                  color: MenuState.home == selectedMenu
                      ? Colors.white
                      : Colors.white38,
                ),
                onPressed: () => Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (ctx)=> MyHomePage()), (route) => false),
              ),
              InkWell(
                onTap: () => null,
                child: IconButton(
                  icon: SvgPicture.asset(
                    "assets/icons/Heart Icon.svg",
                    color: MenuState.favourites == selectedMenu
                        ? Colors.white
                      : Colors.white38,
                    width: 23,
                  ),
                  onPressed: () =>Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (ctx)=> favourites()), (route) => false),
                ),
              ),
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/Bell.svg",
                  color: MenuState.notifications == selectedMenu
                       ? Colors.white
                      : Colors.white38,
                ),
                onPressed: () => Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (ctx)=> notification()), (route) => false),
              ),
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/User Icon.svg",
                  color: MenuState.profile == selectedMenu
                    ? Colors.white
                      : Colors.white38,
                ),
                onPressed: () => 
                 Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (ctx)=> profile()), (route) => false),
              ),
            ],
          )),
    );
  }
}
