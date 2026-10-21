import 'category_response_model.dart';

/// id : 2
/// title : "Classic Red Pullover Hoodie Updated"
/// slug : "classic-red-pullover-hoodie-updated"
/// price : 11
/// description : "Elevate your casual wardrobe with our Classic Red Pullover Hoodie. Crafted with a soft cotton blend for ultimate comfort, this vibrant red hoodie features a kangaroo pocket, adjustable drawstring hood, and ribbed cuffs for a snug fit. The timeless design ensures easy pairing with jeans or joggers for a relaxed yet stylish look, making it a versatile addition to your everyday attire."
/// category : {"id":1,"name":"Updated Category Name",}
/// images : ["https://i.imgur.com/1twoaDy.jpeg"]
/// creationAt : "2026-10-21T17:25:06.000Z"
/// updatedAt : "2026-10-22T05:10:45.000Z"

class ProductsResponseModel {
  ProductsResponseModel({
    this.id,
    this.title,
    this.slug,
    this.price,
    this.description,
    this.category,
    this.images,
  });

  ProductsResponseModel.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    price = json['price'];
    description = json['description'];
    category = json['category'] != null
        ? CategoryResponseModel.fromJson(json['category'])
        : null;
    images = json['images'] != null ? json['images'].cast<String>() : [];
  }

  num? id;
  String? title;
  String? slug;
  num? price;
  String? description;
  CategoryResponseModel? category;
  List<String>? images;
}
