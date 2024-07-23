import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Mp3Play extends StatefulWidget {
  const Mp3Play({super.key});

  @override
  State<Mp3Play> createState() => _Mp3PlayState();
}

class _Mp3PlayState extends State<Mp3Play> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            top: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(left: 50.0, right: 50.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.white),
              height: 300,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.network(
                  "https://images.pexels.com/photos/1624496/pexels-photo-1624496.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 2,
            child: Container(
              width: MediaQuery.of(context).size.width,
              color: const Color.fromARGB(255, 255, 255, 255),
              height: 80,
              child: Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        "Closure",
                        style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 0, 248, 153)),
                      ),
                      const Text(
                        "The Chainsmoker",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              top: MediaQuery.of(context).size.height / 2 + 80,
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: const Color.fromARGB(255, 255, 255, 255),
                height: 80,
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 0)),
                  child: Slider(
                      min: 0,
                      max: 100,
                      value: 50,
                      activeColor: Color.fromARGB(255, 0, 248, 153),
                      onChanged: (value) {}),
                ),
              )),
          Positioned(
            top: MediaQuery.of(context).size.height / 2 + 180,
            child: Container(
              width: MediaQuery.of(context).size.width,
              color: Color.fromARGB(255, 243, 241, 241),
              height: 80,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.favorite,
                        color: Color.fromARGB(255, 245, 56, 43),
                        size: 20,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(CupertinoIcons.backward_end_fill, size: 30),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(
                        CupertinoIcons.pause_circle_fill,
                        color: Color.fromARGB(255, 0, 248, 153),
                        size: 50,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(CupertinoIcons.forward_end_fill, size: 30),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(CupertinoIcons.tray_arrow_down, size: 20),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
