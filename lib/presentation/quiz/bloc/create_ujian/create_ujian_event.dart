part of 'create_ujian_bloc.dart';

@freezed
class CreateUjianEvent with _$CreateUjianEvent {
  const factory CreateUjianEvent.started() = _Started;
  const factory CreateUjianEvent.createUjian() = _CreateUjian;
}
