// GENERATED CODE - DO NOT MODIFY BY HAND

part of serializers;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializers _$serializers = (new Serializers().toBuilder()
      ..add(AnimeInformation.serializer)
      ..add(CharacterInformation.serializer)
      ..add(KitsuAttributes.serializer)
      ..add(KitsuCharacterInformation.serializer)
      ..add(KitsuData.serializer)
      ..add(KitsuImage.serializer)
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(AnimeInformation)]),
          () => new ListBuilder<AnimeInformation>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(AnimeInformation)]),
          () => new ListBuilder<AnimeInformation>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(AnimeInformation)]),
          () => new ListBuilder<AnimeInformation>()))
    .build();

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
