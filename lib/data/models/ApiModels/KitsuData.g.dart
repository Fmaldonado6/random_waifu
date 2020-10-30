// GENERATED CODE - DO NOT MODIFY BY HAND

part of KitsuData;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<KitsuData> _$kitsuDataSerializer = new _$KitsuDataSerializer();

class _$KitsuDataSerializer implements StructuredSerializer<KitsuData> {
  @override
  final Iterable<Type> types = const [KitsuData, _$KitsuData];
  @override
  final String wireName = 'KitsuData';

  @override
  Iterable<Object> serialize(Serializers serializers, KitsuData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'attributes',
      serializers.serialize(object.attributes,
          specifiedType: const FullType(KitsuAttributes)),
    ];

    return result;
  }

  @override
  KitsuData deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new KitsuDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'attributes':
          result.attributes.replace(serializers.deserialize(value,
                  specifiedType: const FullType(KitsuAttributes))
              as KitsuAttributes);
          break;
      }
    }

    return result.build();
  }
}

class _$KitsuData extends KitsuData {
  @override
  final KitsuAttributes attributes;

  factory _$KitsuData([void Function(KitsuDataBuilder) updates]) =>
      (new KitsuDataBuilder()..update(updates)).build();

  _$KitsuData._({this.attributes}) : super._() {
    if (attributes == null) {
      throw new BuiltValueNullFieldError('KitsuData', 'attributes');
    }
  }

  @override
  KitsuData rebuild(void Function(KitsuDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  KitsuDataBuilder toBuilder() => new KitsuDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is KitsuData && attributes == other.attributes;
  }

  @override
  int get hashCode {
    return $jf($jc(0, attributes.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('KitsuData')
          ..add('attributes', attributes))
        .toString();
  }
}

class KitsuDataBuilder implements Builder<KitsuData, KitsuDataBuilder> {
  _$KitsuData _$v;

  KitsuAttributesBuilder _attributes;
  KitsuAttributesBuilder get attributes =>
      _$this._attributes ??= new KitsuAttributesBuilder();
  set attributes(KitsuAttributesBuilder attributes) =>
      _$this._attributes = attributes;

  KitsuDataBuilder();

  KitsuDataBuilder get _$this {
    if (_$v != null) {
      _attributes = _$v.attributes?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(KitsuData other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$KitsuData;
  }

  @override
  void update(void Function(KitsuDataBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$KitsuData build() {
    _$KitsuData _$result;
    try {
      _$result = _$v ?? new _$KitsuData._(attributes: attributes.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'attributes';
        attributes.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'KitsuData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class KitsuDataAdapter extends TypeAdapter<KitsuData> {
  @override
  final typeId = 1;

  @override
  KitsuData read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return KitsuData();
  }

  @override
  void write(BinaryWriter writer, KitsuData obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.attributes);
  }
}
