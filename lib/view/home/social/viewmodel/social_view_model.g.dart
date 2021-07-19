// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SocialViewModel on _SocialViewModelBase, Store {
  final _$socialUserListAtom =
      Atom(name: '_SocialViewModelBase.socialUserList');

  @override
  List<SocialUser> get socialUserList {
    _$socialUserListAtom.reportRead();
    return super.socialUserList;
  }

  @override
  set socialUserList(List<SocialUser> value) {
    _$socialUserListAtom.reportWrite(value, super.socialUserList, () {
      super.socialUserList = value;
    });
  }

  final _$isPageLoadingAtom = Atom(name: '_SocialViewModelBase.isPageLoading');

  @override
  bool get isPageLoading {
    _$isPageLoadingAtom.reportRead();
    return super.isPageLoading;
  }

  @override
  set isPageLoading(bool value) {
    _$isPageLoadingAtom.reportWrite(value, super.isPageLoading, () {
      super.isPageLoading = value;
    });
  }

  final _$isPageLoadingLazyAtom =
      Atom(name: '_SocialViewModelBase.isPageLoadingLazy');

  @override
  bool get isPageLoadingLazy {
    _$isPageLoadingLazyAtom.reportRead();
    return super.isPageLoadingLazy;
  }

  @override
  set isPageLoadingLazy(bool value) {
    _$isPageLoadingLazyAtom.reportWrite(value, super.isPageLoadingLazy, () {
      super.isPageLoadingLazy = value;
    });
  }

  final _$_fetchAllUserAsyncAction =
      AsyncAction('_SocialViewModelBase._fetchAllUser');

  @override
  Future<void> _fetchAllUser() {
    return _$_fetchAllUserAsyncAction.run(() => super._fetchAllUser());
  }

  final _$fetchAllUserLazyAsyncAction =
      AsyncAction('_SocialViewModelBase.fetchAllUserLazy');

  @override
  Future<void> fetchAllUserLazy(int index) {
    return _$fetchAllUserLazyAsyncAction
        .run(() => super.fetchAllUserLazy(index));
  }

  final _$_SocialViewModelBaseActionController =
      ActionController(name: '_SocialViewModelBase');

  @override
  void fetchAllSearchQuery() {
    final _$actionInfo = _$_SocialViewModelBaseActionController.startAction(
        name: '_SocialViewModelBase.fetchAllSearchQuery');
    try {
      return super.fetchAllSearchQuery();
    } finally {
      _$_SocialViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _changeLoading() {
    final _$actionInfo = _$_SocialViewModelBaseActionController.startAction(
        name: '_SocialViewModelBase._changeLoading');
    try {
      return super._changeLoading();
    } finally {
      _$_SocialViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _changeLoadingLazy() {
    final _$actionInfo = _$_SocialViewModelBaseActionController.startAction(
        name: '_SocialViewModelBase._changeLoadingLazy');
    try {
      return super._changeLoadingLazy();
    } finally {
      _$_SocialViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
socialUserList: ${socialUserList},
isPageLoading: ${isPageLoading},
isPageLoadingLazy: ${isPageLoadingLazy}
    ''';
  }
}
