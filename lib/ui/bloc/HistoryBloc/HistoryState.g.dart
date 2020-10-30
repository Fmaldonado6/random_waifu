// GENERATED CODE - DO NOT MODIFY BY HAND

part of HistoryState;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$HistoryState extends HistoryState {
  @override
  final bool isLoading;
  @override
  final bool hasError;
  @override
  final SavedInformation savedInformation;

  factory _$HistoryState([void Function(HistoryStateBuilder) updates]) =>
      (new HistoryStateBuilder()..update(updates)).build();

  _$HistoryState._({this.isLoading, this.hasError, this.savedInformation})
      : super._() {
    if (isLoading == null) {
      throw new BuiltValueNullFieldError('HistoryState', 'isLoading');
    }
    if (hasError == null) {
      throw new BuiltValueNullFieldError('HistoryState', 'hasError');
    }
    if (savedInformation == null) {
      throw new BuiltValueNullFieldError('HistoryState', 'savedInformation');
    }
  }

  @override
  HistoryState rebuild(void Function(HistoryStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HistoryStateBuilder toBuilder() => new HistoryStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HistoryState &&
        isLoading == other.isLoading &&
        hasError == other.hasError &&
        savedInformation == other.savedInformation;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, isLoading.hashCode), hasError.hashCode),
        savedInformation.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('HistoryState')
          ..add('isLoading', isLoading)
          ..add('hasError', hasError)
          ..add('savedInformation', savedInformation))
        .toString();
  }
}

class HistoryStateBuilder
    implements Builder<HistoryState, HistoryStateBuilder> {
  _$HistoryState _$v;

  bool _isLoading;
  bool get isLoading => _$this._isLoading;
  set isLoading(bool isLoading) => _$this._isLoading = isLoading;

  bool _hasError;
  bool get hasError => _$this._hasError;
  set hasError(bool hasError) => _$this._hasError = hasError;

  SavedInformation _savedInformation;
  SavedInformation get savedInformation => _$this._savedInformation;
  set savedInformation(SavedInformation savedInformation) =>
      _$this._savedInformation = savedInformation;

  HistoryStateBuilder();

  HistoryStateBuilder get _$this {
    if (_$v != null) {
      _isLoading = _$v.isLoading;
      _hasError = _$v.hasError;
      _savedInformation = _$v.savedInformation;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(HistoryState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$HistoryState;
  }

  @override
  void update(void Function(HistoryStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$HistoryState build() {
    final _$result = _$v ??
        new _$HistoryState._(
            isLoading: isLoading,
            hasError: hasError,
            savedInformation: savedInformation);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
