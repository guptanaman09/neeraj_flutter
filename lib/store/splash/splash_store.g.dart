// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Splash on _SplashStore, Store {
  final _$isLoggedInAtom = Atom(name: '_SplashStore.isLoggedIn');

  @override
  bool get isLoggedIn {
    _$isLoggedInAtom.reportRead();
    return super.isLoggedIn;
  }

  @override
  set isLoggedIn(bool value) {
    _$isLoggedInAtom.reportWrite(value, super.isLoggedIn, () {
      super.isLoggedIn = value;
    });
  }

  final _$checkLoggedInAsyncAction = AsyncAction('_SplashStore.checkLoggedIn');

  @override
  Future<void> checkLoggedIn() {
    return _$checkLoggedInAsyncAction.run(() => super.checkLoggedIn());
  }

  final _$_SplashStoreActionController = ActionController(name: '_SplashStore');

  @override
  void setValue(bool val) {
    final _$actionInfo = _$_SplashStoreActionController.startAction(
        name: '_SplashStore.setValue');
    try {
      return super.setValue(val);
    } finally {
      _$_SplashStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changedScreen(BuildContext context) {
    final _$actionInfo = _$_SplashStoreActionController.startAction(
        name: '_SplashStore.changedScreen');
    try {
      return super.changedScreen(context);
    } finally {
      _$_SplashStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoggedIn: ${isLoggedIn}
    ''';
  }
}
