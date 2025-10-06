import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:thimar_app/core/services/server_gate.dart';

part 'details_state.dart';
part 'product_model.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit() : super(DetailsInitial());

  void getData({required String id}) async {
    try {
      emit(DetailsLoading());
      final response = await ServerGate.i.getFromServer(url: "products/$id");
      if (response.success) {
        final model = ProductModel.fromJson(
          response.data as Map<String, dynamic>,
        );
        emit(DetailsSuccess([model.data]));
      } else {
        final fallback = response.msg.isNotEmpty
            ? response.msg
            : (response.data != null
                  ? jsonEncode(response.data)
                  : 'خطأ في الاتصال بالسيرفر');
        emit(DetailsFailure(fallback));
      }
    } catch (e, st) {
      emit(DetailsFailure(kDebugMode ? '$e\n$st' : 'حدث خطأ غير متوقع'));
    }
  }
}
