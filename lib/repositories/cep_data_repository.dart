import 'dart:convert';

import 'package:my_app/models/cep_data_model.dart';
import 'package:http/http.dart' as http;

class CepDataRepo {
  Future<CepDataModel> getCep(String cep) async {
    final res = await http
        .get(Uri.parse('https://brasilaberto.com/api/v1/zipcode/$cep'));
    if (res.statusCode == 200) {
      var json = jsonDecode(res.body)['result'];
      var cepDataModel = CepDataModel.fromJson(json);
      return cepDataModel;
    }
    return CepDataModel();
  }
}
