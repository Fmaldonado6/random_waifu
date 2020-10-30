// GENERATED CODE - DO NOT MODIFY BY HAND

part of InformationState;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$InformationState extends InformationState {
  @override
  final bool isLoading;
  @override
  final bool hasError;
  @override
  final KitsuCharacterInformation characterInformation;

  factory _$InformationState(
          [void Function(InformationStateBuilder) updates]) =>
      (new InformationStateBuilder()..update(updates)).build();

  _$InformationState._(
      {this.isLoading, this.hasError, this.characterInformation})
      : super._() {
    if (isLoading == null) {
      throw new BuiltValueNullFieldError('InformationState', 'isLoading');
    }
    if (hasError == null) {
      throw new BuiltValueNullFieldError('InformationState', 'hasError');
    }
    if (characterInformation == null) {
      throw new BuiltValueNullFieldError(
          'InformationState', 'characterInformation');
    }
  }

  @override
  InformationState rebuild(void Function(InformationStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InformationStateBuilder toBuilder() =>
      new InformationStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InformationState &&
        isLoading == other.isLoading &&
        hasError == other.hasError &&
        characterInformation == other.characterInformation;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, isLoading.hashCode), hasError.hashCode),
        characterInformation.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('InformationState')
          ..add('isLoading', isLoading)
          ..add('hasError', hasError)
          ..add('characterInformation', characterInformation))
        .toString();
  }
}

class InformationStateBuilder
    implements Builder<InformationState, InformationStateBuilder> {
  _$InformationState _$v;

  bool _isLoading;
  bool get isLoading => _$this._isLoading;
  set isLoading(bool isLoading) => _$this._isLoading = isLoading;

  bool _hasError;
  bool get hasError => _$this._hasError;
  set hasError(bool hasError) => _$this._hasError = hasError;

  KitsuCharacterInformationBuilder _characterInformation;
  KitsuCharacterInformationBuilder get characterInformation =>
      _$this._characterInformation ??= new KitsuCharacterInformationBuilder();
  set characterInformation(
          KitsuCharacterInformationBuilder characterInformation) =>
      _$this._characterInformation = characterInformation;

  InformationStateBuilder();

  InformationStateBuilder get _$this {
    if (_$v != null) {
      _isLoading = _$v.isLoading;
      _hasError = _$v.hasError;
      _characterInformation = _$v.characterInformation?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(InformationState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$InformationState;
  }

  @override
  void update(void Function(InformationStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$InformationState build() {
    _$InformationState _$result;
    try {
      _$result = _$v ??
          new _$InformationState._(
              isLoading: isLoading,
              hasError: hasError,
              characterInformation: characterInformation.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'characterInformation';
        characterInformation.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'InformationState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
