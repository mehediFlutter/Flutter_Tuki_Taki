import 'package:flutter/material.dart';
import 'Botton Navigation Nav Bar/bottom_nav_base_screen.dart';
class FlutterAll extends StatefulWidget {
  const FlutterAll({super.key});

  @override
  State<FlutterAll> createState() => _FlutterAllState();
}

class _FlutterAllState extends State<FlutterAll> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            OutlinedButton(onPressed: (){
              Navigator.push(context,MaterialPageRoute(builder: ((context) => BottomNavBaseScreen())) );
            }, child: Text("Bottom Nav Bar")),
          ],
        ),
      ),
    );
  }
}