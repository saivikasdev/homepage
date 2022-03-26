import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:image_picker/image_picker.dart';

import 'timelinepage.dart';

class picture extends StatefulWidget {
  picture({this.pictureFile, Key? key}) : super(key: key);

  XFile? pictureFile;

  @override
  State<picture> createState() => _pictureState();
}

class _pictureState extends State<picture> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const SizedBox(
          height: 40,
        ),
        Row(
          children: [
            InkWell(
                child: Container(
              child: const Icon(Icons.arrow_back),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.white30,
                  width: 8,
                ),
              ),
            )),
          ],
        ),
        const SizedBox(
          height: 0,
        ),
        Container(
          width: 480,
          height: 200,
          child: Image.file(File(widget.pictureFile!.path)),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(150, 60, 10, 0),
          child: Column(
            children: [
              Row(
                children: const [
                  Text(
                    "SESSION:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "IN",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: const [
                  Text(
                    "Date:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "17-11-2022",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: const [
                  Text(
                    "TIME:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "9:00AM",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 70,
              )
            ],
          ),
        ),
        InkWell(
          onTap: () =>Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => timelinepage(),
                ),
              ),
          //  notificationApi.showNotification(
          //     title: 'welcome to office', body: 'hi how are you'),
          child: Container(
            child: const Center(
                child: Text(
              "notification",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            )),
            width: 380,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.blueAccent,
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

Future<void> _showNotification() async {
  const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails('your channel id', 'your channel name',
          channelDescription: 'your channel description',
          importance: Importance.max,
          priority: Priority.high,
          ticker: 'ticker');
  const NotificationDetails platformChannelSpecifics =
      NotificationDetails(android: androidPlatformChannelSpecifics);
  await FlutterLocalNotificationsPlugin().show(
      0, 'plain title', 'plain body', platformChannelSpecifics,
      payload: 'item x');
}

class NotificationApi {
  static Future get notificationDetails async {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'channel id',
        'channel name',
        channelDescription: 'channel description',
        importance: Importance.max,
      ),
      iOS: IOSNotificationDetails(),
    );
  }

  static Future showNotification({
    int id = 0,
    String? title,
    String? body,
  }) async =>
      FlutterLocalNotificationsPlugin()
          .show(id, title, body, await notificationDetails);
}




class notificationApi {
  static Future get notificationDetails async {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'channel id',
        'channel name',
        channelDescription: 'channel description',
        importance: Importance.max,
      ),
      iOS: IOSNotificationDetails(),
    );
  }





  static Future showNotification({String? title, String? body}) async{
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails('your channel id', 'your channel name',
        channelDescription: 'your channel description',
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker');
const NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);
await flutterLocalNotificationsPlugin.show(
    0, 'plain title', 'plain body', platformChannelSpecifics,
    payload: 'item x');
  }

  
}