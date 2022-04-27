import 'package:flutter/material.dart';

class nextpart extends StatelessWidget {
  const nextpart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20,),
        Row(
          children: [
            Text(
              'Location',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ],
        ),
        SizedBox(height: 20,),
      Image.asset(
                      'assets/images/mapproject.jpg',
                      fit: BoxFit.cover,
                      height: 150,
                    ),

             Text('Address line 1 ,line 2,area,City ,Country',style: TextStyle(color: Colors.black38,fontSize: 15,),),
             SizedBox(height: 20,),

Container(child: Text('Sub Events',style: TextStyle(color: Colors.black38,fontSize: 15,fontWeight: FontWeight.bold),)),
Container(child:Text('Event Title',style: TextStyle(color: Colors.black38,fontSize: 15,),),),
   ],
    );
  }
}
