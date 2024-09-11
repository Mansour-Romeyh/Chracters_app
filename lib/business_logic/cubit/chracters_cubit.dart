import 'package:blooc/const/class/statuse_request.dart';
import 'package:blooc/data/reposeitory/chracter_reposeitory.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/chracter_model.dart';
part 'chracters_state.dart';

class ChractersCubit extends Cubit<ChractersState> {
  ChractersCubit() : super(ChractersInitial()) {
    getAllDat();
  }
  static ChractersCubit get(BuildContext context) => BlocProvider.of(context);
  ChracterReposeitory chracterReposeitory = ChracterReposeitory();

  List<ChractersModel> data = [];
  List<ChractersModel> searchdata = [];
  bool issearch = false;
  var response;
  getAllDat() async {
    final Connectivity _connectivity = Connectivity();
    //
    _connectivity.onConnectivityChanged
        .listen((List<ConnectivityResult> result) async {
      //@@@@@@@@@@@@@@@
      if (result.first != ConnectivityResult.none) {
        print(result);
        emit(StateRequest(statuseRequest: StatuseRequest.statuseloding));
        response = await chracterReposeitory.getDate('');
        //done connictions
        //################
        if (response is! StatuseRequest) {
          // if respons was data
          List _data = response;

          _data.sort((a, b) => a['name'].compareTo(b['name']));
          data.addAll(_data.map((e) => ChractersModel.fromJson(e)));
          data.removeWhere(
            (element) => element.image == null,
          );
          //await Future.delayed(const Duration(seconds: 3));
          emit(SuccessData(data: data));
        }
        //############
        else {
          // if respons was not  data
          emit(StateRequest(statuseRequest: response));
        }
      }
      //@@@@@@@@@@@@
      else {
        // if not hasconnictions
        emit(StateRequest(statuseRequest: StatuseRequest.statuseloding));
        await Future.delayed(Duration(seconds: 1));
        emit(StateRequest(statuseRequest: StatuseRequest.statuseerroNetwork));
      }
    });
  }

  changeappbar() {
    issearch = !issearch;

    issearch == true
        ? emit(ChangeAppbar(issearch: issearch))
        : emit(SuccessData(data: data));
  }

  search(searchchracters) {
    searchdata.clear();
    searchdata.removeWhere(
        (element) => element.name == searchchracters.toString().toLowerCase());
    searchdata = data
        .where((element) => element.name!
            .toLowerCase()
            .contains(searchchracters.toString().toLowerCase()))
        .toList();
    print(searchdata.isEmpty);
    issearch == true
        ? emit(Search(data: searchdata))
        : emit(SuccessData(data: data));
  }
}
