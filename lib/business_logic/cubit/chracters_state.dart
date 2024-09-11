part of 'chracters_cubit.dart';

abstract class ChractersState {}

final class ChractersInitial extends ChractersState {}

// final class LoadingData extends ChractersState {
//   final StatuseRequest statuseRequest;
//   LoadingData({required this.statuseRequest});
// }

final class StateRequest extends ChractersState {
  final StatuseRequest statuseRequest;
  StateRequest({required this.statuseRequest});
}

final class SuccessData extends ChractersState {
  final List<ChractersModel> data;
  SuccessData({required this.data});
}

final class ChangeAppbar extends ChractersState {
  final bool issearch;
  ChangeAppbar({required this.issearch});
}

final class Search extends ChractersState {
  final List<ChractersModel> data;
  Search({required this.data});
}


// final class SuccessServer extends ChractersState {
//   final StatuseRequest statuseRequest;
//   SuccessServer({required this.statuseRequest});
// }


//final class LoadingData extends ChractersState {}

