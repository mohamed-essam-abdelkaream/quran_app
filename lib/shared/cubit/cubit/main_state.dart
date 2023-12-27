abstract class MainState {}

class MainCubitInitial extends MainState {}

class GetSurahLoading extends MainState {}

class GetSurahSuccess extends MainState {}

class GetSurahError extends MainState {
  final String error;

  GetSurahError(this.error);
}

class GetRadioLoading extends MainState {}

class GetRadioSuccess extends MainState {}

class GetRadioError extends MainState {
  final String error;

  GetRadioError(this.error);
}

class GetRiwayatLoading extends MainState {}

class GetRiwayatSuccess extends MainState {}

class GetRiwayatError extends MainState {
  final String error;

  GetRiwayatError(this.error);
}

class GetTafasirLoading extends MainState {}

class GetTafasirSuccess extends MainState {}

class GetTafasirError extends MainState {
  final String error;

  GetTafasirError(this.error);
}

class GetVideosLoading extends MainState {}

class GetVideosSuccess extends MainState {}

class GetVideosError extends MainState {
  final String error;

  GetVideosError(this.error);
}

class GetQuranLoading extends MainState {}

class GetQuranSuccess extends MainState {}

class GetQuranError extends MainState {
  final String error;

  GetQuranError(this.error);
}

class GetRecitersLoading extends MainState {}

class GetRecitersSuccess extends MainState {}

class GetRecitersError extends MainState {
  final String error;

  GetRecitersError(this.error);
}
