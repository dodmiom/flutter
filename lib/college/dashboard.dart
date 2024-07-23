import 'package:day1/college/mylistview.dart';
import 'package:day1/college/orderpage.dart';
import 'package:day1/college/project22.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dashboardpage extends StatefulWidget {
  const Dashboardpage({super.key});

  @override
  State<Dashboardpage> createState() => _DashboardpageState();
}

class _DashboardpageState extends State<Dashboardpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          backgroundColor: Color.fromARGB(255, 61, 61, 61),
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                  currentAccountPicture: ClipOval(
                    child: SizedBox.fromSize(
                      size: Size.fromRadius(90),
                      child: Image.network(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQffVXFgYxENiH-VLaMIoiIgkDilyO2hA9VIw&s",
                        height: 80.0,
                        width: 80.0,
                      ),
                    ),
                  ),
                  accountName: Text("Bishesh Shrestha"),
                  accountEmail: Text("Bishesh@gmail.com")),
              ListBody(
                children: [
                  ListTile(
                    leading: IconButton(
                      icon: Icon(
                        Icons.home,
                        color: Colors.white,
                        size: 25,
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            CupertinoPageRoute(builder: (ctx) {
                          return OrderPage();
                        }));
                      },
                    ),
                  ),
                  ListTile(
                    leading: IconButton(
                      icon: Icon(
                        Icons.personal_injury_outlined,
                        color: Colors.white,
                        size: 25,
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            CupertinoPageRoute(builder: (ctx) {
                          return Project22();
                        }));
                      },
                    ),
                  ),
                  ListTile(
                    leading: IconButton(
                      icon: Icon(
                        Icons.list_alt,
                        color: Colors.white,
                        size: 25,
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            CupertinoPageRoute(builder: (ctx) {
                          return MylistView();
                        }));
                      },
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        appBar: AppBar(
          title: Text(
            "Dashboard",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          centerTitle: false,
          leading: Builder(builder: (context) {
            return IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: Icon(
                  Icons.dehaze_sharp,
                  color: Colors.white,
                ));
          }),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                )),
          ],
          backgroundColor: Color.fromARGB(255, 53, 52, 52),
          elevation: 10,
          shadowColor: Colors.green,
        ),
        body: const MylistView());
  }
}
