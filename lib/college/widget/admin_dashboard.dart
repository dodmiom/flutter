import 'package:day1/college/listview/builder_listview.dart';
import 'package:day1/college/listview/custom_listview.dart';
import 'package:day1/college/listview/listview_seperated.dart';
import 'package:day1/college/listview/normal_listview.dart';
import 'package:flutter/material.dart';
import 'package:spincircle_bottom_bar/modals.dart';
import 'package:spincircle_bottom_bar/spincircle_bottom_bar.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  Widget childwidget = Normal_listview();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Admin Dashboard"),
          backgroundColor: Colors.deepOrangeAccent,
        ),
        //Adding SpinCircleBottomBarHolder to body of Scaffold
        body: SpinCircleBottomBarHolder(
          bottomNavigationBar: SCBottomBarDetails(
              circleColors: [Colors.white, Colors.orange, Colors.redAccent],
              iconTheme: IconThemeData(color: Colors.black45),
              activeIconTheme: IconThemeData(color: Colors.orange),
              backgroundColor: Colors.white,
              titleStyle: TextStyle(color: Colors.black45, fontSize: 12),
              activeTitleStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
              actionButtonDetails: SCActionButtonDetails(
                  color: Colors.redAccent,
                  icon: Icon(
                    Icons.expand_less,
                    color: Colors.white,
                  ),
                  elevation: 2),
              elevation: 2.0,
              items: [
                // Suggested count : 4
                SCBottomBarItem(
                    icon: Icons.verified_user,
                    title: "Normal ListView",
                    onPressed: () {
                      childwidget = Normal_listview();
                      setState(() {});
                    }),
                SCBottomBarItem(
                    icon: Icons.supervised_user_circle,
                    title: "Builder ListView",
                    onPressed: () {
                      childwidget = Builder_listview();
                      setState(() {});
                    }),
                SCBottomBarItem(
                    icon: Icons.notifications,
                    title: "Separated ListView",
                    onPressed: () {
                      childwidget = Listview_seperated();
                      setState(() {});
                    }),
                SCBottomBarItem(
                    icon: Icons.details,
                    title: "Custom ListView",
                    onPressed: () {
                      childwidget = Customlistview();
                      setState(() {});
                    }),
              ],
              circleItems: [
                //Suggested Count: 3
                SCItem(icon: Icon(Icons.add), onPressed: () {}),
                SCItem(icon: Icon(Icons.print), onPressed: () {}),
                SCItem(icon: Icon(Icons.map), onPressed: () {}),
              ],
              bnbHeight: 80 // Suggested Height 80
              ),
          child: Container(
              color: Colors.orangeAccent.withAlpha(55), child: childwidget),
        ),
      ),
    );
  }
}
