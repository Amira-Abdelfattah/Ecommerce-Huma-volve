import 'package:bloc/bloc.dart';
import 'package:ecommerce_app_huma_volve/features/home/data/models/category_response_model.dart';
import 'package:ecommerce_app_huma_volve/features/home/data/models/products_response_model.dart';
import 'package:ecommerce_app_huma_volve/features/home/domain/entities/home_category_entity.dart';
import 'package:ecommerce_app_huma_volve/features/home/domain/entities/home_product_entity.dart';
import 'package:ecommerce_app_huma_volve/features/home/domain/use_case/get_category_use_Case.dart';
import 'package:ecommerce_app_huma_volve/features/home/domain/use_case/get_product_use_Case.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetCategoryUseCase getCategoryUseCase;
  final GetProductUseCase getProductUseCase;
  List<CategoryResponseModel> categories = [];
  List<ProductsResponseModel> products = [];
  final int offset = 0;
  final int limit = 10;
  bool isLoadingMore = false;
  bool hasMore = true;
  int? selectedCategory;
  final List <HomeProductEntity>_products = []; 

  HomeCubit(this.getCategoryUseCase, this.getProductUseCase)
    : super(HomeInitial());

  void loadHomeData() async {
    emit(CategoryLoading());
    final categoriesResult = await getCategoryUseCase.invoke();
    int id = 0;
    categoriesResult.fold(
      (failures) {
        emit(CategoryFailure(failures.errorMessage));

      },
      (categoriesResult) {
        id=categoriesResult.first.id;
        emit(CategorySuccess(categoriesResult));
        
        
      },
    );
      
       await getProductsByCategory(id);
        
  }
  
  Future<void> getProductsByCategory(int? categoryId) async {
    hasMore = true;
    _products.clear();
    emit(ProductLoading());
    final products = await getProductUseCase.invoke(
      categoryId,
      offset: offset,
      limit: limit,
    );
    products.fold(
      (failures) {
        emit(ProductFailure(failures.errorMessage));
      },
      (products) {
        _products.addAll(products);
        offset = products.length;
        if(products.length<limit){
          hasMore = false;
        }
          selectedCategory = categoryId;
          emit(ProductSuccess(List.from(_products)));
      },
    );
  }
  Future<void> loadMoreProducts() async {
    if (isLoadingMore || !hasMore) return;

    isLoadingMore = true;
    emit(ProductLoadMoreLoading);

    final newProducts = await getProductUseCase.invoke(
      selectedCategory,
      offset: offset,
      limit: limit,
    );

    newProducts.fold(
      (failures) {
        isLoadingMore = false;
        emit(ProductLoadMoreFailure(failures.errorMessage));
      },
      (products) {
           if (products.isEmpty) {
          hasMore = false;
        } else {
          _products.addAll(products);
          offset += products.length;
        }

        isLoadingMore = false;
        emit(ProductSuccess(_products.toList()));
      },
    );
  } 
}
