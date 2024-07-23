import 'package:day1/project/newsapp/NewsappApi.dart';
import 'package:day1/project/newsapp/Newsmodal.dart';
import 'package:day1/project/newsapp/viewNewModal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:format/format.dart';

class NewHome extends StatefulWidget {
  const NewHome({super.key});

  @override
  State<NewHome> createState() => _NewHomeState();
}

enum FilterList { bbcNews, aryNews, cbc, cnn, reuters }

class _NewHomeState extends State<NewHome> {
  NewViewModal newViewModal = NewViewModal();
  late Future<NewAppModel> futureApp;
  String name = "bbc-news";
  FilterList? selectedmenu;
  @override
  void initState() {
    futureApp = newViewModal.fetchNewChannelHeadlinesApi(name);

    // TODO: implement initState
    super.initState();
    print(futureApp);
  }

  final format = DateFormat('MMMM dd, yyyy');
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "News",
          style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(Icons.filter_alt_outlined),
          onPressed: () {},
        ),
        actions: [
          DropdownButtonHideUnderline(
            child: ButtonTheme(
              alignedDropdown: true,
              child: PopupMenuButton(
                  color: Color.fromARGB(213, 8, 8, 8),
                  onSelected: (String value) {
                    // Perform action based on selected value
                    setState(() {});
                  },
                  icon: Icon(
                    Icons.more_vert_rounded,
                    color: Color.fromARGB(255, 175, 175, 175),
                  ),
                  offset: Offset(0, 50),
                  itemBuilder: (BuildContext context) {
                    return FilterList.values.map<PopupMenuItem<String>>(
                      (FilterList filterList) {
                        return PopupMenuItem<String>(
                          onTap: () {
                            setState(() {});
                            if (filterList.name == "bbcNews") {
                              name = "bbc-news";
                            }
                            if (filterList.name == "aryNews") {
                              name = "ary-news";
                            }
                            if (filterList.name == "cnn") {
                              name = "cnn";
                            }
                            if (filterList.name == "cbc") {
                              name = "cbc-news";
                            }
                            if (filterList.name == "reuters") {
                              name = "reuters";
                            }
                          },
                          value: filterList.name,
                          child: TextButton(
                              onPressed: () {},
                              child: Text(
                                filterList.name.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )),
                        );
                      },
                    ).toList();
                  }),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          SizedBox(
            height: height * .55,
            width: width * .2,
            child: FutureBuilder(
                future: newViewModal.fetchNewChannelHeadlinesApi(name),
                builder: (BuildContext context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text("error");
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data!.articles!.length,
                      itemBuilder: (context, index) {
                        DateTime dateTime = DateTime.parse(snapshot
                            .data!.articles![index].publishedAt
                            .toString());

                        return Container(
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                  height: height * 8.6,
                                  width: width * .9,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: height * .02),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: CachedNetworkImage(
                                      width: 100,
                                      imageUrl: snapshot
                                          .data!.articles![index].urlToImage
                                          .toString(),
                                      fit: BoxFit.cover,
                                      placeholder: (context, url) => Container(
                                          child: CircularProgressIndicator()),
                                      errorWidget: (context, url, error) =>
                                          Icon(
                                        Icons.error_outline,
                                        color: Colors.red,
                                      ),
                                    ),
                                  )),
                              Positioned(
                                bottom: 20,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Container(
                                    alignment: Alignment.bottomCenter,
                                    height: height * .22,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: width * 0.7,
                                          child: Text(
                                            snapshot
                                                .data!.articles![index].title
                                                .toString(),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.poppins(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                        Spacer(),
                                        Container(
                                          child: Row(
                                            children: [
                                              Text(
                                                snapshot.data!.articles![index]
                                                    .source
                                                    .toString(),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: GoogleFonts.poppins(
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                              Text(
                                                format.format(dateTime),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: GoogleFonts.poppins(
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    );
                  }
                }),
          )
        ],
      ),
    );
  }
}
