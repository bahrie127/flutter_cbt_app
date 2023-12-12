part of 'answer_bloc.dart';

@freezed
class AnswerEvent with _$AnswerEvent {
  const factory AnswerEvent.started() = _Started;
  //setAnswer
  const factory AnswerEvent.setAnswer(
    int soalId,
    String jawaban,
  ) = _SetAnswer;
}