import 'package:store_app/helper/api.dart';
class AllCategoriesServices {
  Future<List> gatAllCategories() async {
    List<dynamic> data  =
        await Api().get(url: 'https://fakestoreapi.com/products/categories');
    return data;
  }
}
