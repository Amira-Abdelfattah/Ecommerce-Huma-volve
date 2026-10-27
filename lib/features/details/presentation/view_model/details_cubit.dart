import 'package:bloc/bloc.dart';
import 'package:ecommerce_app_huma_volve/features/details/domain/entities/product_details_entity.dart';
import 'package:ecommerce_app_huma_volve/features/details/domain/use_case/get_product_details_use_case.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  final GetProductDetailsUseCase getProductDetailsUseCase;

  DetailsCubit(this.getProductDetailsUseCase) : super(DetailsInitial());

  Future<void> getProductDetails(int productId) async {
    emit(DetailsLoading());
    final result = await getProductDetailsUseCase.invoke(productId);
    result.fold(
      (failures) {
        emit(DetailsFailure(failures.errorMessage));
      },
      (product) {
        emit(DetailsSuccess(product));
      },
    );
  }
}
