// GENERATED CODE - DO NOT MODIFY BY HAND

part of KitsuImage;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<KitsuImage> _$kitsuImageSerializer = new _$KitsuImageSerializer();

class _$KitsuImageSerializer implements StructuredSerializer<KitsuImage> {
  @override
  final Iterable<Type> types = const [KitsuImage, _$KitsuImage];
  @override
  final String wireName = 'KitsuImage';

  @override
  Iterable<Object> serialize(Serializers serializers, KitsuImage object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.original != null) {
      result
        ..add('original')
        ..add(serializers.serialize(object.original,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  KitsuImage deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new KitsuImageBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'original':
          result.original = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$KitsuImage extends KitsuImage {
  @override
  final String original;

  factory _$KitsuImage([void Function(KitsuImageBuilder) updates]) =>
      (new KitsuImageBuilder()..update(updates)).build();

  _$KitsuImage._({this.original}) : super._();

  @override
  KitsuImage rebuild(void Function(KitsuImageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  KitsuImageBuilder toBuilder() => new KitsuImageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is KitsuImage && original == other.original;
  }

  @override
  int get hashCode {
    return $jf($jc(0, original.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('KitsuImage')
          ..add('original', original))
        .toString();
  }
}

class KitsuImageBuilder implements Builder<KitsuImage, KitsuImageBuilder> {
  _$KitsuImage _$v;

  String _original;
  String get original => _$this._original;
  set original(String original) => _$this._original = original;

  KitsuImageBuilder();

  KitsuImageBuilder get _$this {
    if (_$v != null) {
      _original = _$v.original;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(KitsuImage other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$KitsuImage;
  }

  @override
  void update(void Function(KitsuImageBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$KitsuImage build() {
    final _$result = _$v ?? new _$KitsuImage._(original: original);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class KitsuImageAdapter extends TypeAdapter<KitsuImage> {
  @override
  final typeId = 3;

  @override
  KitsuImage read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return KitsuImage();
  }

  @override
  void write(BinaryWriter writer, KitsuImage obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.original);
  }
}
