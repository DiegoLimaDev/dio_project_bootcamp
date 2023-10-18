import 'dart:convert';

import 'package:convert/convert.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:my_app/models/heroes_model.dart';
import 'package:my_app/repositories/marvel/heroes_repository.interface.dart';
import 'package:crypto/crypto.dart' as crypto;

class HeroesRepo implements IHeroesRepo {
  @override
  Future<List<HeroesModel>> getHeroes(int offset) async {
    var ts = DateTime.now().microsecondsSinceEpoch.toString();
    var publicKey = dotenv.get('MARVELPUBLICKEY');
    var privateKey = dotenv.get("MARVELAPIKEY");
    var hash = await _generateMd5(ts + privateKey + publicKey);

    var query = 'offset=$offset&ts=$ts&apikey=$publicKey&hash=$hash';
    var res = await Dio()
        .get('http://gateway.marvel.com/v1/public/characters?$query');

    if (res.statusCode == 200) {
      return (res.data['data']['results'] as List)
          .map((e) => HeroesModel.fromJson(e))
          .toList();
    }
    return [];
  }

  _generateMd5(String data) {
    var content = const Utf8Encoder().convert(data);
    var md5 = crypto.md5;
    var digest = md5.convert(content);
    return hex.encode(digest.bytes);
  }
}
