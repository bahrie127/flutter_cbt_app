part of 'materi_bloc.dart';

@freezed
class MateriEvent with _$MateriEvent {
  const factory MateriEvent.started() = _Started;
  const factory MateriEvent.getAllMateri() = _GetAllMateri;
}