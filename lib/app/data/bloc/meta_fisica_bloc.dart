import 'dart:async';

import 'package:orcamento_ppa/app/data/bloc/meta_fisica_event.dart';
import 'package:orcamento_ppa/app/data/bloc/meta_fisica_state.dart'; // Certifique-se de importar o arquivo correto
import 'package:orcamento_ppa/app/data/repositories/meta_fisica_repositorie.dart';

class MetaFisicaBloc {
  final MetaFisicaRepositorie _repositorie;
  final StreamController<MetaFisicaEvent> _entradaMetaFisicaController = StreamController<MetaFisicaEvent>();
  final StreamController<MetaFisicaState> _saidaMetaFisicaController = StreamController<MetaFisicaState>();

  Sink<MetaFisicaEvent> get entradaMetaFisica => _entradaMetaFisicaController.sink;
  Stream<MetaFisicaState> get saidaMetaFisica => _saidaMetaFisicaController.stream;

  MetaFisicaBloc(this._repositorie) {
    _entradaMetaFisicaController.stream.listen(_mapMetaFisicaBlocStream);
  }

  void _mapMetaFisicaBlocStream(MetaFisicaEvent event) async {
    _saidaMetaFisicaController.add(MetaFisicaLoadingState());

    if (event is GetMetaFisica) {
      final metaFisicas = await _repositorie.getMetaFisica();
      _saidaMetaFisicaController.add(MetaFisicaLoadedState(metaFisicas: metaFisicas));
    } else if (event is PostMetaFisica) {
      final metaFisica = await _repositorie.createMetaFisica(metaFisica: event.metaFisicaModel);
      _saidaMetaFisicaController.add(MetaFisicaCreatedState(metaFisica: metaFisica, metaFisicas: [])); 
    } else if (event is DeleteMetaFisica) {
      final metaFisica = await _repositorie.deleteMetaFisica(metaFisica: event.metaFisicaModel);
      _saidaMetaFisicaController.add(MetaFisicaDeletedState(metaFisica: metaFisica, metaFisicas: [])); 
    }
  }

  void dispose() {
    _entradaMetaFisicaController.close();
    _saidaMetaFisicaController.close();
  }
}
