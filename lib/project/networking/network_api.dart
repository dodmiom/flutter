import 'dart:convert';

import 'package:day1/project/networking/model_network.dart';
import 'package:http/http.dart' as http;

abstract class API {
  static final String _baseurl = 'https://api.imgflip.com/';

  static Future<MemeData> getMemes() async {
    final response = await http.get(Uri.parse('$_baseurl/get_memes'));
    if (response.statusCode == 200) {
      final MemeResponse memeResponse = MemeResponse.fromJson(
        jsonDecode(response.body),
      );
      return memeResponse.data!;
    } else {
      throw Exception('failed to loadmeme');
    }
  }
}
