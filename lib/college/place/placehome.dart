import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Place {
  String title;
  String details;

  Place({required this.title, required this.details});
}

class PlaceHome extends StatefulWidget {
  const PlaceHome({super.key});

  @override
  State<PlaceHome> createState() => _PlaceHomeState();
}

class _PlaceHomeState extends State<PlaceHome> {
  List<Place> places = [
    Place(
        title: "Kathmandu",
        details:
            "Kathmandu is the vibrant capital of Nepal. It is a major city in the picturesque Kathmandu Valley. Additionally, it is the nation’s hub for politics, business, and culture. Moreover, its streets are alive with old traditions, diverse communities, and a blend of the past and present.Kathmandu shines with UNESCO World Heritage Sites such as the sacred Hindu temple, Pashupatinath, where rituals by the Bagmati River symbolize the circle of life. The grand Boudhanath Stupa, bustling with pilgrims and colorful flags, represents Tibetan Buddhism. Meanwhile, the famous Swayambhunath, the Monkey Temple, offers peaceful city views. In Kathmandu, Durbar Squares display intricate Newari architecture, narrating stories of the city’s royal past. Thamel and Asan buzz with lively markets, cozy cafes, and unique shops, warmly welcoming travelers and locals alike."),
    Place(
        title: "Pokhara",
        details:
            "Under the Annapurna Massif lies a peaceful paradise in Nepal, Pokhara, that attracts travelers with its stunning scenery and rich culture. It is famous for its calm lakes, green valleys, and amazing views, drawing adventurers and peace-seekers from all over.In the core of Pokhara, you will find the breathtaking Phewa Lake. Its calm waters reflect the majestic Annapurna and Machhapuchhre mountains, creating a serene atmosphere. Boating on the lake lets you take in the peace and admire the stunning surroundings, especially at sunset when the lake transforms with vibrant colors."),
    Place(
        title: "Bhaktapur",
        details:
            "Bhaktapur, also called Bhadgaon, is a charming historic city in the Kathmandu Valley. It is famous for its ancient buildings, old culture, festivals and deep-rooted history. Besides Kathmandu and Lalitpur (Patan), Bhaktapur stands as one of the main cities in the valley, providing a window into the past with its charming streets, traditional Newari homes, and ancient temples. At the core of Bhaktapur lies its Durbar Square, acknowledged as a UNESCO World Heritage Site. The beautifully carved wooden palaces, temples, and courtyards here highlight the city’s impressive architecture. The Nyatapola Temple, honoring the goddess Siddhi Lakshmi, stands tall as a symbol of Bhaktapur’s strength and architectural excellence."),
    Place(
        title: "Lalitpur",
        details:
            "Lalitpur, also known as Patan, gracefully resides in the Kathmandu Valley, renowned for its ancient temples, detailed woodwork, and lively culture. Alongside Kathmandu and Bhaktapur, Lalitpur boasts a heritage spanning centuries.Patan Durbar Square presents magnificent palaces, temples, and courtyards embellished with exquisite carvings. Thus, Durbar Square stands as a testament to its architectural expertise. Within the square, the Patan Museum offers insight into Lalitpur’s artistic and cultural heritage. Furthermore, Lalitpur, or Patan, is famous for its rich heritage of Newari architectural design and skilled craftsmanship. The city has skilled artisans crafting intricate metalwork, pottery, and textiles. As the busy streets buzz with markets, festivals, and cultural happenings, visitors are warmly welcomed to immerse themselves in the vibrant atmosphere."),
    Place(
        title: "Chitwan",
        details:
            "Chitwan is one of the major cities in Nepal’s Terai region district. Visitors encounter a blend of culture, wildlife, and natural splendor here. Chitwan National Park, recognized as a UNESCO World Heritage Site, is popular in this area. You can see amazing animals like Bengal tigers, one-horned rhinoceroses, and Asian elephants roaming freely. It’s a stunning place to explore! Furthermore, the park’s lush forests, marshlands, and grasslands provide a haven for diverse plants and animals."),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Place",
          style: GoogleFonts.poppins(color: Colors.black, fontSize: 24),
        ),
        actions: [
          Builder(builder: (context) {
            return IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: Icon(Icons.menu));
          })
        ],
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: (places as List).length,
        itemBuilder: (BuildContext context, int index) {
          var item = places[index];
          return Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 25, 136, 226),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  border:
                      Border.all(color: Color.fromARGB(255, 233, 230, 230))),
              height: 150,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.all(20),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "${index + 1}",
                      style: GoogleFonts.poppins(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(221, 255, 255, 255)),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          item.title,
                          style: GoogleFonts.poppins(
                              fontSize: 23,
                              fontWeight: FontWeight.w700,
                              color: const Color.fromARGB(221, 255, 255, 255)),
                        ),
                        Wrap(children: [
                          Text(
                            item.details.substring(0, 20),
                            style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color:
                                    const Color.fromARGB(221, 255, 255, 255)),
                          )
                        ])
                      ],
                    ),
                    SizedBox(
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.arrow_forward),
                        iconSize: 45.0,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: Color.fromARGB(255, 3, 170, 199),
        foregroundColor: Color.fromARGB(255, 252, 252, 252),
        shape: RoundedRectangleBorder(
            side: BorderSide(width: 3, color: Color.fromARGB(255, 3, 170, 199)),
            borderRadius: BorderRadius.circular(100)),
      ),
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
                    onPressed: () {},
                  ),
                ),
                ListTile(
                  leading: IconButton(
                    icon: Icon(
                      Icons.personal_injury_outlined,
                      color: Colors.white,
                      size: 25,
                    ),
                    onPressed: () {},
                  ),
                ),
                ListTile(
                  leading: IconButton(
                    icon: Icon(
                      Icons.list_alt,
                      color: Colors.white,
                      size: 25,
                    ),
                    onPressed: () {},
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
