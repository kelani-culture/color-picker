import 'package:flutter/material.dart';

class TodolistTile extends StatelessWidget {
  final bool isTicked;
  final String taskName;
  Function(bool?)? onChanged;
  TodolistTile(
      {super.key,
      required this.isTicked,
      required this.onChanged,
      required this.taskName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, left: 8.0, right: 8.0),
      child: Container(
        decoration: const BoxDecoration(color: Color(0xFF7cb855)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Checkbox(
                value: isTicked,
                onChanged: onChanged,
                activeColor: const Color(0xFF7cb855),
                hoverColor: const Color(0xFFbbe06c),
              ),
              Text(
                taskName,
                style: TextStyle(
                    color: const Color(0xFFffffff),
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    decoration: isTicked ? TextDecoration.lineThrough : null),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
