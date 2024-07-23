import 'package:day1/college/dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Project22 extends StatelessWidget {
  const Project22({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Center(
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     mainAxisSize: MainAxisSize.max,
          //     children: [
          //       IconButton(
          //         onPressed: () {
          //           Navigator.push(context, CupertinoPageRoute(builder: (ctx) {
          //             return Dashboardpage();
          //           }));
          //         },
          //         icon: Icon(
          //           Icons.search,
          //           color: const Color.fromARGB(255, 10, 10, 10),
          //         ),
          //       ),
          //       IconButton(
          //         onPressed: () {
          //           Navigator.pushReplacementNamed(context, "/dashboard");
          //         },
          //         icon: Icon(
          //           Icons.search,
          //           color: Color.fromARGB(255, 209, 35, 35),
          //         ),
          //       )
          //     ],
          //   ),
          // ),
          Positioned(
            child: Container(
              color: const Color.fromARGB(255, 243, 20, 4),
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        height: MediaQuery.of(context).size.height / 2,
                        width: MediaQuery.of(context).size.width / 1.5,
                        color: Color.fromARGB(255, 4, 155, 243),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        height: MediaQuery.of(context).size.height / 2,
                        width: MediaQuery.of(context).size.width / 1.5,
                        color: Color.fromARGB(255, 191, 243, 4),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              bottom: MediaQuery.of(context).size.height / 2 - 25,
              left: MediaQuery.of(context).size.width / 2 - 25,
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Color.fromARGB(255, 59, 2, 2),
                child: IconButton(
                  icon: Icon(
                    size: 40,
                    Icons.add,
                    color: Color.fromARGB(255, 243, 243, 243),
                  ),
                  onPressed: () {},
                ),
              )),

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 100,
              color: Color.fromARGB(255, 4, 243, 104),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 50,
              color: Color.fromARGB(255, 8, 8, 8),
            ),
          ),
        ],
      ),
    );
  }
}
