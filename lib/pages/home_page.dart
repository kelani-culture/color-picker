import 'package:color_picker/pages/todolist_tile.dart';
import 'package:color_picker/utils/alert_box.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();
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
          return AlertDialog(
            backgroundColor: const Color(0xFF7cb855),
            title: const Text("Add task"),
            content: AlertBox(
              onSave: saveTask,
              onCancel: cancelTask,
              controller: _controller,
            ),
          );
        });
  }

  // save user task
  void saveTask() {
    setState(() {
      if (_controller.text.trim().isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Please enter a task before saving"),
          backgroundColor: Color.fromARGB(255, 248, 17, 0),
        ));
      } else {
        tasks.add([_controller.text, false]);
      }
      Navigator.of(context).pop();
    });
    _controller.clear();
  }

  // cancel user task
  void cancelTask() {
    Navigator.of(context).pop();
  }

  // delete task
  void deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
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
              onDelete: (context) {
                deleteTask(index);
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
