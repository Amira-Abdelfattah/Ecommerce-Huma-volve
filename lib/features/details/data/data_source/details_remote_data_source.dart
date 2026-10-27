import 'package:ecommerce_app_huma_volve/features/details/data/models/product_details_response_model.dart';

abstract class DetailsRemoteDataSource {
  Future<ProductDetailsResponseModel> getProductDetails(int productId);
}
