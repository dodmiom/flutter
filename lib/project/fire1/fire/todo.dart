import 'package:day1/project/todo/mybutton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoFlute extends StatefulWidget {
  const TodoFlute({super.key});

  @override
  State<TodoFlute> createState() => _TodoFluteState();
}

class _TodoFluteState extends State<TodoFlute> {
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Todo",
          style: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.amber[400],
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    backgroundColor: Colors.amber[400],
                    content: SizedBox(
                      child: Container(
                        width: 200,
                        height: 120,
                        child: Column(
                          children: [
                            TextField(
                              controller: _controller,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "Add a new Task",
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(
                                  child:
                                      MyButton(text: "Save", onPressed: () {}),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                SizedBox(
                                  child: MyButton(
                                      text: "Cancel",
                                      onPressed: () =>
                                          Navigator.of(context).pop()),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                });
          }),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Slidable(
                    endActionPane:
                        ActionPane(motion: StretchMotion(), children: [
                      SlidableAction(
                        onPressed: (context) {},
                        icon: Icons.delete,
                        backgroundColor: Colors.red.shade300,
                        borderRadius: BorderRadius.circular(12),
                      )
                    ]),
                    child: SizedBox(
                      child: Container(
                        width: 200,
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.amber[400]),
                        child: Row(
                          children: [
                            Text(
                              "hello",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  decoration:
                                      // db.todoList[index][1]
                                      //     ? TextDecoration.lineThrough
                                      //     :
                                      TextDecoration.none),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              })
        ],
      ),
      backgroundColor: Colors.amber[100],
    );
  }
}
