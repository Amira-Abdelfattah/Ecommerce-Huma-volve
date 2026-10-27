import 'package:ecommerce_app_huma_volve/core/constants/api_endpoints.dart';
import 'package:ecommerce_app_huma_volve/core/network/api_manager.dart';
import 'package:ecommerce_app_huma_volve/features/details/data/data_source/details_remote_data_source.dart';
import 'package:ecommerce_app_huma_volve/features/details/data/models/product_details_response_model.dart';

class DetailsRemoteDataSourceImpl implements DetailsRemoteDataSource {
  final ApiManager apiManager;

  DetailsRemoteDataSourceImpl(this.apiManager);

  @override
  Future<ProductDetailsResponseModel> getProductDetails(int productId) async {
    final response = await apiManager.dio.get(
      "${ApiEndPoints.productsEndpoint}/$productId",
    );

    // from json
    final jsonData = response.data;

    // to dart
    final ProductDetailsResponseModel productDetails =
        ProductDetailsResponseModel.fromJson(jsonData);
    return productDetails;
  }
}
