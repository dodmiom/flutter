import 'package:day1/project/mp3/mp3play.dart';
import 'package:day1/project/mp3/providermp3.dart';
import 'package:day1/project/mp3/song.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class Mp3Home extends StatefulWidget {
  const Mp3Home({super.key});

  @override
  State<Mp3Home> createState() => _Mp3HomeState();
}

class _Mp3HomeState extends State<Mp3Home> {
  late final dynamic playlistProvider;
  final List<String> ItemOptions = [
    'Add to playlist',
    'Delete',
    'Share',
    'Four'
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    playlistProvider = Provider.of<Mp3provider>(context, listen: false);
  }

  void gotoSong(int songIndex) {
    playlistProvider.currentSongIndex = songIndex;
    Navigator.push(context, MaterialPageRoute(builder: (context) => Mp3Play()));
  }

  final TextEditingController _searchController = TextEditingController();
  String searchText = '';
  List<String> filteredItems = [];
  void _onSearchChanged(String value) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          backgroundColor: Colors.white,
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 1.0, color: Colors.black),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Icon(
                            Icons.music_note_rounded,
                            color: const Color.fromARGB(255, 0, 0, 0),
                            size: 60,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ClipOval(
                                  child: SizedBox.fromSize(
                                    size: Size.fromRadius(40),
                                    child: Image.network(
                                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQffVXFgYxENiH-VLaMIoiIgkDilyO2hA9VIw&s",
                                      height: 40.0,
                                      width: 40.0,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 30.0,
                                ),
                                SizedBox(
                                  width: 150,
                                  child: Text(
                                    "Bishesh Shrestha",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              ListBody(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text("Home"),
                    leading: Icon(
                      Icons.home,
                      color: const Color.fromARGB(255, 0, 0, 0),
                      size: 25,
                    ),
                    onTap: () {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text("Settings"),
                    leading: Icon(
                      Icons.settings,
                      color: const Color.fromARGB(255, 0, 0, 0),
                      size: 25,
                    ),
                    onTap: () {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text("FAQ & feedback"),
                    leading: Icon(
                      Icons.message_outlined,
                      color: const Color.fromARGB(255, 0, 0, 0),
                      size: 25,
                    ),
                    onTap: () {},
                  ),
                ),
              ]),
            ],
          )),
      appBar: AppBar(
        leading: Builder(builder: (context) {
          return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(
                Icons.menu,
                color: const Color.fromARGB(255, 5, 5, 5),
              ));
        }),
        title: Container(
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextField(
            controller: _searchController,
            onChanged: _onSearchChanged,
            onSubmitted: (value) {},
            //
            decoration: const InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(16, 20, 16, 12),
                hintStyle: TextStyle(color: Colors.black),
                border: InputBorder.none,
                hintText: 'Search songs,playlists and artists'),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: const Color.fromARGB(255, 14, 13, 13),
              )),
        ],
        backgroundColor: Colors.white,
        elevation: 10,
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          SizedBox(
            width: double.infinity,
            height: 60,
            child: Container(
              color: const Color.fromARGB(223, 255, 255, 255),
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  "Songs",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    decoration: TextDecoration.underline,
                    decorationColor: Color.fromARGB(207, 105, 9, 168),
                    decorationThickness: 4,
                    decorationStyle: TextDecorationStyle.solid,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 80),
            child: Consumer<Mp3provider>(
              builder: ((context, value, child) {
                final List<Song> playlist = value.playlist;
                return ListView.separated(
                    itemBuilder: (context, index) {
                      final Song song = playlist[index];
                      return Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: ListTile(
                            tileColor: Color.fromARGB(246, 252, 251, 251),
                            onTap: () {
                              gotoSong(index);
                            },
                            leading: Image.network(song.audiopic),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      Share.share("text");
                                      // Share.share('text',subject:"df");
                                      // Share.shareXFiles(['${directory.path}/image.url'],text: "df")
                                    },
                                    icon: Icon(
                                      Icons.send,
                                      color: Color.fromARGB(255, 175, 175, 175),
                                    )),
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
                                          color: Color.fromARGB(
                                              255, 175, 175, 175),
                                        ),
                                        offset: Offset(0, 50),
                                        itemBuilder: (BuildContext context) {
                                          return ItemOptions.map<
                                              PopupMenuItem<String>>(
                                            (String value) {
                                              return PopupMenuItem<String>(
                                                value: value,
                                                child: TextButton(
                                                    onPressed: () {},
                                                    child: Text(
                                                      value,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
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
                            title: Column(
                              children: [
                                Text(
                                  "${song.artistname}- ${song.Name}",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                ),
                                Text(
                                  "Unknown artist | ${song.Name}..",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w200,
                                      color: Color.fromARGB(255, 83, 81, 81)),
                                ),
                              ],
                            )),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 20,
                      );
                    },
                    itemCount: playlist.length);
              }),
            ),
          )
        ],
      ),
    );
  }
}
