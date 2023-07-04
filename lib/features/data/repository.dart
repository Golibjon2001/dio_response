import 'package:dio/dio.dart';
import 'package:diorequest/features/pages/add_page/data/add_model.dart';
import 'package:diorequest/features/pages/home_page/data/home_model.dart';

class HomeRepository {

  Future<List<HomeModel>> homeLoded() async {
    final dio = Dio();
    Response response = await dio
        .get("https://61f2ded52219930017f5094a.mockapi.io/api/contacts");
    if (response.statusCode == 200 || response.statusCode == 201) {
      List<dynamic> data = response.data;
      List<HomeModel> homeModels =
          data.map((item) => HomeModel.fromJson(item)).toList();
      return homeModels;
    }
    return null!;
  }



  Future<HomeModel> delete(postId) async {
    final dio = Dio();
    Response response = await dio.delete(
        "https://61f2ded52219930017f5094a.mockapi.io/api/contacts/$postId");
    if (response.statusCode == 200) {
      final data = response.data;
      HomeModel homeModels = HomeModel.fromJson(data);
      return homeModels;
    }
    return null!;
  }

  Future<AddModel> add(AddModel addModel) async {
    final dio = Dio();
    final data = {
      'mobile': addModel.mobile!,
      'fullname': addModel.fullname!,
    };
    Response response = await dio.post(
        "https://61f2ded52219930017f5094a.mockapi.io/api/contacts",
        data: data);
    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = response.data;
      AddModel addModel = AddModel.fromJson(data);
      return addModel;
    }
    return null!;
  }

  Future<HomeModel> edite(HomeModel homeModel) async {
    final dio = Dio();
    final data = {
      'mobile': homeModel.mobile!,
      'fullname': homeModel.fullname!,
    };
    Response response = await dio.put(
        "https://61f2ded52219930017f5094a.mockapi.io/api/contacts/${homeModel.id}",
        data: data);
    if (response.statusCode == 200) {
      final data = response.data;
      HomeModel homeModels = HomeModel.fromJson(data);
      return homeModels;
    }
    return null!;
  }
}
