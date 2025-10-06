import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:thimar_app/core/services/server_gate.dart';

part 'rate_model.dart';
part 'rate_state.dart';

class RateCubit extends Cubit<RateState> {
  RateCubit() : super(RateInitial());

  void getData({required String id}) async {
    try {
      emit(RateLoading());
      final response = await ServerGate.i.getFromServer(
        url: "products/$id/rates",
      );
      if (response.success) {
        final model = RateModel.fromJson(response.data as Map<String, dynamic>);
        emit(RateSuccess(model.data));
      } else {
        final fallback = response.msg.isNotEmpty
            ? response.msg
            : (response.data != null
                  ? jsonEncode(response.data)
                  : 'خطأ في الاتصال بالسيرفر');
        emit(RateFailure(fallback));
      }
    } catch (e, st) {
      emit(RateFailure(kDebugMode ? '$e\n$st' : 'حدث خطأ غير متوقع'));
    }
  }
}
