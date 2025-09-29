import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:thimar_app/core/services/server_gate.dart';

part 'category_state.dart';
part 'category_model.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());

  void getData() async {
    emit(CategoryLoading());
    final response = await ServerGate.i.getFromServer(url: "categories");
    if (response.success) {
      final model = CategoryModel.fromJson(response.data);
      emit(CategorySuccess(model.data));
    } else {
      emit(CategoryFailure(response.msg) );
    }
  }
}
