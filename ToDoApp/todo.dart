import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Todo> Todos = [Todo("Hello", "dsjfksdjf", false)];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To Do and To Do"),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: Todos.length,
          itemBuilder: (context, index) {
            return Text(Todos[index].description);
          }),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Todos.add(Todo("A1", "sdfasdf", false));
            setState(() {});
          },
          label: const Icon(Icons.add)),
    );
  }
}

class Todo {
  String title, description;
  bool isDone;

  Todo(this.title, this.description, this.isDone);
}
