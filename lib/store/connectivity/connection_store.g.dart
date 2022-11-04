// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connection_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ConnectionStore on _ConnectionStore, Store {
  final _$connectionStreamAtom =
      Atom(name: '_ConnectionStore.connectionStream');

  @override
  ObservableStream<dynamic> get connectionStream {
    _$connectionStreamAtom.reportRead();
    return super.connectionStream;
  }

  @override
  set connectionStream(ObservableStream<dynamic> value) {
    _$connectionStreamAtom.reportWrite(value, super.connectionStream, () {
      super.connectionStream = value;
    });
  }

  @override
  String toString() {
    return '''
connectionStream: ${connectionStream}
    ''';
  }
}
