import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:thimar_app/core/services/server_gate.dart';
import 'package:thimar_app/models/category_model.dart';
import 'package:thimar_app/models/product_model.dart';
import 'package:thimar_app/models/sliders_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  List<SliderModel>? slidersModel;
  List<CategoryModel>? categoriseModel;
  ProductModel? productModel;

  void getSlider() async {
    emit(SlidersLoading());
    final response = await ServerGate.i.getFromServer(url: "sliders");

    if (response.success) {
      slidersModel = List.from(
        response.data['data'] ?? [],
      ).map((e) => SliderModel.fromJson(e)).toList();
      emit(SlidersSuccess());
    } else {
      emit(SlidersFailure(response.msg));
    }
  }

  void getCategories() async {
    emit(CategoryLoading());
    final response = await ServerGate.i.getFromServer(url: "categories");
    if (response.success) {
      categoriseModel = List.from(
        response.data['data'] ?? [],
      ).map((e) => CategoryModel.fromJson(e)).toList();
      emit(CategorySuccess());
    } else {
      emit(CategoryFailure(response.msg));
    }
  }

  void getProducts() async {
    emit(ProductLoading());
    final response = await ServerGate.i.getFromServer(url: "products");
    if (response.success) {
      productModel = ProductModel.fromJson(response.data);
      emit(ProductSuccess());
    } else {
      emit(ProductFailure(error: response.msg));
    }
  }
}
