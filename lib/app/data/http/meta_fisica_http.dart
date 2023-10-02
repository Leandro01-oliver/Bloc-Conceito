import 'package:dio/dio.dart';
import 'package:orcamento_ppa/app/data/models/meta_fisica.dart';

class MetaFisicaHttp {
  String? url;
  static final Dio _dio = Dio();

  MetaFisicaHttp({required this.url});

  Future<List<MetaFisicaModel>> getMetaFisicaHttp() async {
    var response = await _dio.get("http://192.168.0.151/$url");
    if (response.statusCode == 200) {
      List<dynamic> responseBody = response.data;
      List<MetaFisicaModel> listaDeMetas = responseBody
          .map((dynamic item) => MetaFisicaModel.fromMap(item))
          .toList();
      return listaDeMetas;
    } else {
      throw Exception('Falha ao carregar metas físicas');
    }
  }

  Future<MetaFisicaModel> createMetaFisicaHttp({ required MetaFisicaModel metaFisicaModel}) async{
     var response = await _dio.post("http://192.168.0.151/$url",data: {
      'titulo': metaFisicaModel.titulo,
      'ano1': metaFisicaModel.ano1,
      'ano2':metaFisicaModel.ano2,
      'ano3': metaFisicaModel.ano3,
      'ano4': metaFisicaModel.ano4,
      'tipoCategoria': metaFisicaModel.tipoCategoria,
     });

     if(response.statusCode == 201){
        return MetaFisicaModel.fromMap(response.data);
     }else{
       throw Exception(
            'Failed to create user. Status code: ${response.statusCode}');
     }
  }

  Future<MetaFisicaModel> deleteMetaFisicaHttp({ required MetaFisicaModel metaFisicaModel}) async{
     var response = await _dio.post("http://192.168.0.151/$url",data: {
      'id': metaFisicaModel.id
     });

     if(response.statusCode == 200){
        return MetaFisicaModel.fromMap(response.data);
     }else{
       throw Exception(
            'Failed to create user. Status code: ${response.statusCode}');
     }
  }
}
