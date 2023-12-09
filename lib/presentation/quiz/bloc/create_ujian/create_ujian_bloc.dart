import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_cbt_app/data/datasources/ujian_remote_datasource.dart';

part 'create_ujian_bloc.freezed.dart';
part 'create_ujian_event.dart';
part 'create_ujian_state.dart';

class CreateUjianBloc extends Bloc<CreateUjianEvent, CreateUjianState> {
  final UjianRemoteDatasource ujianRemoteDatasource;
  CreateUjianBloc(
    this.ujianRemoteDatasource,
  ) : super(const _Initial()) {
    on<CreateUjianEvent>((event, emit) async {
      emit(const _Loading());
      final response = await ujianRemoteDatasource.createUjian();
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(const _Success()),
      );
    });
  }
}
