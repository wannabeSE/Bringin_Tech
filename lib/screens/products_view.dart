import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http ;


class CustomerProductsView extends StatefulWidget {
  const CustomerProductsView({super.key});

  @override
  State<CustomerProductsView> createState() => CustomerProductsViewState();
}

class CustomerProductsViewState extends State<CustomerProductsView> {
  List products = [];
  
  
  Future productsGetter() async{
      try {
        String url = 'http://10.0.2.2:8080/api/product/getproduct';
        
        http.Response res = await http.get(Uri.parse(url));
        var data = jsonDecode(res.body);
        products = data['products'];
      
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
            Expanded(
              child: FutureBuilder(
                future: productsGetter(),
                builder:(context, snapshot){
                  
                  if(snapshot.hasData){
                    debugPrint('entered');

                    return ListView.builder(
                      itemCount: products.length,
                      itemBuilder: ((context, index) => Text(snapshot.data[index]['name'])
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