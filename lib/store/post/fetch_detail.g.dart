// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_detail.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FetchDetail on _FetchDetailStore, Store {
  final _$_agentDetailAtom = Atom(name: '_FetchDetailStore._agentDetail');

  @override
  ObservableFuture<AgentDetail>? get _agentDetail {
    _$_agentDetailAtom.reportRead();
    return super._agentDetail;
  }

  @override
  set _agentDetail(ObservableFuture<AgentDetail>? value) {
    _$_agentDetailAtom.reportWrite(value, super._agentDetail, () {
      super._agentDetail = value;
    });
  }

  final _$_FetchDetailStoreActionController =
      ActionController(name: '_FetchDetailStore');

  @override
  ObservableFuture<AgentDetail> fetchAgentDetail() {
    final _$actionInfo = _$_FetchDetailStoreActionController.startAction(
        name: '_FetchDetailStore.fetchAgentDetail');
    try {
      return super.fetchAgentDetail();
    } finally {
      _$_FetchDetailStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
