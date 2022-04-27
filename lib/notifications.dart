import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'bottom bar.dart';
import 'enums.dart';

class notification extends StatelessWidget {
  const notification({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(    
        body: Container(
        child: IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/Conversation.svg",
                ), onPressed: () {  },
              ),
      ),

            bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.notifications),

    );
  }
}