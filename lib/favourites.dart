import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'bottom bar.dart';
import 'enums.dart';

class favourites extends StatefulWidget {
  const favourites({ Key? key }) : super(key: key);

  @override
  State<favourites> createState() => _favouritesState();
}

class _favouritesState extends State<favourites> {
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

            bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.favourites),

    );
  }
}