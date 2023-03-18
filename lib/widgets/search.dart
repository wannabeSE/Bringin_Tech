import 'package:flutter/material.dart';
import 'package:bringin_texh/class/products.dart';


class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List productList = Product.productList; 
  List temp = []; 
  void updateList (String value){
    final suggestion = productList.where((element) {
      final name = element.name.toLowerCase();
      final input = value.toLowerCase();
      return name.contains(input);
    }).toList();

    setState(() {
      temp = suggestion;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                onChanged: updateList,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(77, 199, 192, 192),
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                  prefixIcon: Icon(
                    Icons.search_outlined,
                    color: Colors.blueAccent,
                    )
                  ),
                ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: temp.length,
                itemBuilder: ((context, index) {
                final pd = temp[index];
                return ListTile(
                  title: Text(pd.name),
                  leading: Image.network(pd.picUrl,fit: BoxFit.cover,height: 50,width: 50,),
                  );
                 
                }
                )
              )
            )
          ],
        ),
      ),
    );
  }
}