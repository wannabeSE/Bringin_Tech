import 'dart:convert';


import 'package:bringin_texh/class/products.dart';
import 'package:bringin_texh/widgets/search.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'package:http/http.dart' as http ;


class CustomerProductsView extends StatefulWidget {
  const CustomerProductsView({super.key});

  @override
  State<CustomerProductsView> createState() => CustomerProductsViewState();
}

class CustomerProductsViewState extends State<CustomerProductsView> {
  Product product = Product();
  List products = [];
  late final Future myFuture = productsGetter();
  // List products = Product.productList;
  
  Future productsGetter() async{
      try {
        String url = 'http://10.0.2.2:8080/api/product/getproduct';
        
        http.Response res = await http.get(Uri.parse(url));
        Map data = jsonDecode(res.body);
        products = product.productSetter(data);

        
        return products;

    } catch (e) {
      debugPrint(e.toString());
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              
              children: [
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: IconButton(
                    onPressed: (){
                      Get.to(const SearchPage());
                    }, 
                    icon: const Icon(Icons.search)
                  ),
                ),
              ],
            ),
            
            Expanded(
              child: FutureBuilder(
                future: myFuture,
                builder:(context, snapshot){
                  
                  if(snapshot.hasData){
                    return ListView.builder(
                      itemCount: products.length,
                      itemBuilder: ((context, index) => 
                        ListTile(
                          title: Text(snapshot.data[index].name),
                          leading: Image.network(snapshot.data[index].picUrl),
                        )

                        )
                      );
                  }else{
                    return const Center(child: CircularProgressIndicator());
                  }
                } 
                ),
              ),
          ],
          )
        ),
    );
  }
  

}