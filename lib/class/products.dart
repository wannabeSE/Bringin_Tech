class Product{
  String? name;
  String? picUrl;
  int? price;
  static List productList = [];
  Product({
    this.name,this.picUrl,
  });
  productSetter(Map json){
    json['products'].forEach((p)=>productList.add(Product(name:p['name'],picUrl:p['pics'])));
    return productList;
  }

}


