import 'package:blooc/const/applink/applink.dart';
import 'package:blooc/data/webservices/characters_api.dart';

class ChracterReposeitory {
  ChractersApi chractersApi = ChractersApi();

  getDate(String search) async {
    var response = await chractersApi.Getdata(Applink.getdata, search);
    return response.fold((l) => l, (r) => r);
  }
}
