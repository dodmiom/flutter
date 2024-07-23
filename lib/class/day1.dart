import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CardItem {
  final String urlImage;
  final String title;
  const CardItem({
    required this.urlImage,
    required this.title,
  });
}

// late List<Widget> _pages;
final CarouselController _pagecontroller = CarouselController();
int current = 0;
// Timer? _timer;

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<CardItem> items = [
    CardItem(urlImage: "assets/image/nepalidol.jpeg", title: "Nepal Idol"),
    CardItem(
        urlImage: "assets/image/urbanhub.png", title: "Nation's Got Talent"),
  ];

  List<CardItem> servicess = [
    CardItem(
        urlImage:
            "https://images.unsplash.com/photo-1559268950-2d7ceb2efa3a?q=80&w=1528&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        title: "Nepal Airlines"),
    CardItem(
        urlImage:
            "https://play-lh.googleusercontent.com/4tgg_YOJ0a_sOph6irnXCF4ziBuVaptXH6ATLL0tum11xL59LwKX-lHQd5b4opNOY_8=w600-h300-pc0xffffff-pd",
        title: "TDO Nepal"),
    CardItem(
        urlImage:
            "https://images.unsplash.com/flagged/photo-1557650454-65194af63bf9?q=80&w=1480&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        title: "Rhino Pass"),
    CardItem(
        urlImage:
            "https://images.unsplash.com/photo-1611974789855-9c2a0a7236a3?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        title: "Trade Management"),
    CardItem(
        urlImage:
            "https://cdn.esewa.com.np//ui/images/logos/merchants/90KDASIcdHd5Y1s0Jx3cName_Urban.png",
        title: "Name Model SEE"),
    CardItem(
        urlImage:
            "https://images.unsplash.com/photo-1525382455947-f319bc05fb35?q=80&w=1496&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        title: "Panda Life"),
  ];
  List<CardItem> NewService = [
    CardItem(urlImage: "assets/image/heatathome.jpeg", title: "Health at Home"),
    CardItem(
        urlImage: "assets/image/Health-Insurance.jpg",
        title: "Alfa health & Care"),
    CardItem(
        urlImage: "assets/image/naasa_email.jpg", title: "Naasa Securities"),
    CardItem(
        urlImage: "assets/image/insurance.jpg",
        title: "National Life Insurance"),
    CardItem(urlImage: "assets/image/nepalidol.jpeg", title: "Name Model SEE"),
    CardItem(
        urlImage: "assets/image/Prabhu-Bank.jpg", title: "Prabhu Mahalaxmi"),
    CardItem(
        urlImage: "assets/image/dishhome.jpg", title: "Dish Home Yearly Offer"),
    CardItem(urlImage: "assets/image/telecom.png", title: "Nepal Telecom Data"),
    CardItem(
        urlImage: "assets/image/Meroshare-mobile-app.jpg",
        title: "Mero Share and DEMAT"),
  ];
  List<String> images = [
    "https://www.vianet.com.np/wp-content/uploads/2022/04/referral-offer-news-and-events-2020-04-12.png",
    "https://techlekh.com/wp-content/uploads/2024/01/orangeNXT.jpg",
    "https://thirdwheel.com.np/assets/frontend/images/article/2214_renew.png"
  ];

  List<CardItem> voting = [
    CardItem(
        urlImage: "assets/image/nepalidol.jpeg", title: "Nepal Idol Season 5"),
    CardItem(
        urlImage: "assets/image/urbanhub.png", title: "Nation's Got Talent"),
    CardItem(
        urlImage: "assets/image/grandcoronation.jpg",
        title: "Grand Coronation"),
    CardItem(
        urlImage: "assets/image/seeidol.jpg", title: "SEE Dance Championship"),
    CardItem(urlImage: "assets/image/seeidol3.jpg", title: "SEE IDOL 3"),
    CardItem(
        urlImage: "assets/image/chadragiri.jpg", title: "Chandragiri hikers"),
  ];

  // @override
  // void initState() {
  //   super.initState();
  //   _pages = List.generate(
  //       images.length,
  //       (index) => Image.network(
  //             images[index],
  //           ));

  //   startTimer();
  // }

  @override
  Widget build(BuildContext context) {
    bool visibleWidget = false;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Color.fromRGBO(245, 247, 253, 1),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        toolbarHeight: 200.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(90),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 3, 199, 13),
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0, bottom: 100.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Builder(builder: (context) {
                    return IconButton(
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                      icon: Icon(
                        Icons.person_outlined,
                        color: Colors.black,
                      ),
                      style: IconButton.styleFrom(
                          backgroundColor: Colors.white,
                          iconSize: 33.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                    );
                  }),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      "Hi, Bishesh",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: <Widget>[
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0, bottom: 100.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      style: IconButton.styleFrom(
                        iconSize: 33.0,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, bottom: 100.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.notifications,
                        color: Colors.white,
                      ),
                      style: IconButton.styleFrom(
                        iconSize: 33.0,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 10.0, right: 15.0, bottom: 100.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.child_care_outlined,
                        color: Colors.white,
                      ),
                      style: IconButton.styleFrom(
                        iconSize: 33.0,
                      ),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  //box 1
                  Padding(
                    padding: const EdgeInsets.only(top: 200.0),
                    child: Container(
                      width: double.infinity,
                      height: 190,
                      margin: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          border: Border.all(color: Colors.black26)),
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Container(
                            height: 80.0,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 233, 230, 230),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20)),
                                border: Border.all(
                                    color: Color.fromARGB(255, 233, 230, 230))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10.0),
                                              child: Column(
                                                children: [
                                                  Icon(
                                                    Icons
                                                        .account_balance_wallet_outlined,
                                                    color: Colors.black87,
                                                  )
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  SizedBox(
                                                    width: 55.0,
                                                    child: Center(
                                                      child: Text(
                                                        "NPR Balance",
                                                        style: TextStyle(
                                                          color: Colors.black87,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    "XXXXX.X",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 18),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              IconButton(
                                                onPressed: () {},
                                                icon: Column(
                                                  children: [
                                                    Icon(
                                                      Icons
                                                          .remove_red_eye_outlined,
                                                      color:
                                                          const Color.fromARGB(
                                                              255, 32, 32, 32),
                                                    ),
                                                  ],
                                                ),
                                                style: IconButton.styleFrom(
                                                  iconSize: 23.0,
                                                  backgroundColor: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 10.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Icon(
                                                    Icons.local_florist_rounded,
                                                    color: Colors.black87,
                                                  )
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  SizedBox(
                                                    width: 95.0,
                                                    child: Center(
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            "XXXXX.X",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 18),
                                                          ),
                                                          Icon(
                                                            Icons
                                                                .arrow_forward_ios,
                                                            color: Colors.green,
                                                            size: 18.0,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 95.0,
                                                    child: Center(
                                                      child: Text(
                                                        "Reward Points",
                                                        style: TextStyle(
                                                          color: Colors.black87,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: Column(
                                        children: [
                                          Center(
                                            child: Icon(
                                              Icons.arrow_downward,
                                              size: 10.0,
                                              color: Colors.green,
                                            ),
                                          ),
                                          Icon(
                                            Icons.local_atm_rounded,
                                            color: const Color.fromARGB(
                                                255, 32, 32, 32),
                                          ),
                                        ],
                                      ),
                                      style: IconButton.styleFrom(
                                        iconSize: 33.0,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 45.0,
                                      child: Center(
                                        child: Text(
                                          "Load Money",
                                          style: TextStyle(
                                            color: Colors.black87,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: Column(
                                        children: [
                                          Center(
                                            child: Icon(
                                              Icons.arrow_upward,
                                              size: 10.0,
                                              color: Colors.green,
                                            ),
                                          ),
                                          Icon(
                                            Icons.local_atm_rounded,
                                            color: const Color.fromARGB(
                                                255, 32, 32, 32),
                                          ),
                                        ],
                                      ),
                                      style: IconButton.styleFrom(
                                        iconSize: 33.0,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 45.0,
                                      child: Center(
                                        child: Text(
                                          "Send Money",
                                          style: TextStyle(
                                            color: Colors.black87,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20.0),
                                            child: Icon(
                                              Icons.arrow_upward,
                                              size: 10.0,
                                              color: Colors.green,
                                            ),
                                          ),
                                          Icon(
                                            Icons.account_balance_outlined,
                                            color: const Color.fromARGB(
                                                255, 32, 32, 32),
                                          ),
                                        ],
                                      ),
                                      style: IconButton.styleFrom(
                                        iconSize: 33.0,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 54.0,
                                      child: Center(
                                        child: Text(
                                          "Bank Transfer",
                                          style: TextStyle(
                                            color: Colors.black87,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: Column(
                                        children: [
                                          Icon(
                                            Icons.change_circle_outlined,
                                            color: const Color.fromARGB(
                                                255, 32, 32, 32),
                                          ),
                                        ],
                                      ),
                                      style: IconButton.styleFrom(
                                        iconSize: 33.0,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 75.0,
                                      child: Center(
                                        child: Text(
                                          "Remittance",
                                          style: TextStyle(
                                            color: Colors.black87,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),

                  //box 2
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      width: double.infinity,
                      margin: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          border: Border.all(color: Colors.black26)),
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Container(
                            height: 80.0,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(244, 255, 254, 254),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10.0),
                                                child: SizedBox(
                                                  width: 254.0,
                                                  child: Center(
                                                    child: Text(
                                                      "Utility & Bill Payments",
                                                      style: TextStyle(
                                                          color: Colors.black87,
                                                          fontSize: 22,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  ),
                                                )),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Wrap(
                              alignment: WrapAlignment.spaceAround,
                              runAlignment: WrapAlignment.spaceAround,
                              spacing: 40,
                              runSpacing: 30,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: Column(
                                          children: [
                                            Icon(
                                              Icons.phone_android_rounded,
                                              color: const Color.fromARGB(
                                                  255, 32, 32, 32),
                                            ),
                                          ],
                                        ),
                                        style: IconButton.styleFrom(
                                          iconSize: 33.0,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 70.0,
                                        child: Center(
                                          child: Text(
                                            "Topup and Data",
                                            style: TextStyle(
                                              color: Colors.black87,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: Column(
                                          children: [
                                            Icon(
                                              Icons.lightbulb_outline,
                                              color: const Color.fromARGB(
                                                  255, 32, 32, 32),
                                            ),
                                          ],
                                        ),
                                        style: IconButton.styleFrom(
                                          iconSize: 33.0,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 70.0,
                                        child: Center(
                                          child: Text(
                                            "Electricity",
                                            style: TextStyle(
                                              color: Colors.black87,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: Column(
                                          children: [
                                            Icon(
                                              Icons.water_drop_outlined,
                                              color: const Color.fromARGB(
                                                  255, 32, 32, 32),
                                            ),
                                          ],
                                        ),
                                        style: IconButton.styleFrom(
                                          iconSize: 33.0,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 70.0,
                                        child: Center(
                                          child: Text(
                                            "Khanepani",
                                            style: TextStyle(
                                              color: Colors.black87,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: Column(
                                          children: [
                                            Icon(
                                              Icons.router_outlined,
                                              color: const Color.fromARGB(
                                                  255, 32, 32, 32),
                                            ),
                                          ],
                                        ),
                                        style: IconButton.styleFrom(
                                          iconSize: 33.0,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 70.0,
                                        child: Center(
                                          child: Text(
                                            "Internet",
                                            style: TextStyle(
                                              color: Colors.black87,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: Column(
                                          children: [
                                            Icon(
                                              Icons.balance_sharp,
                                              color: const Color.fromARGB(
                                                  255, 32, 32, 32),
                                            ),
                                          ],
                                        ),
                                        style: IconButton.styleFrom(
                                          iconSize: 33.0,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 70.0,
                                        child: Center(
                                          child: Text(
                                            "Govt. Payment",
                                            style: TextStyle(
                                              color: Colors.black87,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: Column(
                                          children: [
                                            Icon(
                                              Icons.live_tv_outlined,
                                              color: const Color.fromARGB(
                                                  255, 32, 32, 32),
                                            ),
                                          ],
                                        ),
                                        style: IconButton.styleFrom(
                                          iconSize: 33.0,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 70.0,
                                        child: Center(
                                          child: Text(
                                            "Television",
                                            style: TextStyle(
                                              color: Colors.black87,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: Column(
                                          children: [
                                            Icon(
                                              Icons.school_outlined,
                                              color: const Color.fromARGB(
                                                  255, 32, 32, 32),
                                            ),
                                          ],
                                        ),
                                        style: IconButton.styleFrom(
                                          iconSize: 33.0,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 70.0,
                                        child: Center(
                                          child: Text(
                                            "Education Fee",
                                            style: TextStyle(
                                              color: Colors.black87,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Visibility(
                                  visible: visibleWidget == true ? false : true,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            visibleWidget = true;
                                            print("clicked");
                                            setState(() {});
                                          },
                                          icon: Column(
                                            children: [
                                              Icon(
                                                Icons
                                                    .arrow_forward_ios_outlined,
                                                color: Color.fromARGB(
                                                    255, 3, 250, 36),
                                              ),
                                            ],
                                          ),
                                          style: IconButton.styleFrom(
                                            iconSize: 33.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Visibility(
                                  visible: visibleWidget ? true : false,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                          onPressed: () {},
                                          icon: Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 20.0),
                                                child: Icon(
                                                  Icons.arrow_upward,
                                                  size: 10.0,
                                                  color: Colors.green,
                                                ),
                                              ),
                                              Icon(
                                                Icons.account_balance_outlined,
                                                color: const Color.fromARGB(
                                                    255, 32, 32, 32),
                                              ),
                                            ],
                                          ),
                                          style: IconButton.styleFrom(
                                            iconSize: 33.0,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 70.0,
                                          child: Center(
                                            child: Text(
                                              "Bank Transfer",
                                              style: TextStyle(
                                                color: Colors.black87,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      width: double.infinity,
                      margin: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          border: Border.all(color: Colors.black26)),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  child: Icon(
                                    Icons.notifications_active_outlined,
                                    color: Colors.black87,
                                  ),
                                ),
                                SizedBox(
                                  width: 200,
                                  child: Column(
                                    children: [
                                      Text(
                                        "Link your bank account",
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Wrap(
                                        children: [
                                          SizedBox(
                                            width: 150,
                                            child: Text(
                                              "for easy load and seamless payments",
                                              style: TextStyle(
                                                fontSize: 11,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0, left: 5.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 5.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          "Link Now >",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.green,
                                            shadows: [
                                              Shadow(
                                                blurRadius: 10.0, // shadow blur
                                                color: Colors
                                                    .green, // shadow color
                                                offset: Offset(2.0, 2.0),
                                              ),
                                            ],
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      width: double.infinity,
                      margin: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          border: Border.all(color: Colors.black26)),
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Container(
                            height: 80.0,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(244, 255, 254, 254),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10.0),
                                                child: SizedBox(
                                                  width: 254.0,
                                                  child: Center(
                                                    child: Text(
                                                      "Travels & Ticketing",
                                                      style: TextStyle(
                                                          color: Colors.black87,
                                                          fontSize: 22,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  ),
                                                )),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Wrap(
                              alignment: WrapAlignment.spaceAround,
                              runAlignment: WrapAlignment.spaceAround,
                              spacing: 40,
                              runSpacing: 30,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: Column(
                                          children: [
                                            Icon(
                                              Icons.airplanemode_on_sharp,
                                              color: const Color.fromARGB(
                                                  255, 32, 32, 32),
                                            ),
                                          ],
                                        ),
                                        style: IconButton.styleFrom(
                                          iconSize: 33.0,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 70.0,
                                        child: Center(
                                          child: Text(
                                            "Airlines",
                                            style: TextStyle(
                                              color: Colors.black87,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: Column(
                                          children: [
                                            Icon(
                                              Icons.vpn_lock_outlined,
                                              color: const Color.fromARGB(
                                                  255, 32, 32, 32),
                                            ),
                                          ],
                                        ),
                                        style: IconButton.styleFrom(
                                          iconSize: 33.0,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 70.0,
                                        child: Center(
                                          child: Text(
                                            "Intl Airlines",
                                            style: TextStyle(
                                              color: Colors.black87,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: Column(
                                          children: [
                                            Icon(
                                              Icons.business_sharp,
                                              color: const Color.fromARGB(
                                                  255, 32, 32, 32),
                                            ),
                                          ],
                                        ),
                                        style: IconButton.styleFrom(
                                          iconSize: 33.0,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 70.0,
                                        child: Center(
                                          child: Text(
                                            "Hotels",
                                            style: TextStyle(
                                              color: Colors.black87,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: Column(
                                          children: [
                                            Icon(
                                              Icons.bus_alert_outlined,
                                              color: const Color.fromARGB(
                                                  255, 32, 32, 32),
                                            ),
                                          ],
                                        ),
                                        style: IconButton.styleFrom(
                                          iconSize: 33.0,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 70.0,
                                        child: Center(
                                          child: Text(
                                            "Bus Ticket",
                                            style: TextStyle(
                                              color: Colors.black87,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: Column(
                                          children: [
                                            Icon(
                                              Icons.movie_creation_outlined,
                                              color: const Color.fromARGB(
                                                  255, 32, 32, 32),
                                            ),
                                          ],
                                        ),
                                        style: IconButton.styleFrom(
                                          iconSize: 33.0,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 70.0,
                                        child: Center(
                                          child: Text(
                                            "Movies",
                                            style: TextStyle(
                                              color: Colors.black87,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: Column(
                                          children: [
                                            Icon(
                                              Icons.thumb_up_alt_outlined,
                                              color: const Color.fromARGB(
                                                  255, 32, 32, 32),
                                            ),
                                          ],
                                        ),
                                        style: IconButton.styleFrom(
                                          iconSize: 33.0,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 70.0,
                                        child: Center(
                                          child: Text(
                                            "Voting",
                                            style: TextStyle(
                                              color: Colors.black87,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: Column(
                                          children: [
                                            Icon(
                                              Icons.car_repair_outlined,
                                              color: const Color.fromARGB(
                                                  255, 32, 32, 32),
                                            ),
                                          ],
                                        ),
                                        style: IconButton.styleFrom(
                                          iconSize: 33.0,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 70.0,
                                        child: Center(
                                          child: Text(
                                            "Cable Car",
                                            style: TextStyle(
                                              color: Colors.black87,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Visibility(
                                  visible: visibleWidget == true ? false : true,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            visibleWidget = true;
                                            print("clicked");
                                            setState(() {});
                                          },
                                          icon: Column(
                                            children: [
                                              Icon(
                                                Icons
                                                    .arrow_forward_ios_outlined,
                                                color: Color.fromARGB(
                                                    255, 3, 250, 36),
                                              ),
                                            ],
                                          ),
                                          style: IconButton.styleFrom(
                                            iconSize: 33.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Visibility(
                                  visible: visibleWidget ? true : false,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                          onPressed: () {},
                                          icon: Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 20.0),
                                                child: Icon(
                                                  Icons.arrow_upward,
                                                  size: 10.0,
                                                  color: Colors.green,
                                                ),
                                              ),
                                              Icon(
                                                Icons.account_balance_outlined,
                                                color: const Color.fromARGB(
                                                    255, 32, 32, 32),
                                              ),
                                            ],
                                          ),
                                          style: IconButton.styleFrom(
                                            iconSize: 33.0,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 70.0,
                                          child: Center(
                                            child: Text(
                                              "Bank Transfer",
                                              style: TextStyle(
                                                color: Colors.black87,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      width: double.infinity,
                      margin: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          border: Border.all(color: Colors.black26)),
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Container(
                            height: 80.0,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(244, 255, 254, 254),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10.0),
                                                child: SizedBox(
                                                  width: 254.0,
                                                  child: Center(
                                                    child: Text(
                                                      "Insurance",
                                                      style: TextStyle(
                                                          color: Colors.black87,
                                                          fontSize: 22,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  ),
                                                )),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Wrap(
                              alignment: WrapAlignment.spaceAround,
                              runAlignment: WrapAlignment.spaceAround,
                              spacing: 10,
                              runSpacing: 10,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: Column(
                                          children: [
                                            Icon(
                                              Icons.health_and_safety_outlined,
                                              color: const Color.fromARGB(
                                                  255, 32, 32, 32),
                                            ),
                                          ],
                                        ),
                                        style: IconButton.styleFrom(
                                          iconSize: 33.0,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 70.0,
                                        child: Center(
                                          child: Text(
                                            "eSewa Care",
                                            style: TextStyle(
                                              color: Colors.black87,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: Column(
                                          children: [
                                            Icon(
                                              Icons.payments,
                                              color: const Color.fromARGB(
                                                  255, 32, 32, 32),
                                            ),
                                          ],
                                        ),
                                        style: IconButton.styleFrom(
                                          iconSize: 33.0,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 70.0,
                                        child: Center(
                                          child: Text(
                                            "Bluebook Renewal",
                                            style: TextStyle(
                                              color: Colors.black87,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Visibility(
                                  visible: visibleWidget == true ? false : true,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            visibleWidget = true;
                                            print("clicked");
                                            setState(() {});
                                          },
                                          icon: Column(
                                            children: [
                                              Icon(
                                                Icons
                                                    .arrow_forward_ios_outlined,
                                                color: Color.fromARGB(
                                                    255, 3, 250, 36),
                                              ),
                                            ],
                                          ),
                                          style: IconButton.styleFrom(
                                            iconSize: 33.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      width: double.infinity,
                      margin: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          border: Border.all(color: Colors.black26)),
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Container(
                            height: 80.0,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(244, 255, 254, 254),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10.0),
                                                child: SizedBox(
                                                  width: 254.0,
                                                  child: Center(
                                                    child: Text(
                                                      "Financial Payments",
                                                      style: TextStyle(
                                                          color: Colors.black87,
                                                          fontSize: 22,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  ),
                                                )),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Wrap(
                              alignment: WrapAlignment.spaceAround,
                              runAlignment: WrapAlignment.spaceAround,
                              spacing: 40,
                              runSpacing: 30,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: Column(
                                          children: [
                                            Icon(
                                              Icons.assessment_outlined,
                                              color: const Color.fromARGB(
                                                  255, 32, 32, 32),
                                            ),
                                          ],
                                        ),
                                        style: IconButton.styleFrom(
                                          iconSize: 33.0,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 70.0,
                                        child: Center(
                                          child: Text(
                                            "Mero Share & DEMAT",
                                            style: TextStyle(
                                              color: Colors.black87,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: Column(
                                          children: [
                                            Icon(
                                              Icons.account_balance_rounded,
                                              color: const Color.fromARGB(
                                                  255, 32, 32, 32),
                                            ),
                                          ],
                                        ),
                                        style: IconButton.styleFrom(
                                          iconSize: 33.0,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 70.0,
                                        child: Center(
                                          child: Text(
                                            "Sahakari Deposit",
                                            style: TextStyle(
                                              color: Colors.black87,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: Column(
                                          children: [
                                            Icon(
                                              Icons.monetization_on,
                                              color: const Color.fromARGB(
                                                  255, 32, 32, 32),
                                            ),
                                          ],
                                        ),
                                        style: IconButton.styleFrom(
                                          iconSize: 33.0,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 70.0,
                                        child: Center(
                                          child: Text(
                                            "ATM Withdraw",
                                            style: TextStyle(
                                              color: Colors.black87,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: Column(
                                          children: [
                                            Icon(
                                              Icons.credit_card,
                                              color: const Color.fromARGB(
                                                  255, 32, 32, 32),
                                            ),
                                          ],
                                        ),
                                        style: IconButton.styleFrom(
                                          iconSize: 33.0,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 70.0,
                                        child: Center(
                                          child: Text(
                                            "Credit Card",
                                            style: TextStyle(
                                              color: Colors.black87,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: Column(
                                          children: [
                                            Icon(
                                              Icons.phonelink_lock,
                                              color: const Color.fromARGB(
                                                  255, 32, 32, 32),
                                            ),
                                          ],
                                        ),
                                        style: IconButton.styleFrom(
                                          iconSize: 33.0,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 70.0,
                                        child: Center(
                                          child: Text(
                                            "EMI",
                                            style: TextStyle(
                                              color: Colors.black87,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: Column(
                                          children: [
                                            Icon(
                                              Icons.edit_document,
                                              color: const Color.fromARGB(
                                                  255, 32, 32, 32),
                                            ),
                                          ],
                                        ),
                                        style: IconButton.styleFrom(
                                          iconSize: 33.0,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 70.0,
                                        child: Center(
                                          child: Text(
                                            "Broker",
                                            style: TextStyle(
                                              color: Colors.black87,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: Column(
                                          children: [
                                            Icon(
                                              Icons.car_repair_outlined,
                                              color: const Color.fromARGB(
                                                  255, 32, 32, 32),
                                            ),
                                          ],
                                        ),
                                        style: IconButton.styleFrom(
                                          iconSize: 33.0,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 70.0,
                                        child: Center(
                                          child: Text(
                                            "Cable Car",
                                            style: TextStyle(
                                              color: Colors.black87,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Visibility(
                                  visible: visibleWidget == true ? false : true,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            visibleWidget = true;
                                            print("clicked");
                                            setState(() {});
                                          },
                                          icon: Column(
                                            children: [
                                              Icon(
                                                Icons
                                                    .arrow_forward_ios_outlined,
                                                color: Color.fromARGB(
                                                    255, 3, 250, 36),
                                              ),
                                            ],
                                          ),
                                          style: IconButton.styleFrom(
                                            iconSize: 33.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Visibility(
                                  visible: visibleWidget ? true : false,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                          onPressed: () {},
                                          icon: Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 20.0),
                                                child: Icon(
                                                  Icons.arrow_upward,
                                                  size: 10.0,
                                                  color: Colors.green,
                                                ),
                                              ),
                                              Icon(
                                                Icons.account_balance_outlined,
                                                color: const Color.fromARGB(
                                                    255, 32, 32, 32),
                                              ),
                                            ],
                                          ),
                                          style: IconButton.styleFrom(
                                            iconSize: 33.0,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 70.0,
                                          child: Center(
                                            child: Text(
                                              "Bank Transfer",
                                              style: TextStyle(
                                                color: Colors.black87,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Container(
                      height: 200,
                      color: Color.fromARGB(255, 255, 255, 255),
                      width: double.infinity,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          index = index % 2;
                          var item = items[index];
                          return Container(
                            width: 350,
                            height: 150,
                            margin: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                border: Border.all(color: Colors.black26)),
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20.0),
                                  child: Image.asset(
                                    item.urlImage,
                                    width: double.infinity,
                                    height: 130,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          item.title,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10.0),
                                        child: TextButton(
                                          onPressed: () {},
                                          child: Text(
                                            "Vote Now",
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 3, 199, 13),
                                                fontWeight: FontWeight.w300,
                                                fontSize: 20),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Container(
                      height: 200,
                      color: Color.fromARGB(255, 255, 255, 255),
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10.0, top: 1.0),
                                          child: SizedBox(
                                            width: 200.0,
                                            child: Center(
                                              child: Text(
                                                "Popular Services",
                                                style: TextStyle(
                                                    color: Colors.black87,
                                                    fontSize: 22,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ),
                                          )),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 80.0),
                                        child: TextButton(
                                          onPressed: () {},
                                          child: Text(
                                            "View More >",
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 3, 199, 13),
                                                fontWeight: FontWeight.w300,
                                                fontSize: 20),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 140.0,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: (servicess as List).length,
                              itemBuilder: (BuildContext context, int index) {
                                var item = servicess[index];
                                return Container(
                                  margin: const EdgeInsets.all(10.0),
                                  child: Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(70.0),
                                        child: Image.network(
                                          item.urlImage,
                                          width: 80,
                                          height: 60,
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 5.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: SizedBox(
                                                width: 90,
                                                child: Text(
                                                  item.title,
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Container(
                      height: 200,
                      color: Color.fromARGB(255, 255, 255, 255),
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10.0, top: 1.0),
                                          child: SizedBox(
                                            width: 200.0,
                                            child: Center(
                                              child: Text(
                                                "New Services",
                                                style: TextStyle(
                                                    color: Colors.black87,
                                                    fontSize: 22,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ),
                                          )),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 80.0),
                                        child: TextButton(
                                          onPressed: () {},
                                          child: Text(
                                            "View More >",
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 3, 199, 13),
                                                fontWeight: FontWeight.w300,
                                                fontSize: 20),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 140.0,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: (NewService as List).length,
                              itemBuilder: (BuildContext context, int index) {
                                var item = NewService[index];
                                return Container(
                                  margin: const EdgeInsets.all(10.0),
                                  child: Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(70.0),
                                        child: Image.asset(
                                          item.urlImage,
                                          width: 80,
                                          height: 60,
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 5.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: SizedBox(
                                                width: 90,
                                                child: Text(
                                                  item.title,
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: CarouselSlider(
                                items: [
                                  Image.asset("assets/image/c1.png",
                                      fit: BoxFit.cover,
                                      width: double.infinity),
                                  Image.asset("assets/image/c2.jpg",
                                      fit: BoxFit.cover,
                                      width: double.infinity),
                                  Image.asset("assets/image/c3.png",
                                      fit: BoxFit.cover,
                                      width: double.infinity),
                                ],
                                carouselController: _pagecontroller,
                                options: CarouselOptions(
                                    scrollPhysics:
                                        const BouncingScrollPhysics(),
                                    autoPlay: true,
                                    aspectRatio: 2,
                                    viewportFraction: 1,
                                    onPageChanged: (index, context) {
                                      setState(() {
                                        current = index;
                                      });
                                    }),
                              ),
                            ),
                            Positioned(
                                bottom: 10,
                                left: 0,
                                right: 0,
                                child: SizedBox())
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Container(
                      height: 200,
                      color: Color.fromARGB(255, 255, 255, 255),
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10.0, top: 1.0),
                                          child: SizedBox(
                                            width: 200.0,
                                            child: Center(
                                              child: Text(
                                                "Voting & Events",
                                                style: TextStyle(
                                                    color: Colors.black87,
                                                    fontSize: 22,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ),
                                          )),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 80.0),
                                        child: TextButton(
                                          onPressed: () {},
                                          child: Text(
                                            "View More >",
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 3, 199, 13),
                                                fontWeight: FontWeight.w300,
                                                fontSize: 20),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 140.0,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: (voting as List).length,
                              itemBuilder: (BuildContext context, int index) {
                                var item = voting[index];
                                return Container(
                                  margin: const EdgeInsets.all(10.0),
                                  child: Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(70.0),
                                        child: Image.asset(
                                          item.urlImage,
                                          width: 80,
                                          height: 60,
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 5.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: SizedBox(
                                                width: 100,
                                                child: Text(
                                                  item.title,
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      width: double.infinity,
                      margin: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          border: Border.all(color: Colors.black26)),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: ListTile(
                                leading: Icon(
                                  Icons.card_giftcard,
                                ),
                                title: Column(
                                  children: [
                                    Text(
                                      "Cashback & Offers",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      "View all offers & available promocodes.",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w200,
                                          color:
                                              Color.fromARGB(255, 83, 81, 81)),
                                    ),
                                  ],
                                )),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.symmetric(
                                    horizontal: BorderSide(
                                        color: const Color.fromARGB(
                                            255, 211, 209, 209)))),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: ListTile(
                                  leading: Icon(
                                    Icons.message_sharp,
                                  ),
                                  title: Column(
                                    children: [
                                      Text(
                                        "24x7 Help & Support",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                      Text(
                                        "Raise a ticket or view progress of your tickets",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w200,
                                            color: Color.fromARGB(
                                                255, 83, 81, 81)),
                                      ),
                                    ],
                                  )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: ListTile(
                                leading: Image.asset("image/robot.png",
                                    height: 30, width: 30),
                                title: Column(
                                  children: [
                                    Text(
                                      "eSewa Virtual Assistant (eVA)",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      "eSewa AI Assistant for your queries",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w200,
                                          color:
                                              Color.fromARGB(255, 83, 81, 81)),
                                    ),
                                  ],
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.qr_code_scanner_sharp),
        backgroundColor: Color.fromARGB(255, 3, 199, 13),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
            side: BorderSide(width: 3, color: Colors.green.shade500),
            borderRadius: BorderRadius.circular(100)),
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 10.0,
        shape: CircularNotchedRectangle(),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.home,
                    color: Colors.black87,
                  ),
                  Text(
                    "Home",
                    style: TextStyle(
                      color: Colors.black87,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.library_books_sharp,
                    color: Colors.black87,
                  ),
                  Text(
                    "Statement",
                    style: TextStyle(
                      color: Colors.black87,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.mobile_friendly_rounded,
                    color: Colors.black87,
                  ),
                  Text(
                    "My Payment",
                    style: TextStyle(
                      color: Colors.black87,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.offline_share_sharp,
                    color: Colors.black87,
                  ),
                  Text(
                    "Offers",
                    style: TextStyle(
                      color: Colors.black87,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                    child: UserAccountsDrawerHeader(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 3, 199, 13),
                          border: Border.all(
                            width: 0, // Set border width to 0
                            color: Color.fromARGB(255, 253, 253, 253),
                          ),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40),
                          )),
                      currentAccountPictureSize:
                          Size(MediaQuery.of(context).size.width * 0.65, 100),
                      currentAccountPicture: Center(
                        child: CircleAvatar(
                          child: ClipOval(
                            child: Image.network(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQffVXFgYxENiH-VLaMIoiIgkDilyO2hA9VIw&s",
                              width: 150,
                            ),
                          ),
                        ),
                      ),
                      accountName: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Bishesh Shrestha",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      accountEmail: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "23543534534",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Column(
                      children: [
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: ListTile(
                                onTap: () {},
                                leading: Icon(
                                  Icons.description_outlined,
                                ),
                                title: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "My Information",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                      textAlign: TextAlign.start,
                                    ),
                                    Text(
                                      "View your personal detail",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w200,
                                          color:
                                              Color.fromARGB(255, 83, 81, 81)),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.symmetric(
                                  horizontal: BorderSide(
                                      color: const Color.fromARGB(
                                          255, 211, 209, 209)))),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: ListTile(
                                onTap: () {},
                                leading: Icon(
                                  Icons.security_update_good,
                                ),
                                title: Column(
                                  children: [
                                    Text(
                                      "Devices & Credentials",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      "Manage your devices credential & notification IDs",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w200,
                                          color:
                                              Color.fromARGB(255, 83, 81, 81)),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.symmetric(
                                  horizontal: BorderSide(
                                      color: const Color.fromARGB(
                                          255, 211, 209, 209)))),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: ListTile(
                                onTap: () {},
                                leading: Icon(
                                  Icons.account_balance,
                                ),
                                title: Column(
                                  children: [
                                    Text(
                                      "Bank Accounts",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      "Manage your linked and saved bank accounts.",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w200,
                                          color:
                                              Color.fromARGB(255, 83, 81, 81)),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.symmetric(
                                  horizontal: BorderSide(
                                      color: const Color.fromARGB(
                                          255, 211, 209, 209)))),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: ListTile(
                                onTap: () {},
                                leading: Icon(Icons.speed_sharp),
                                title: Column(
                                  children: [
                                    Text(
                                      "Transaction Limits",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      "View your transaction limits",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w200,
                                          color:
                                              Color.fromARGB(255, 83, 81, 81)),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: ListTile(
                                onTap: () {},
                                leading: Icon(
                                  Icons.card_giftcard_outlined,
                                ),
                                title: Column(
                                  children: [
                                    Text(
                                      "Offers & Promocodes",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      "View all offers & available promocodes",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w200,
                                          color:
                                              Color.fromARGB(255, 83, 81, 81)),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.symmetric(
                                  horizontal: BorderSide(
                                      color: const Color.fromARGB(
                                          255, 211, 209, 209)))),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: ListTile(
                                onTap: () {},
                                leading: Icon(
                                  Icons.logout_rounded,
                                ),
                                title: Column(
                                  children: [
                                    Text(
                                      "Logout",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      "Log out from eSewa account",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w200,
                                          color:
                                              Color.fromARGB(255, 83, 81, 81)),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
