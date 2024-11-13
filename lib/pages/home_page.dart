import 'package:color_picker/pages/todolist_tile.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List tasks = [
    ["Write your code", false],
    ["Eat your food", false],
    ["Sleep", false]
  ];

  void checkTask(bool? check, int index) {
    setState(() {
      tasks[index][1] = !tasks[index][1];
    });
  }

  void addTask() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return const AlertDialog(title: Text("Add task"));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'TO DO',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            return TodolistTile(
              isTicked: tasks[index][1],
              taskName: tasks[index][0],
              onChanged: (value) {
                checkTask(value, index);
              },
            );
          }),
      backgroundColor: const Color(0xFFbbe06c),
      floatingActionButton: FloatingActionButton(
        onPressed: addTask,
        backgroundColor: const Color(0xFF7cb855),
        hoverColor: const Color(0xFFbbe06c),
        child: const Icon(Icons.add),
      ),
    );
  }
}
