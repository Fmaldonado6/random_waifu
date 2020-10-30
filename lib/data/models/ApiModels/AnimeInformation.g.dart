// GENERATED CODE - DO NOT MODIFY BY HAND

part of AnimeInformation;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AnimeInformation> _$animeInformationSerializer =
    new _$AnimeInformationSerializer();

class _$AnimeInformationSerializer
    implements StructuredSerializer<AnimeInformation> {
  @override
  final Iterable<Type> types = const [AnimeInformation, _$AnimeInformation];
  @override
  final String wireName = 'AnimeInformation';

  @override
  Iterable<Object> serialize(Serializers serializers, AnimeInformation object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'image_url',
      serializers.serialize(object.image_url,
          specifiedType: const FullType(String)),
    ];
    if (object.role != null) {
      result
        ..add('role')
        ..add(serializers.serialize(object.role,
            specifiedType: const FullType(String)));
    }
    if (object.language != null) {
      result
        ..add('language')
        ..add(serializers.serialize(object.language,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  AnimeInformation deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AnimeInformationBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'image_url':
          result.image_url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'role':
          result.role = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'language':
          result.language = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$AnimeInformation extends AnimeInformation {
  @override
  final String name;
  @override
  final String image_url;
  @override
  final String role;
  @override
  final String language;

  factory _$AnimeInformation(
          [void Function(AnimeInformationBuilder) updates]) =>
      (new AnimeInformationBuilder()..update(updates)).build();

  _$AnimeInformation._({this.name, this.image_url, this.role, this.language})
      : super._() {
    if (name == null) {
      throw new BuiltValueNullFieldError('AnimeInformation', 'name');
    }
    if (image_url == null) {
      throw new BuiltValueNullFieldError('AnimeInformation', 'image_url');
    }
  }

  @override
  AnimeInformation rebuild(void Function(AnimeInformationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AnimeInformationBuilder toBuilder() =>
      new AnimeInformationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AnimeInformation &&
        name == other.name &&
        image_url == other.image_url &&
        role == other.role &&
        language == other.language;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, name.hashCode), image_url.hashCode), role.hashCode),
        language.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AnimeInformation')
          ..add('name', name)
          ..add('image_url', image_url)
          ..add('role', role)
          ..add('language', language))
        .toString();
  }
}

class AnimeInformationBuilder
    implements Builder<AnimeInformation, AnimeInformationBuilder> {
  _$AnimeInformation _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _image_url;
  String get image_url => _$this._image_url;
  set image_url(String image_url) => _$this._image_url = image_url;

  String _role;
  String get role => _$this._role;
  set role(String role) => _$this._role = role;

  String _language;
  String get language => _$this._language;
  set language(String language) => _$this._language = language;

  AnimeInformationBuilder();

  AnimeInformationBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _image_url = _$v.image_url;
      _role = _$v.role;
      _language = _$v.language;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AnimeInformation other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AnimeInformation;
  }

  @override
  void update(void Function(AnimeInformationBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AnimeInformation build() {
    final _$result = _$v ??
        new _$AnimeInformation._(
            name: name, image_url: image_url, role: role, language: language);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
