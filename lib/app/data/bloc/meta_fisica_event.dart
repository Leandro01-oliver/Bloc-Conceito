
import 'package:orcamento_ppa/app/data/models/meta_fisica.dart';

abstract class MetaFisicaEvent {}

class GetMetaFisica extends MetaFisicaEvent {}

class PostMetaFisica extends MetaFisicaEvent {
  final MetaFisicaModel metaFisicaModel;
  PostMetaFisica({required this.metaFisicaModel});
}

class DeleteMetaFisica extends MetaFisicaEvent {
  final MetaFisicaModel metaFisicaModel;
  DeleteMetaFisica({required this.metaFisicaModel});
}
