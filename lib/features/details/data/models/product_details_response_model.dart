import 'package:ecommerce_app_huma_volve/features/details/domain/entities/product_details_entity.dart';
import 'package:ecommerce_app_huma_volve/features/home/data/models/category_response_model.dart';

/// id : 2
/// title : "Classic Red Pullover Hoodie Updated"
/// slug : "classic-red-pullover-hoodie-updated"
/// price : 11
/// description : "Elevate your casual wardrobe with our Classic Red Pullover Hoodie."
/// category : {"id":1,"name":"Updated Category Name"}
/// images : ["https://i.imgur.com/1twoaDy.jpeg"]

class ProductDetailsResponseModel extends ProductDetailsEntity {
  ProductDetailsResponseModel({
    super.id,
    super.title,
    super.slug,
    super.price,
    super.description,
    super.category,
    super.images,
  });

  ProductDetailsResponseModel.fromJson(dynamic json) {
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
}
