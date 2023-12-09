part of 'ujian_by_kategori_bloc.dart';

@freezed
class UjianByKategoriState with _$UjianByKategoriState {
  const factory UjianByKategoriState.initial() = _Initial;
  const factory UjianByKategoriState.loading() = _Loading;
  const factory UjianByKategoriState.success(UjianResponseModel response) =
      _Success;
  const factory UjianByKategoriState.error(String message) = _Error;
  //notfound
  const factory UjianByKategoriState.notfound() = _Notfound;
}
