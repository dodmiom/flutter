import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
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
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.person_outlined,
                      color: Colors.black,
                    ),
                    style: IconButton.styleFrom(
                        backgroundColor: Colors.white,
                        iconSize: 33.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
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
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Expanded(
                  child: SizedBox(
                height: 1000.0,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
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
                                      color:
                                          Color.fromARGB(255, 233, 230, 230))),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
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
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    SizedBox(
                                                      width: 55.0,
                                                      child: Center(
                                                        child: Text(
                                                          "NPR Balance",
                                                          style: TextStyle(
                                                            color:
                                                                Colors.black87,
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
                                            padding: const EdgeInsets.only(
                                                left: 10.0),
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
                                                        color: const Color
                                                            .fromARGB(
                                                            255, 32, 32, 32),
                                                      ),
                                                    ],
                                                  ),
                                                  style: IconButton.styleFrom(
                                                    iconSize: 23.0,
                                                    backgroundColor:
                                                        Colors.white,
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
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Icon(
                                                      Icons
                                                          .local_florist_rounded,
                                                      color: Colors.black87,
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
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
                                                              color:
                                                                  Colors.green,
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
                                                            color:
                                                                Colors.black87,
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
                                color: Color.fromARGB(255, 233, 230, 230),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20)),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
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
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10.0),
                                                  child: SizedBox(
                                                    width: 204.0,
                                                    child: Center(
                                                      child: Text(
                                                        "Utility & Bill Payments",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black87,
                                                            fontSize: 25,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
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
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ))
              //box 1
              //box 2
            ],
          ),
        ),
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
    );
  }
}
