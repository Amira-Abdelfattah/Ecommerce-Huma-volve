import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_huma_volve/core/errors/error_handeler.dart';
import 'package:ecommerce_app_huma_volve/core/failure/failures.dart';
import 'package:ecommerce_app_huma_volve/features/details/data/data_source/details_remote_data_source.dart';
import 'package:ecommerce_app_huma_volve/features/details/domain/entities/product_details_entity.dart';
import 'package:ecommerce_app_huma_volve/features/details/domain/repository/details_repository.dart';

class DetailsRepositoryImpl implements DetailsRepository {
  late final DetailsRemoteDataSource detailsRemoteDataSource;

  DetailsRepositoryImpl({required this.detailsRemoteDataSource});

  @override
  Future<Either<Failures, ProductDetailsEntity>> getProductDetails(
    int productId,
  ) async {
    try {
      final productDetails = await detailsRemoteDataSource.getProductDetails(
        productId,
      );
      return Right(productDetails as ProductDetailsEntity);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }
}
