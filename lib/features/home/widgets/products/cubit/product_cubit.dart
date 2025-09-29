import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:thimar_app/core/services/server_gate.dart';

part 'product_state.dart';
part 'product_model.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

void getData() async {
    emit(ProductLoading());
    final response = await ServerGate.i.getFromServer(url: "products");
    if (response.success) {
      final model = ProductModel.fromJson(response.data);
      emit(ProductSuccess(model.data));
    } else {
      emit(ProductFailure(response.msg) );
    }
  }

}
