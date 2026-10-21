/// id : 1
/// name : "Updated Category Name"

class CategoryResponseModel {
  CategoryResponseModel({this.id, this.name});

  CategoryResponseModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }

  int? id;
  String? name;
}
