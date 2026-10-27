import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_huma_volve/core/failure/failures.dart';
import 'package:ecommerce_app_huma_volve/features/details/domain/entities/product_details_entity.dart';
import 'package:ecommerce_app_huma_volve/features/details/domain/repository/details_repository.dart';

class GetProductDetailsUseCase {
  final DetailsRepository detailsRepository;

  GetProductDetailsUseCase(this.detailsRepository);

  Future<Either<Failures, ProductDetailsEntity>> invoke(int productId) {
    return detailsRepository.getProductDetails(productId);
  }
}
