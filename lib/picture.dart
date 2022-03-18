import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';







class picture extends StatelessWidget {
  
  picture({ this.pictureFile, Key? key }) : super(key: key);

  XFile? pictureFile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(
      children: [
        SizedBox(height: 40,),
        Row(
          children: [
            InkWell(
                      child: Container(
                        child: Icon(Icons.arrow_back),
                        decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.white30,
                        width: 8,
                      ),
                    ),
                      )
                    ),
          ],
        ),
        SizedBox(height: 0,),
        Container(
          width: 480,
          height: 500,
          child: 
        Image.file(File(pictureFile!.path)),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(150, 60, 10, 0),
          child:Column(
              children: [
                Row(
                  children: [
                    Text("SESSION:",style: TextStyle(fontWeight: FontWeight.bold),),
                     Text("IN",style: TextStyle(fontWeight: FontWeight.bold),),
                  ],
                ),


SizedBox(height: 20,),
                Row(
                  children: [
                    Text("Date:",style: TextStyle(fontWeight: FontWeight.bold),),
                     Text("17-11-2022",style: TextStyle(fontWeight: FontWeight.bold),),
                  ],
                ),


SizedBox(height: 20,),

                Row(
                  children: [
                    Text("TIME:",style: TextStyle(fontWeight: FontWeight.bold),),
                     Text("9:00AM",style: TextStyle(fontWeight: FontWeight.bold),),
                  ],
                ),

SizedBox(height: 70,)
              ],
            ),
          ),
          InkWell(
                  child: Container(
                    child: const Center(
                        child: Text(
                      "OUT",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )),
                    width: 380,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      border: Border.all(
                        color: Colors.white30,
                        width: 8,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
        
      ],
    ));
  }
}