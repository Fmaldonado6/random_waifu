// GENERATED CODE - DO NOT MODIFY BY HAND

part of CharacterInformation;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CharacterInformation> _$characterInformationSerializer =
    new _$CharacterInformationSerializer();

class _$CharacterInformationSerializer
    implements StructuredSerializer<CharacterInformation> {
  @override
  final Iterable<Type> types = const [
    CharacterInformation,
    _$CharacterInformation
  ];
  @override
  final String wireName = 'CharacterInformation';

  @override
  Iterable<Object> serialize(
      Serializers serializers, CharacterInformation object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.name != null) {
      result
        ..add('name')
        ..add(serializers.serialize(object.name,
            specifiedType: const FullType(String)));
    }
    if (object.about != null) {
      result
        ..add('about')
        ..add(serializers.serialize(object.about,
            specifiedType: const FullType(String)));
    }
    if (object.image_url != null) {
      result
        ..add('image_url')
        ..add(serializers.serialize(object.image_url,
            specifiedType: const FullType(String)));
    }
    if (object.animeography != null) {
      result
        ..add('animeography')
        ..add(serializers.serialize(object.animeography,
            specifiedType: const FullType(
                BuiltList, const [const FullType(AnimeInformation)])));
    }
    if (object.mangaography != null) {
      result
        ..add('mangaography')
        ..add(serializers.serialize(object.mangaography,
            specifiedType: const FullType(
                BuiltList, const [const FullType(AnimeInformation)])));
    }
    if (object.voice_actors != null) {
      result
        ..add('voice_actors')
        ..add(serializers.serialize(object.voice_actors,
            specifiedType: const FullType(
                BuiltList, const [const FullType(AnimeInformation)])));
    }
    return result;
  }

  @override
  CharacterInformation deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CharacterInformationBuilder();

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
        case 'about':
          result.about = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'image_url':
          result.image_url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'animeography':
          result.animeography.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(AnimeInformation)]))
              as BuiltList<Object>);
          break;
        case 'mangaography':
          result.mangaography.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(AnimeInformation)]))
              as BuiltList<Object>);
          break;
        case 'voice_actors':
          result.voice_actors.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(AnimeInformation)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$CharacterInformation extends CharacterInformation {
  @override
  final String name;
  @override
  final String about;
  @override
  final String image_url;
  @override
  final BuiltList<AnimeInformation> animeography;
  @override
  final BuiltList<AnimeInformation> mangaography;
  @override
  final BuiltList<AnimeInformation> voice_actors;

  factory _$CharacterInformation(
          [void Function(CharacterInformationBuilder) updates]) =>
      (new CharacterInformationBuilder()..update(updates)).build();

  _$CharacterInformation._(
      {this.name,
      this.about,
      this.image_url,
      this.animeography,
      this.mangaography,
      this.voice_actors})
      : super._();

  @override
  CharacterInformation rebuild(
          void Function(CharacterInformationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CharacterInformationBuilder toBuilder() =>
      new CharacterInformationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CharacterInformation &&
        name == other.name &&
        about == other.about &&
        image_url == other.image_url &&
        animeography == other.animeography &&
        mangaography == other.mangaography &&
        voice_actors == other.voice_actors;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, name.hashCode), about.hashCode),
                    image_url.hashCode),
                animeography.hashCode),
            mangaography.hashCode),
        voice_actors.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CharacterInformation')
          ..add('name', name)
          ..add('about', about)
          ..add('image_url', image_url)
          ..add('animeography', animeography)
          ..add('mangaography', mangaography)
          ..add('voice_actors', voice_actors))
        .toString();
  }
}

class CharacterInformationBuilder
    implements Builder<CharacterInformation, CharacterInformationBuilder> {
  _$CharacterInformation _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _about;
  String get about => _$this._about;
  set about(String about) => _$this._about = about;

  String _image_url;
  String get image_url => _$this._image_url;
  set image_url(String image_url) => _$this._image_url = image_url;

  ListBuilder<AnimeInformation> _animeography;
  ListBuilder<AnimeInformation> get animeography =>
      _$this._animeography ??= new ListBuilder<AnimeInformation>();
  set animeography(ListBuilder<AnimeInformation> animeography) =>
      _$this._animeography = animeography;

  ListBuilder<AnimeInformation> _mangaography;
  ListBuilder<AnimeInformation> get mangaography =>
      _$this._mangaography ??= new ListBuilder<AnimeInformation>();
  set mangaography(ListBuilder<AnimeInformation> mangaography) =>
      _$this._mangaography = mangaography;

  ListBuilder<AnimeInformation> _voice_actors;
  ListBuilder<AnimeInformation> get voice_actors =>
      _$this._voice_actors ??= new ListBuilder<AnimeInformation>();
  set voice_actors(ListBuilder<AnimeInformation> voice_actors) =>
      _$this._voice_actors = voice_actors;

  CharacterInformationBuilder();

  CharacterInformationBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _about = _$v.about;
      _image_url = _$v.image_url;
      _animeography = _$v.animeography?.toBuilder();
      _mangaography = _$v.mangaography?.toBuilder();
      _voice_actors = _$v.voice_actors?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CharacterInformation other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$CharacterInformation;
  }

  @override
  void update(void Function(CharacterInformationBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CharacterInformation build() {
    _$CharacterInformation _$result;
    try {
      _$result = _$v ??
          new _$CharacterInformation._(
              name: name,
              about: about,
              image_url: image_url,
              animeography: _animeography?.build(),
              mangaography: _mangaography?.build(),
              voice_actors: _voice_actors?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'animeography';
        _animeography?.build();
        _$failedField = 'mangaography';
        _mangaography?.build();
        _$failedField = 'voice_actors';
        _voice_actors?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'CharacterInformation', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
