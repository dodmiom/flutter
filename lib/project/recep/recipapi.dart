// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:day1/project/recep/recepmodal.dart';

// class ReceipeApi {
//   static Future<List<Receipe>> getReceipe() async {
//     var uri = Uri.https('https://yummly2.p.rapidapi.com', '/feeds/list', {
//       "limit": '24',
//       "start": '0',
//     });
//     final response = await http.get(uri, headers: {
//       'x-rapidapi-key': 'b0292751bbmshb2f327a15a6a706p127035jsna842e7a2207f',
//       'x-rapidapi-host': 'yummly2.p.rapidapi.com',
//       'useQueryString': 'true'
//     });

//     Map<String, dynamic> data = jsonEncode(response.body);
//     List _temp = [];

//     for (var i in data['feed']) {
//       _temp.add(i['content']['details']);
//     }
//     return Receipe.receipeSnap(_temp);
//   }
// }
