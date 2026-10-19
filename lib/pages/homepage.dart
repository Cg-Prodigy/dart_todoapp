import 'package:flutter/material.dart';
import 'package:todoapp/components/calender.dart';
import 'package:todoapp/components/taskcategories.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final tasks = false;
    return Padding(
      padding: .all(5),
      child: Stack(
        children: [
          Column(
            spacing: 10,
            children: [
              Calender(),
              Taskcategories(),
              if (!tasks) ...[
                Expanded(
                  child: Row(
                    mainAxisAlignment: .center,
                    children: [
                      Icon(Icons.task_alt),
                      Text("You're all caught up"),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
