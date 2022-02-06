import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/modules/task.dart';
import 'package:todo_app/providers/task_providers.dart';
import 'package:velocity_x/velocity_x.dart';

class DataInputPage extends StatelessWidget {
  DataInputPage({Key? key}) : super(key: key);

  static const String id = '/data-input';
  final TextEditingController _titleController = TextEditingController();

  addTask(BuildContext context) {
    Task newTask = Task(title: _titleController.text, isCompleted: false);
    Provider.of<TaskProvider>(context, listen: false).addTask(newTask);

    //then go back to todos page
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    Task t1 = Task(title: "hi", isCompleted: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Add To-Do"),
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          "Adding a new task?".text.size(25).black.semiBold.makeCentered(),
          //const SizedBox(height:20,),
          20.heightBox, //we can use this instead of sizedbox()

          SizedBox(
            width: 350,
            child: TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 12),
                  border: OutlineInputBorder()),
            ),
          ),

          // Expanded(child: Container()),

          24.heightBox,

          CupertinoButton(
            child: 'Add a new Task'.text.make(),
            onPressed: () {
              addTask(context);
            },
            color: Theme.of(context).primaryColor,
          )
        ],
      ),
    );
  }
}
