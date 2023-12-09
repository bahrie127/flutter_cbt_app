part of 'ujian_by_kategori_bloc.dart';

@freezed
class UjianByKategoriEvent with _$UjianByKategoriEvent {
  const factory UjianByKategoriEvent.started() = _Started;
  const factory UjianByKategoriEvent.getUjianByKategori(String kategori) =
      _GetUjianByKategori;
}