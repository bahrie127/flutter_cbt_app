import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/models/responses/ujian_response_model.dart';

part 'daftar_soal_event.dart';
part 'daftar_soal_state.dart';
part 'daftar_soal_bloc.freezed.dart';

class DaftarSoalBloc extends Bloc<DaftarSoalEvent, DaftarSoalState> {
  DaftarSoalBloc() : super(const _Initial()) {
    on<_GetDaftarSoal>((event, emit) {
      emit(const DaftarSoalState.loading());
      emit(DaftarSoalState.success(event.data, 0, event.data.length > 1));
    });

    on<_NextSoal>((event, emit) {
      final currentState = state as _Success;
      emit(DaftarSoalState.success(
        currentState.data,
        currentState.index + 1,
        currentState.data.length > currentState.index + 2,
      ));
    });
  }
}
