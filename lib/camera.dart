import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:office_register/picture.dart';

class CameraPage extends StatefulWidget {
  final List<CameraDescription>? cameras;
  const CameraPage({this.cameras, Key? key}) : super(key: key);

  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late CameraController controller;
  XFile? pictureFile;

  @override
  void initState() {
    super.initState();
    controller = CameraController(
      widget.cameras![0],
      ResolutionPreset.max,
    );
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return const SizedBox(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Scaffold(
      body: Column(
        children: [
          CameraPreview(controller),
          SizedBox(height: 20,),
           InkWell(
             onTap: () async {
                pictureFile = await controller.takePicture();
                setState(() {});
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => picture(pictureFile: pictureFile,)
                  ),
                );
              }, 
                  child: Container(
                    child: const Center(
                        child: Text(
                      "",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )),
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.black87,
                      border: Border.all(
                        color: Colors.white30,
                        width: 8,
                      ),
                      borderRadius: BorderRadius.circular(120),
                    ),
                  ),
                ),
          // Padding(
          //   padding: const EdgeInsets.all(0),
          //   child: ElevatedButton(
          //     onPressed: () async {
          //       pictureFile = await controller.takePicture();
          //       setState(() {});
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //           builder: (context) => picture(pictureFile: pictureFile,)
          //         ),
          //       );
          //     },
          //     child: const Text('Capture Image'),
          //   ),
          // ),
          // if (pictureFile != null) Image.file(File(pictureFile!.path))
        ],
      ),
    );



  }
}



