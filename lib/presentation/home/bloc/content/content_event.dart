part of 'content_bloc.dart';

@freezed
class ContentEvent with _$ContentEvent {
  const factory ContentEvent.started() = _Started;
  const factory ContentEvent.getContentById(String id) = _GetContentById;
}