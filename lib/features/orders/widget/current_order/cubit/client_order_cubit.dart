import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:thimar_app/core/services/server_gate.dart';

part 'client_order_state.dart';
part 'client_order_model.dart';

class ClientOrderCubit extends Cubit<ClientOrderState> {
  ClientOrderCubit() : super(ClientOrderInitial());

  void getCurrentOrder(String status) async {
    emit(ClientOrderLoading());

    final response = await ServerGate.i.getFromServer(
      url: "client/orders",
      params: {"status": status},
    );
    if (response.success) {
      try {
        final model = ClientOrderModel.fromJson(response.data);
        emit(ClientOrderSuccess(model.data));
      } catch (e) {
        emit(ClientOrderFailure("خطأ في البيانات"));
      }
    } else {
      emit(ClientOrderFailure(response.msg));
    }
  }
  // void getFinishedOrder() async {
  //   emit(CurrentOrderLoading());

  //   final response = await ServerGate.i.getFromServer(
  //     url: "client/orders?status=finished",
  //   );
  //   if (response.success) {
  //     try {
  //       final model = ClientOrderModel.fromJson(response.data);
  //       emit(CurrentOrderSuccess(model.data));
  //     } catch (e) {
  //       emit(CurrentOrderFailure("خطأ في البيانات"));
  //     }
  //   } else {
  //     emit(CurrentOrderFailure(response.msg));
  //   }
  // }
}
