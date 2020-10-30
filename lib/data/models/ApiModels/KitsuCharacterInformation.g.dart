// GENERATED CODE - DO NOT MODIFY BY HAND

part of KitsuCharacterInformation;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<KitsuCharacterInformation> _$kitsuCharacterInformationSerializer =
    new _$KitsuCharacterInformationSerializer();

class _$KitsuCharacterInformationSerializer
    implements StructuredSerializer<KitsuCharacterInformation> {
  @override
  final Iterable<Type> types = const [
    KitsuCharacterInformation,
    _$KitsuCharacterInformation
  ];
  @override
  final String wireName = 'KitsuCharacterInformation';

  @override
  Iterable<Object> serialize(
      Serializers serializers, KitsuCharacterInformation object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'data',
      serializers.serialize(object.data,
          specifiedType: const FullType(KitsuData)),
    ];

    return result;
  }

  @override
  KitsuCharacterInformation deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new KitsuCharacterInformationBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'data':
          result.data.replace(serializers.deserialize(value,
              specifiedType: const FullType(KitsuData)) as KitsuData);
          break;
      }
    }

    return result.build();
  }
}

class _$KitsuCharacterInformation extends KitsuCharacterInformation {
  @override
  final KitsuData data;

  factory _$KitsuCharacterInformation(
          [void Function(KitsuCharacterInformationBuilder) updates]) =>
      (new KitsuCharacterInformationBuilder()..update(updates)).build();

  _$KitsuCharacterInformation._({this.data}) : super._() {
    if (data == null) {
      throw new BuiltValueNullFieldError('KitsuCharacterInformation', 'data');
    }
  }

  @override
  KitsuCharacterInformation rebuild(
          void Function(KitsuCharacterInformationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  KitsuCharacterInformationBuilder toBuilder() =>
      new KitsuCharacterInformationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is KitsuCharacterInformation && data == other.data;
  }

  @override
  int get hashCode {
    return $jf($jc(0, data.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('KitsuCharacterInformation')
          ..add('data', data))
        .toString();
  }
}

class KitsuCharacterInformationBuilder
    implements
        Builder<KitsuCharacterInformation, KitsuCharacterInformationBuilder> {
  _$KitsuCharacterInformation _$v;

  KitsuDataBuilder _data;
  KitsuDataBuilder get data => _$this._data ??= new KitsuDataBuilder();
  set data(KitsuDataBuilder data) => _$this._data = data;

  KitsuCharacterInformationBuilder();

  KitsuCharacterInformationBuilder get _$this {
    if (_$v != null) {
      _data = _$v.data?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(KitsuCharacterInformation other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$KitsuCharacterInformation;
  }

  @override
  void update(void Function(KitsuCharacterInformationBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$KitsuCharacterInformation build() {
    _$KitsuCharacterInformation _$result;
    try {
      _$result = _$v ?? new _$KitsuCharacterInformation._(data: data.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'KitsuCharacterInformation', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
