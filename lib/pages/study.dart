import 'package:flutter/material.dart';
import 'package:todoapp/components/taskcategories.dart';

Widget addNewTask() {
  return Form(child: Column(mainAxisSize: .min));
}

class Study extends StatefulWidget {
  final TaskCategory taskcategory;
  const Study({super.key, required this.taskcategory});

  @override
  State<Study> createState() => _StudyState();
}

class _StudyState extends State<Study> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          spacing: 10,
          children: [
            Icon(
              widget.taskcategory.icon,
              color: widget.taskcategory.color(context),
              
            ),
            Text("My ${widget.taskcategory.label.split("").join(" ").toUpperCase()}"),
          ],
        ),
      ),
      floatingActionButton: IconButton(
        iconSize: 30,
        onPressed: () {},
        icon: Icon(Icons.add),
        style: IconButton.styleFrom(
          backgroundColor: widget.taskcategory.color(context),
          foregroundColor: widget.taskcategory.onColor(context),
        ),
      ),
    );
  }
}
