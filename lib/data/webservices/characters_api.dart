import 'dart:convert';

import 'package:blooc/const/class/statuse_request.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class ChractersApi {
  Future<Either<StatuseRequest, List>> Getdata(
      String link, String search) async {
    try {
      var response = await http.get(
        Uri.parse('$link$search'),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        List responsebody = jsonDecode(response.body);

        return right(responsebody);
      } else {
        return left(StatuseRequest.statusenotfound);
      }
    } catch (e) {
      print('EEEEEEEEEEEEEEERRRRRRRRRRRRRRRRROOOOOOOOOOOORRRRRR$e');
      return left(StatuseRequest.statusefailure);
    }
  }
}
