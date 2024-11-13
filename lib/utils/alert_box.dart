import 'package:flutter/material.dart';

class AlertBox extends StatelessWidget {
  final TextEditingController controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  AlertBox(
      {super.key,
      required this.onSave,
      required this.onCancel,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 1,
      child: Column(
        children: [
          TextField(controller: controller),
          Row(
            children: [
              // save button
              Padding(
                padding: const EdgeInsets.only(left: 25.0, top: 12),
                child: ElevatedButton(
                  onPressed: onSave,
                  style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero),
                      backgroundColor: Color(0xFFbbe06c)),
                  child: const Text("save"),
                ),
              ),
              // cancel button
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 12),
                child: ElevatedButton(
                  onPressed: onCancel,
                  style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero),
                      backgroundColor: const Color(0xFFbbe06c)),
                  child: const Text("cancel"),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
