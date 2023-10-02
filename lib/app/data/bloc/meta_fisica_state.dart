import 'package:orcamento_ppa/app/data/models/meta_fisica.dart';

abstract class MetaFisicaState {
  final List<MetaFisicaModel> metaFisicas;
  MetaFisicaState({required this.metaFisicas});
}

class MetaFisicaInitializeState extends MetaFisicaState {
  MetaFisicaInitializeState() : super(metaFisicas: []);
}

class MetaFisicaLoadingState extends MetaFisicaState {
  MetaFisicaLoadingState() : super(metaFisicas: []);
}

class MetaFisicaLoadedState extends MetaFisicaState {
  MetaFisicaLoadedState({required List<MetaFisicaModel> metaFisicas})
      : super(metaFisicas: metaFisicas);
}

class MetaFisicaCreatedState extends MetaFisicaState { 
  final MetaFisicaModel metaFisica;
  MetaFisicaCreatedState({required this.metaFisica, required List<MetaFisicaModel> metaFisicas})
      : super(metaFisicas: metaFisicas);
}

class MetaFisicaDeletedState extends MetaFisicaState { 
  final MetaFisicaModel metaFisica;
  MetaFisicaDeletedState({required this.metaFisica, required List<MetaFisicaModel> metaFisicas})
      : super(metaFisicas: metaFisicas);
}

class MetaFisicaErrorState extends MetaFisicaState {
  final Exception exception;
  MetaFisicaErrorState({required this.exception, required List<MetaFisicaModel> metaFisicas})
      : super(metaFisicas: metaFisicas);
}
