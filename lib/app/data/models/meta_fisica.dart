import 'package:orcamento_ppa/app/data/enum/tipo_categoria.dart';

class MetaFisicaModel {
  final int? id;
  final String? titulo;
  final int? ano1;
  final int? ano2;
  final int? ano3;
  final int? ano4;
  final TipoCategoria? tipoCategoria;

  MetaFisicaModel({
    this.id,
    this.titulo,
    this.ano1,
    this.ano2,
    this.ano3,
    this.ano4,
    this.tipoCategoria
  });

   Map<String, dynamic> toMap() {
    return {
      'id': id,
      'titulo': titulo,
      'ano1': ano1,
      'ano2': ano2,
      'ano3': ano3,
      'ano4': ano4,
      'tipoCategoria': tipoCategoria?.index, 
    };
  }

  factory MetaFisicaModel.fromMap(Map<String, dynamic> map) {
    return MetaFisicaModel(
      id: map['id'],
      titulo: map['titulo'],
      ano1: map['ano1'],
      ano2: map['ano2'],
      ano3: map['ano3'],
      ano4: map['ano4'],
      tipoCategoria: TipoCategoria.values[map['tipoCategoria']],
    );
  }
}
