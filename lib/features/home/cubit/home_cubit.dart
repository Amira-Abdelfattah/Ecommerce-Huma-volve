import 'package:bloc/bloc.dart';
import 'package:ecommerce_app_huma_volve/features/home/services/home_service.dart';
import 'package:ecommerce_app_huma_volve/features/home/services/models/category_response_model.dart';
import 'package:ecommerce_app_huma_volve/features/home/services/models/products_response_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeService homeService;
  List<CategoryResponseModel> categories = [];
  List<ProductsResponseModel> products = [];

  HomeCubit(this.homeService) : super(HomeInitial());

  void loadHomeData() async {
    emit(CategoryLoading());
    try {
      categories = await homeService.getCategoryList();
      emit(CategorySuccess(categories));

      if (categories.isNotEmpty) {
        getProductsByCategory(categories[0].id);
      }
    } catch (e) {
      emit(CategoryFailure(e.toString()));
    }
  }

  void getProductsByCategory(int? categoryId) async {
    emit(ProductLoading());
    try {
      products = await homeService.getProductByCategoryId(categoryId);
      emit(ProductSuccess(products));
    } catch (e) {
      emit(ProductFailure(e.toString()));
    }
  }
}
