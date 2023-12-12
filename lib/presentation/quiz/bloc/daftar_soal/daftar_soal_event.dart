part of 'daftar_soal_bloc.dart';

@freezed
class DaftarSoalEvent with _$DaftarSoalEvent {
  const factory DaftarSoalEvent.started() = _Started;
  const factory DaftarSoalEvent.getDaftarSoal(List<Soal> data) = _GetDaftarSoal;
  //nextSoal
  const factory DaftarSoalEvent.nextSoal() = _NextSoal;
}