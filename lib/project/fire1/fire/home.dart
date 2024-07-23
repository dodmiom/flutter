import 'dart:js';

import 'package:day1/project/fire1/fire/loginscreen.dart';
import 'package:day1/project/fire1/fire/util.dart';
import 'package:day1/project/todo/mybutton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:uuid/uuid.dart';

class PostHome extends StatefulWidget {
  const PostHome({super.key});

  @override
  State<PostHome> createState() => _PostHomeState();
}

class _PostHomeState extends State<PostHome> {
  final uuid = Uuid().v4();
  bool changeButton = false;
  final auth = FirebaseAuth.instance;
  final _textcontroller = TextEditingController();

  final _searchController = TextEditingController();
  final _updateController = TextEditingController();
  final todoRef = FirebaseDatabase.instance.ref("Todo");
  late List<Map<String, dynamic>> items;

  void Createpost() {
    // try {
    //   setState(() {
    //     changeButton = true;
    //   });
    //   await todoRef
    //       .child(uuid)
    //       .set({"todoId": uuid, "title": _textcontroller.text.toString()});
    //   Utils().toastMessage("Task Added", true);
    //   setState(() {
    //     changeButton = false;
    //   });
    // } catch (e) {
    //   Utils().toastMessage(e.toString(), false);
    //   setState(() {
    //     changeButton = false;
    //   });
    // }
    DateTime currentTime = DateTime.now().toUtc();
    int timestampInMilliseconds = currentTime.toUtc().millisecondsSinceEpoch;
    final id = uuid + DateTime.now().microsecondsSinceEpoch.toString();
    setState(() {
      changeButton = true;
    });
    todoRef.child(id).set({
      "todoId": id,
      "title": _textcontroller.text.toString(),
      "timestamp": timestampInMilliseconds
    }).then((value) {
      Utils().toastMessage("Task Added", true);
      setState(() {
        changeButton = false;
      });
      _textcontroller.text = "";
    }).onError((error, stackTrace) {
      Utils().toastMessage(error.toString(), false);
      setState(() {
        changeButton = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Color.fromARGB(255, 5, 111, 233),
        centerTitle: true,
        title: Text("Post"),
        actions: [
          IconButton(
              onPressed: () {
                auth
                    .signOut()
                    .then((value) => Navigator.push(context,
                        CupertinoPageRoute(builder: (ctx) => LoginScreen())))
                    .onError((error, stackTrace) =>
                        Utils().toastMessage(error.toString(), false));
              },
              icon: Icon(Icons.logout))
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    backgroundColor: Color.fromARGB(255, 5, 111, 233),
                    content: SizedBox(
                      child: Container(
                        width: 200,
                        height: 120,
                        child: Column(
                          children: [
                            TextField(
                              controller: _textcontroller,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "Add a new Task",
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(
                                  child: MyButton(
                                      text: "Save",
                                      onPressed: () {
                                        Createpost();
                                        setState(() {
                                          Navigator.of(context).pop();
                                        });
                                      }),
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
          Container(
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: TextField(
              controller: _searchController,
              onChanged: (String value) {
                setState(() {});
              },
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(16, 20, 16, 12),
                  hintStyle: TextStyle(color: Colors.black),
                  border: InputBorder.none,
                  hintText: 'Search Todo List'),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Expanded(
            child: FirebaseAnimatedList(
              query: todoRef.orderByChild("timestamp"),
              defaultChild: Text('Not Found'),
              itemBuilder: ((context, snapshot, animation, index) {
                final text = snapshot.child("title").value.toString();
                if (_searchController.text.isEmpty) {
                  return Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Slidable(
                      startActionPane:
                          ActionPane(motion: StretchMotion(), children: [
                        SlidableAction(
                          onPressed: (context) {
                            Future<void> showUpdatedialog(
                                String title, String id) {
                              _updateController.text = title;
                              return showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      backgroundColor:
                                          Color.fromARGB(255, 220, 226, 233),
                                      content: SizedBox(
                                        child: Container(
                                          width: 200,
                                          height: 120,
                                          child: Column(
                                            children: [
                                              TextField(
                                                controller: _updateController,
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  hintText: "Update",
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  SizedBox(
                                                    child: MyButton(
                                                        text: "Update",
                                                        onPressed: () {
                                                          todoRef
                                                              .child(id)
                                                              .update({
                                                            "title":
                                                                _updateController
                                                                    .text
                                                                    .toString()
                                                          }).then((value) {
                                                            Utils().toastMessage(
                                                                "$title is Updated to ${_updateController.text.toString()}",
                                                                true);
                                                          }).onError((error,
                                                                  stackTrace) {
                                                            Utils().toastMessage(
                                                                error
                                                                    .toString(),
                                                                false);
                                                          });

                                                          setState(() {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          });
                                                        }),
                                                  ),
                                                  SizedBox(
                                                    width: 10.0,
                                                  ),
                                                  SizedBox(
                                                    child: MyButton(
                                                        text: "Cancel",
                                                        onPressed: () =>
                                                            Navigator.of(
                                                                    context)
                                                                .pop()),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  });
                            }

                            showUpdatedialog(text,
                                snapshot.child("todoId").value.toString());
                          },
                          icon: Icons.edit,
                          foregroundColor: Colors.white,
                          backgroundColor: Color.fromARGB(255, 8, 60, 230),
                          borderRadius: BorderRadius.circular(12),
                        )
                      ]),
                      endActionPane:
                          ActionPane(motion: StretchMotion(), children: [
                        SlidableAction(
                          onPressed: (context) {
                            todoRef
                                .child(
                                    snapshot.child("todoId").value.toString())
                                .remove()
                                .then((v) {
                              print("deleted");
                            }).catchError((onError) {
                              print(onError);
                            });
                          },
                          icon: Icons.delete,
                          backgroundColor: Colors.red,
                          borderRadius: BorderRadius.circular(12),
                        )
                      ]),
                      child: SizedBox(
                        child: Center(
                          child: Container(
                            width: MediaQuery.of(context).size.width - 50,
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Color.fromARGB(255, 7, 7, 7)),
                            child: Row(
                              children: [
                                Center(
                                  child: Text(
                                    snapshot.child('title').value.toString(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        decoration:
                                            // db.todoList[index][1]
                                            //     ? TextDecoration.lineThrough
                                            //     :
                                            TextDecoration.none),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                } else if (text.toLowerCase().contains(
                    _searchController.text.toLowerCase().toString())) {
                  return Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Slidable(
                      endActionPane:
                          ActionPane(motion: StretchMotion(), children: [
                        SlidableAction(
                          onPressed: (context) {},
                          icon: Icons.delete,
                          backgroundColor: Colors.red,
                          borderRadius: BorderRadius.circular(12),
                        )
                      ]),
                      child: SizedBox(
                        child: Center(
                          child: Container(
                            width: MediaQuery.of(context).size.width - 50,
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Color.fromARGB(255, 7, 7, 7)),
                            child: Row(
                              children: [
                                Center(
                                  child: Text(
                                    snapshot.child('title').value.toString(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        decoration:
                                            // db.todoList[index][1]
                                            //     ? TextDecoration.lineThrough
                                            //     :
                                            TextDecoration.none),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                } else {
                  return Container();
                }
              }),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Center(
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  todoRef.
                  
                },
                icon: Icon(Icons.clear_rounded)),
          )
        ],
      ),
    );
  }
}
