import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/datasources/materi_remote_datasource.dart';
import '../../../../data/models/responses/materi_response_model.dart';

part 'materi_bloc.freezed.dart';
part 'materi_event.dart';
part 'materi_state.dart';

class MateriBloc extends Bloc<MateriEvent, MateriState> {
  final MateriRemoteDatasource materiRemoteDatasource;
  MateriBloc(
    this.materiRemoteDatasource,
  ) : super(const _Initial()) {
    on<MateriEvent>((event, emit) async{
      emit(const MateriState.loading());
      final response = await materiRemoteDatasource.getAllMateri(); 
      response.fold(
        (l) => emit(MateriState.error(l)),
        (r) => emit(MateriState.success(r)),
      );
    });
  }
}
