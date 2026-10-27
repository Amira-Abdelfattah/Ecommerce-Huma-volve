import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_huma_volve/core/failure/failures.dart';
import 'package:ecommerce_app_huma_volve/features/details/domain/entities/product_details_entity.dart';

abstract class DetailsRepository {
  Future<Either<Failures, ProductDetailsEntity>> getProductDetails(
    int productId,
  );
}
