// ignore_for_file: must_be_immutable, avoid_print

import 'package:flutter/material.dart';
import 'package:store_app/models/products_model.dart';
import 'package:store_app/services/update_service.dart';
import 'package:store_app/widget/custom_button.dart';
import 'package:store_app/widget/custom_textfield.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UpdateProduct extends StatefulWidget {
   const UpdateProduct({super.key});
  static String id = 'UpdateProduct';

  @override
  State<UpdateProduct> createState() => _UpdateProductState();
}

class _UpdateProductState extends State<UpdateProduct> {
  String? productName, desc, image;

  String? price;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    ProductsModel productsModel = ModalRoute.of(context)!.settings.arguments as ProductsModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          centerTitle: true,
          title: const Text('Update Product',style: TextStyle(color: Colors.black),),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 100,
                ),
                CustomTextField(
                  onchanged: (data){
                    productName= data;
                  },
                    hintText: 'Product Name'
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    onchanged: (data){
                      desc= data;
                    },
                    hintText: 'Description'
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    onchanged: (data){
                      price= data;
                    },
                    hintText: 'Price',
                  inputType: TextInputType.number,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    onchanged: (data){
                      image = data;
                    },
                    hintText: 'Image'),
                const SizedBox(
                  height: 70,
                ),
                CustomButton(text: 'Update',
                onTap: () async {
                  isLoading = true;
                  setState(() {

                  });

                  try {
                     await updateProduct(productsModel);
                     print('success');
                  } catch (e) {
                    print(e.toString());
                  }
                  isLoading=false;
                  setState(() {

                  });
                },
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  Future <void> updateProduct(ProductsModel productsModel) async{
   await UpdateService().update(
        id: productsModel.id,
        title: productName==null ? productsModel.title : productName!,
        price: price==null ? productsModel.price.toString() : price!,
        description: desc==null ? productsModel.description : desc!,
        image: image==null ? productsModel.image : image!,
      category: productsModel.category,
    );
  }
}
