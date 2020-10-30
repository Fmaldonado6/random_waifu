// GENERATED CODE - DO NOT MODIFY BY HAND

part of KitsuAttributes;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<KitsuAttributes> _$kitsuAttributesSerializer =
    new _$KitsuAttributesSerializer();

class _$KitsuAttributesSerializer
    implements StructuredSerializer<KitsuAttributes> {
  @override
  final Iterable<Type> types = const [KitsuAttributes, _$KitsuAttributes];
  @override
  final String wireName = 'KitsuAttributes';

  @override
  Iterable<Object> serialize(Serializers serializers, KitsuAttributes object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'image',
      serializers.serialize(object.image,
          specifiedType: const FullType(KitsuImage)),
    ];
    if (object.description != null) {
      result
        ..add('description')
        ..add(serializers.serialize(object.description,
            specifiedType: const FullType(String)));
    }
    if (object.name != null) {
      result
        ..add('name')
        ..add(serializers.serialize(object.name,
            specifiedType: const FullType(String)));
    }
    if (object.malId != null) {
      result
        ..add('malId')
        ..add(serializers.serialize(object.malId,
            specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  KitsuAttributes deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new KitsuAttributesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'malId':
          result.malId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'image':
          result.image.replace(serializers.deserialize(value,
              specifiedType: const FullType(KitsuImage)) as KitsuImage);
          break;
      }
    }

    return result.build();
  }
}

class _$KitsuAttributes extends KitsuAttributes {
  @override
  final String description;
  @override
  final String name;
  @override
  final int malId;
  @override
  final KitsuImage image;

  factory _$KitsuAttributes([void Function(KitsuAttributesBuilder) updates]) =>
      (new KitsuAttributesBuilder()..update(updates)).build();

  _$KitsuAttributes._({this.description, this.name, this.malId, this.image})
      : super._() {
    if (image == null) {
      throw new BuiltValueNullFieldError('KitsuAttributes', 'image');
    }
  }

  @override
  KitsuAttributes rebuild(void Function(KitsuAttributesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  KitsuAttributesBuilder toBuilder() =>
      new KitsuAttributesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is KitsuAttributes &&
        description == other.description &&
        name == other.name &&
        malId == other.malId &&
        image == other.image;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, description.hashCode), name.hashCode), malId.hashCode),
        image.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('KitsuAttributes')
          ..add('description', description)
          ..add('name', name)
          ..add('malId', malId)
          ..add('image', image))
        .toString();
  }
}

class KitsuAttributesBuilder
    implements Builder<KitsuAttributes, KitsuAttributesBuilder> {
  _$KitsuAttributes _$v;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  int _malId;
  int get malId => _$this._malId;
  set malId(int malId) => _$this._malId = malId;

  KitsuImageBuilder _image;
  KitsuImageBuilder get image => _$this._image ??= new KitsuImageBuilder();
  set image(KitsuImageBuilder image) => _$this._image = image;

  KitsuAttributesBuilder();

  KitsuAttributesBuilder get _$this {
    if (_$v != null) {
      _description = _$v.description;
      _name = _$v.name;
      _malId = _$v.malId;
      _image = _$v.image?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(KitsuAttributes other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$KitsuAttributes;
  }

  @override
  void update(void Function(KitsuAttributesBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$KitsuAttributes build() {
    _$KitsuAttributes _$result;
    try {
      _$result = _$v ??
          new _$KitsuAttributes._(
              description: description,
              name: name,
              malId: malId,
              image: image.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'image';
        image.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'KitsuAttributes', _$failedField, e.toString());
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

class KitsuAttributesAdapter extends TypeAdapter<KitsuAttributes> {
  @override
  final typeId = 2;

  @override
  KitsuAttributes read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return KitsuAttributes();
  }

  @override
  void write(BinaryWriter writer, KitsuAttributes obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.description)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.malId)
      ..writeByte(3)
      ..write(obj.image);
  }
}
