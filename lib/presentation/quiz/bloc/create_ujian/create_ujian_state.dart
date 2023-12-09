part of 'create_ujian_bloc.dart';

@freezed
class CreateUjianState with _$CreateUjianState {
  const factory CreateUjianState.initial() = _Initial;
  const factory CreateUjianState.loading() = _Loading;
  const factory CreateUjianState.success() = _Success;
  const factory CreateUjianState.error(String message) = _Error;
}
