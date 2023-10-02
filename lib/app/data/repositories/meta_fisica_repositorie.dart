import 'package:orcamento_ppa/app/data/http/meta_fisica_http.dart';
import 'package:orcamento_ppa/app/data/models/meta_fisica.dart';

class MetaFisicaRepositorie extends MetaFisicaHttp{

  MetaFisicaRepositorie({required super.url});

  Future<MetaFisicaModel> createMetaFisica({required MetaFisicaModel metaFisica}) async {
    url = "/api/meta-fisica/post";
    var metaFisicaCreate = await createMetaFisicaHttp(metaFisicaModel: metaFisica);
    return metaFisicaCreate;
  }

  Future<List<MetaFisicaModel>> getMetaFisica() async {
    url = "/api/meta-fisica/get";
    var metaFisicas = await getMetaFisicaHttp();
    return metaFisicas;
  }

  Future<MetaFisicaModel> deleteMetaFisica({required MetaFisicaModel metaFisica}) async {
    url = "/api/meta-fisica/delete";
    var metaFisicasDelete = await deleteMetaFisicaHttp(metaFisicaModel: metaFisica);
    return metaFisicasDelete;
  }
}
