// ignore_for_file: missing_required_param, avoid_print

import 'package:store_app/helper/api.dart';
import 'package:store_app/models/products_model.dart';

class UpdateService{
  Future<ProductsModel> update({
    required int id,
    required String title,
    required String price,
    required String description,
    required String image,
    required String category
  }) async{
    print(id);
    Map<String , dynamic> data = await Api().put(
        url: 'https://fakestoreapi.com/products/$id',
        body:{
          'title': title,
          'price': price,
          'description': description,
          'image': image,
          'category' : category
        }
    );
    return ProductsModel.fromJson(data);
  }
}