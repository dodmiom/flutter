import 'package:day1/project/shortvideo/videodetail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CardItem {
  final String url;
  final String title;
  final String thumbnail;
  final String desc;
  const CardItem(
      {required this.url,
      required this.title,
      required this.desc,
      required this.thumbnail});
}

enum DataSourceType { asset, network, file, contentUri }

class Videomain extends StatefulWidget {
  @override
  State<Videomain> createState() => _VideomainState();
}

class _VideomainState extends State<Videomain> {
  List<CardItem> servicess = [
    CardItem(
        url:
            "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
        title: "Big Buck Bunn",
        thumbnail: "https://media.w3.org/2010/05/sintel/poster.png",
        desc:
            "Big Buck Bunny tells the story of a giant rabbit with a heart bigger than himself. When one sunny day three rodents rudely harass him, something snaps... and the rabbit ain't no bunny anymore! In the typical cartoon tradition he prepares the nasty rodents a comical revenge.,,Licensed under the Creative Commons Attribution license,http://www.bigbuckbunny.org"),
    CardItem(
        url:
            "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
        title: "Elephant Dream",
        thumbnail: "https://media.w3.org/2010/05/sintel/poster.png",
        desc: "The first Blender Open Movie from 2006"),
    CardItem(
        url:
            "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
        title: "For Bigger Blazes",
        thumbnail: "https://media.w3.org/2010/05/sintel/poster.png",
        desc:
            "HBO GO now works with Chromecast -- the easiest way to enjoy online video on your TV. For when you want to settle into your Iron Throne to watch the latest episodes. For 35.,Learn how to use Chromecast with HBO GO and more at google.com/chromecast."),
    CardItem(
        url:
            "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
        title: "For Bigger Escape",
        thumbnail: "https://media.w3.org/2010/05/sintel/poster.png",
        desc:
            "Introducing Chromecast. The easiest way to enjoy online video and music on your TV—for when Batman's escapes aren't quite big enough. For 35. Learn how to use Chromecast with Google Play Movies and more at google.com/chromecast."),
    CardItem(
        url:
            "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4",
        title: "For Bigger Fun",
        thumbnail: "https://media.w3.org/2010/05/sintel/poster.png",
        desc:
            "Introducing Chromecast. The easiest way to enjoy online video and music on your TV. For 35.  Find out more at google.com/chromecast."),
    CardItem(
        url:
            "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4",
        title: "Sintel",
        thumbnail: "https://media.w3.org/2010/05/sintel/poster.png",
        desc:
            "Sintel is an independently produced short film, initiated by the Blender Foundation as a means to further improve and validate the free/open source 3D creation suite Blender. With initial funding provided by 1000s of donations via the internet community, it has again proven to be a viable development model for both open 3D technology as for independent animation film.,This 15 minute film has been realized in the studio of the Amsterdam Blender Institute, by an international team of artists and developers. In addition to that, several crucial technical and creative targets have been realized online, by developers and artists and teams all over the world.,www.sintel.org"),
    CardItem(
        url:
            "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/SubaruOutbackOnStreetAndDirt.mp4",
        title: "Subaru Outback On Street And Dirt",
        thumbnail: "https://media.w3.org/2010/05/sintel/poster.png",
        desc:
            "Smoking Tire takes the all-new Subaru Outback to the highest point we can find in hopes our customer-appreciation Balloon Launch will get some free T-shirts into the hands of our viewers."),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "Tutorial.com",
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          backgroundColor: Colors.red[400],
          foregroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              ListView.separated(
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 10,
                  );
                },
                itemCount: (servicess as List).length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  // index = index % 2;
                  var item = servicess[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return VideoDetailPage(
                            itemtitle: item.title,
                            itemdesc: item.desc,
                            itemthumbnail: item.thumbnail,
                            itemurl: item.url);
                      }));
                    },
                    child: Container(
                      height: 250,
                      width: double.infinity,
                      color: const Color.fromARGB(255, 245, 245, 245),
                      margin: EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 150,
                            height: 100,
                            child: Image.network(item.thumbnail),
                          ),
                          SizedBox(
                            width: 300,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Wrap(
                                  children: [
                                    Text(
                                      item.title,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color:
                                              Color.fromARGB(255, 44, 42, 42)),
                                    ),
                                    Text(
                                      item.desc.substring(0, 40),
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w100,
                                          color:
                                              Color.fromARGB(255, 44, 42, 42)),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ));
  }
}
