import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
        useMaterial3: true,
      ),
      home: const CoursesPage(),
    );
  }
}

class CoursesPage extends StatefulWidget {
  const CoursesPage({super.key});

  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  List<String> _courses = [
    'Мобилни информациски системи',
    'Тимски проект',
    'Веб програмирање',
    'Вовед во науката за податоци',
    'Економија за ИКТ инженери'
  ];

  void addCourse() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          String courseName = "";
          return AlertDialog(
            title: const Text("Додај предмет"),
            content: TextField(
              onChanged: (name) {
                courseName = name;
              },
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (courseName.length > 0) {
                      _courses.add(courseName);
                    }
                    Navigator.pop(context);
                  });
                },
                child: const Text("Потврди"),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('191028'),
      ),
      body: ListView.builder(
          itemCount: _courses.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(
                  _courses[index],
                  style: const TextStyle(fontSize: 18),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    setState(() {
                      _courses.removeAt(index);
                    });
                  },
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
          onPressed: addCourse,
          backgroundColor: Colors.greenAccent,
          child: const Icon(Icons.add)),
    );
  }
}
