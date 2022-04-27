import 'package:flutter/material.dart';
import 'package:office_register/home2.dart';
import 'enums.dart';
import 'bottom bar.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// import 'bottom bar.dart';
// import 'enums.dart';

class home extends StatelessWidget {
  const home({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            body:SingleChildScrollView(child: 
             Column(
               children: [
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/images/dj project imae.jpg',
                      fit: BoxFit.cover,
                      height: 490,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(width: 40,),
                            Column(
                              children: [
                                SizedBox(height: 60,),
                                Container(
                                  child: Icon(Icons.arrow_back_ios_new,color: Colors.white70,),
                                  alignment: Alignment.center,
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(color: Colors.black38,borderRadius: BorderRadius.circular(50)),
            
                                  ),
                              ],
                            ),
                            SizedBox(
                              width: 220,
                            ),
                            Column(
                              children: [
                                SizedBox(height: 60,),
                                Container(
                                  child: Icon(Icons.airplane_ticket,color: Colors.white,),
                                  alignment: Alignment.center,
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(color: Colors.black38,borderRadius: BorderRadius.circular(50)),
            
                                  ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 250,),
                        Row(
                          children: [
                            SizedBox(width: 20,),
                            Column(
                              children: [
                                
                        Text('Billie Ellish Concert',style: TextStyle(color: Colors.white,fontSize: 20,),),
                        Text('By Robert Power',style: TextStyle(color: Colors.blue,fontSize: 14),)
                              ],
                            ),
            SizedBox(width: 150,),
            
            
                            Container(child: Icon(Icons.favorite_rounded,color: Colors.pinkAccent,size: 30,)),
                          ],
                        )
            
                      ],
                    ),
                   
                  ],
                ),
              ),
                      ),
                      SizedBox(height: 20,),
            Container(alignment: Alignment.center,
              child:Row(
                children: [
                  SizedBox(width: 15,),
                  Icon(Icons.check,color: Colors.white,size: 30,),
                  Text('Going',style: TextStyle(color: Colors.white,fontSize: 20,),),
                ],
              ),width: 135,height: 45,decoration:
             BoxDecoration(borderRadius: BorderRadius.circular(30),color: Colors.green),),
             SizedBox(height: 20,),
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    
                    Icon(Icons.info_outline_rounded,color: Colors.blueGrey,),
                    Icon(Icons.photo_album_outlined,color: Colors.black12,),
                    Icon(Icons.contact_page_outlined,color: Colors.black12,),
                  ],
                ),
                 Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                   Text('  Details',style: TextStyle(color: Colors.blue,fontSize: 15,),),
                  Text('  Gallery',style: TextStyle(color: Colors.black12,fontSize: 15,),),
                  Text('Contacts',style: TextStyle(color: Colors.black12,fontSize: 15,),),


                  ],
                ),
                             SizedBox(height: 60,),

            Container(alignment: Alignment.center,
              child:Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                                            SizedBox(height: 5,),

                   Text('Apr',style: TextStyle(color: Colors.black,fontSize: 15,),),
                                         SizedBox(height: 5,),

                   Text('14',style: TextStyle(color: Colors.green,fontSize: 15,),),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(height: 5,),
                   Text('Thursday',style: TextStyle(color: Colors.black,fontSize: 15,),),
                                         SizedBox(height: 5,),

                   Text('8:00 am',style: TextStyle(color: Colors.black,fontSize: 15,),),
                    ],
                  ),
                  
            Container(alignment: Alignment.center,
              child:Text('Starts',style: TextStyle(color: Colors.green,fontSize: 15,),)
,width: 45,height: 45,decoration:
             BoxDecoration(borderRadius: BorderRadius.circular(9),color: Colors.green[100]),),
                ],
              ),width: 335,height: 60,decoration:
             BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.green[50]),),

SizedBox(height: 30,),


             Container(alignment: Alignment.center,
              child:Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                                            SizedBox(height: 5,),

                   Text('Apr',style: TextStyle(color: Colors.black,fontSize: 15,),),
                                         SizedBox(height: 5,),

                   Text('14',style: TextStyle(color: Colors.green,fontSize: 15,),),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(height: 5,),
                   Text('Thursday',style: TextStyle(color: Colors.black,fontSize: 15,),),
                                         SizedBox(height: 5,),

                   Text('8:00 am',style: TextStyle(color: Colors.black,fontSize: 15,),),
                    ],
                  ),
                  
            Container(alignment: Alignment.center,
              child:Text('Starts',style: TextStyle(color: Colors.green,fontSize: 15,),)
,width: 45,height: 45,decoration:
             BoxDecoration(borderRadius: BorderRadius.circular(9),color: Colors.green[100]),),
                ],
              ),width: 335,height: 60,decoration:
             BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.green[50]),),
SizedBox(height: 10,),
Container(
  width: 335,
  child: Column(
    children: [
                         Text("Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of de Finibus Bonorum et Malorum(The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, Lorem ipsum dolor sit amet.., comes from a line in section 1.10.32.",style: TextStyle(color: Colors.black,fontSize: 15,),),

    ],
  ),
),
nextpart(),
            
              ],),
            ),

    );
  }
}