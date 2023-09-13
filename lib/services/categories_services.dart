import 'package:store_app/helper/api.dart';
import 'package:store_app/models/products_model.dart';

class CategoriesServices {
  Future<List<ProductsModel>> getCategories(
      {required String categoryName}) async {
    List<dynamic> data = await Api()
        .get(url: 'https://fakestoreapi.com/products/category/$categoryName');
    List<ProductsModel> productsList = [];
    for (int i = 0; i < productsList.length; i++) {
      productsList.add(ProductsModel.fromJson(data[i]));
    }
    return productsList;
  }
}
