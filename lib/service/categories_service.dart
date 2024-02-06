import 'package:dio/dio.dart';
import '../models/categories_model.dart';
import '../modules/network_settings.dart';

class CategoriesService {
  static final dio = Dio();

  static Future<List> getProductsData() async {
    final response = await dio.get("${NetworkSettings.baseUrl}carts/1");
    var data = response.data;
    CategoriesModel categoriesModel = CategoriesModel.fromJson(data);

    return categoriesModel.products ?? [];
  }
}
