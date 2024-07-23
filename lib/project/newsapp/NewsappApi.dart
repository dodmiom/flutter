import 'dart:convert';
import 'package:day1/project/newsapp/Newsmodal.dart';
import 'package:day1/project/newsapp/categoriesnewsappmodel.dart';
import 'package:http/http.dart' as http;

class NewAppApi {
  Future<NewAppModel> fetchNewAppApi() async {
    String url =
        'https://newsapi.org/v2/top-headlines/sources?&apiKey=12cfcb07c7324ac09ea263bb1c0ae8ad';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return NewAppModel.fromJson(
        jsonDecode(response.body),
      );
    } else {
      throw Exception('failed to loadmeme');
    }
  }

  Future<NewAppModel> fetchNewChannelHeadlinesApi(String channelName) async {
    String url =
        'https://newsapi.org/v2/top-headlines?sources=${channelName}&apiKey=12cfcb07c7324ac09ea263bb1c0ae8ad';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);

      return NewAppModel.fromJson(body);
    }
    throw Exception('Error');
  }

  Future<CategoriesNewsAppModel> fetchCategoriesNewAppApi(
      String categoryName) async {
    String url =
        'https://newsapi.org/v2/everything?q=${categoryName}&apiKey=12cfcb07c7324ac09ea263bb1c0ae8ad';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return CategoriesNewsAppModel.fromJson(
        jsonDecode(response.body),
      );
    } else {
      throw Exception('failed to loadmeme');
    }
  }
}
