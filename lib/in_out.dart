import 'package:flutter/material.dart';
import 'package:office_register/google_map.dart';
class in_out extends StatelessWidget {
  const in_out({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Google Maps"),
        centerTitle: true,
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            ElevatedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                return const google_map();
              }));
            }, child: const Text("Simple Map")),

          ],
        ),
      ),
    );

  }
}
