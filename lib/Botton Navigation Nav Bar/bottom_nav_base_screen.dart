import 'package:flutter/material.dart';
class BottomNavBaseScreen extends StatefulWidget {
  const BottomNavBaseScreen({super.key});

  @override
  State<BottomNavBaseScreen> createState() => _BottomNavBaseScreenState();
}

class _BottomNavBaseScreenState extends State<BottomNavBaseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.ac_unit),label: 'New'),
        BottomNavigationBarItem(icon: Icon(Icons.ac_unit),label: 'In Progress'),
        BottomNavigationBarItem(icon: Icon(Icons.ac_unit),label: 'Cancell'),
        BottomNavigationBarItem(icon: Icon(Icons.ac_unit),label: 'Completed'),
      ]),
    );
  }
}