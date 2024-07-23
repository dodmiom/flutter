import 'package:day1/project/newsapp/NewsappApi.dart';
import 'package:day1/project/newsapp/Newsmodal.dart';
import 'package:day1/project/newsapp/categoriesnewsappmodel.dart';

class NewViewModal {
  final _res = NewAppApi();
  Future<NewAppModel> fetchNewAppApi() async {
    final response = await _res.fetchNewAppApi();
    return response;
  }

  Future<NewAppModel> fetchNewChannelHeadlinesApi(String channelName) async {
    final response = await _res.fetchNewChannelHeadlinesApi(channelName);
    return response;
  }

  Future<CategoriesNewsAppModel> fetchcategoryNewChannelHeadlinesApi(
      String catename) async {
    final response = await _res.fetchCategoriesNewAppApi(catename);
    return response;
  }
}
