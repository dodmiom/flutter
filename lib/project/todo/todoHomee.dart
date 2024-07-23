import 'package:day1/project/todo/databasetodo.dart';
import 'package:day1/project/todo/mybutton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Todohome extends StatefulWidget {
  const Todohome({super.key});

  @override
  State<Todohome> createState() => _TodohomeState();
}

class _TodohomeState extends State<Todohome> {
  TodoDatabase db = TodoDatabase();

  var _mybox = Hive.box("mybox");
  final _controller = TextEditingController();
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updateDatabase();
  }

  @override
  void initState() {
    // TODO: implement initState

    if (_mybox.get("TODOLIST") == null) {
      db.createInitialState();
    } else {
      db.loadData();
    }
    super.initState();
  }

  void deletefunction(int index) {
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Todo",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
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
                            SizedBox(
                              height: 15.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                MyButton(
                                    text: "Save",
                                    onPressed: () {
                                      setState(() {
                                        db.todoList
                                            .add([_controller.text, false]);
                                        _controller.clear();
                                      });
                                      db.updateDatabase();
                                    }),
                                SizedBox(
                                  width: 10.0,
                                ),
                                MyButton(
                                    text: "Cancel",
                                    onPressed: () =>
                                        Navigator.of(context).pop())
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
          Expanded(
            child: ListView.builder(
                itemCount: db.todoList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Slidable(
                      endActionPane:
                          ActionPane(motion: StretchMotion(), children: [
                        SlidableAction(
                          onPressed: (context) {
                            setState(() {
                              db.todoList.removeAt(index);
                            });
                            db.updateDatabase();
                          },
                          icon: Icons.delete,
                          backgroundColor: Colors.red.shade300,
                          borderRadius: BorderRadius.circular(12),
                        )
                      ]),
                      child: SizedBox(
                        width: 400,
                        child: Container(
                          width: 200,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.amber[400]),
                          child: Center(
                            child: Row(
                              children: [
                                Checkbox(
                                  value: db.todoList[index][1],
                                  onChanged: (value) =>
                                      checkBoxChanged(value, index),
                                  activeColor: Colors.black,
                                ),
                                Center(
                                  child: Text(
                                    db.todoList[index][0],
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        decoration: db.todoList[index][1]
                                            ? TextDecoration.lineThrough
                                            : TextDecoration.none),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
      backgroundColor: Colors.amber[100],
    );
  }
}
