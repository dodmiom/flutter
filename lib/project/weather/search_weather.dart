import 'package:day1/project/weather/weathe_modal.dart';
import 'package:day1/project/weather/weather.dart';
import 'package:day1/project/weather/weather_api.dart';
import 'package:flutter/material.dart';

class SearchBarApp extends StatefulWidget {
  const SearchBarApp({super.key});

  @override
  State<SearchBarApp> createState() => _SearchBarAppState();
}

class _SearchBarAppState extends State<SearchBarApp> {
  final TextEditingController _searchController = TextEditingController();
  bool isSearchClicked = false;
  String searchText = '';
  List<String> items = [
    'Items 1',
    'Messi',
    'Ronaldo',
    'Virat Kohli',
    '2',
    'Rock',
    'Elon Musk',
  ];

  List<String> filteredItems = [];
  @override
  void initState() {
    super.initState();
    filteredItems = List.from(items);
  }

  final _weatherservice = WeatherService('66412fff0a56c2943689c49dac244a94');
  Weather? _weather;

  _fetchWeather() async {
    try {
      var weather = await _weatherservice.getWeather(_searchController.text);
      setState(() {
        _weather = weather;
      });
      print(_searchController.text);
    } catch (e) {
      print(e);
    }
  }

  void updateWeather() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WeatherPage(),
      ),
    );
    _fetchWeather();
  }

  void _onSearchChanged(String value) {
    setState(() {
      searchText = value;
      _weather?.cityname = value;
      myFilterItems();
    });
  }

  void myFilterItems() {
    if (searchText.isEmpty) {
      filteredItems = List.from(items);
    } else {
      filteredItems = items
          .where(
              (item) => item.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 9, 127, 223),
          /* if the search button is clickable then show
         the container otherwise text "Search Bar"*/
          title: isSearchClicked
              ? Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextField(
                    controller: _searchController,
                    onChanged: _onSearchChanged,
                    onSubmitted: (value) {
                      updateWeather();
                      // _weatherservice.getWeather(value);
                      // print(value);
                      // Navigator.pushReplacementNamed(context, '/weather');
                    },
                    // onTap: () {
                    //   _weatherservice.getWeather(_searchController.text);
                    //   Navigator.pushReplacementNamed(context, '/weather');
                    // },
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(16, 20, 16, 12),
                        hintStyle: TextStyle(color: Colors.black),
                        border: InputBorder.none,
                        hintText: 'Search y..'),
                  ),
                )
              : const Text(
                  "Search For a City",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  isSearchClicked = !isSearchClicked;
                  if (!isSearchClicked) {
                    _searchController.clear();
                    myFilterItems();
                  }
                });
              },
              icon: Icon(
                isSearchClicked ? Icons.close : Icons.search,
                color: Colors.white,
              ),
            )
          ],
        ),
        // body parts
        body: isSearchClicked
            ? Center(
                child: ListView.builder(
                    itemCount: filteredItems.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(filteredItems[index]),
                      );
                    }),
              )
            : Column());
  }
}
