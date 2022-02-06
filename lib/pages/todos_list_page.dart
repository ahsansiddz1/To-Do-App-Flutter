import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/pages/data_input_page.dart';
import 'package:todo_app/providers/task_providers.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:lottie/lottie.dart';

class TodosListPage extends StatelessWidget {
  static const String id = '/todos-page';
  const TodosListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        title: Center(child: const Text("Todos")),
      ),
      body: Consumer<TaskProvider>(
        builder: (context, taskProvider, child) => Column(
          //  mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: (taskProvider.tasks.isEmpty)
                  ? Center(
                      child: LottieBuilder.asset('assets/anims/sad_emoji.json'),
                    )
                  : ListView.builder(
                      itemCount: taskProvider.tasks.length,
                      itemBuilder: (context, index) => Dismissible(
                            key: Key(taskProvider.tasks[index].title),

                            //-----------------on dismissed
                            onDismissed: (direction) {
                              Provider.of<TaskProvider>(context, listen: false)
                                  .removeTask(index);

                              // child:
                              // (taskProvider.tasks.isEmpty)
                              //     ? Center(
                              //         child: LottieBuilder.asset(
                              //             'assets/anims/sad_emoji.json'),
                              //       )
                              //     : print("no todo");
                            },
                            child: Card(
                                child: ListTile(
                              title: Text(
                                taskProvider.tasks[index].title,
                              ),
                              subtitle: taskProvider.tasks[index].isCompleted
                                  ? "Completed".text.make()
                                  : const Text("Incomplete"),
                            )),
                          )),
            ),
            CupertinoButton(
              child: 'Add a new Task'.text.make(),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DataInputPage()));
                // Navigator.pushNamed(context, DataInputPage.id);
              },
              color: Theme.of(context).primaryColor,
            )
          ],
        ).p(24),
      ),
    );
  }
}
