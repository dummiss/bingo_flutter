// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

game_data_model _$game_data_modelFromJson(Map<String, dynamic> json) =>
    game_data_model(
      data: (json['data'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, (e as List<dynamic>).map((e) => e as int).toList()),
      ),
      history:
          (json['history'] as List<dynamic>?)?.map((e) => e as int).toList() ??
              [],
      howToPlay: json['howToPlay'] as String? ?? '',
      player: (json['player'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      selectNum: json['selectNum'] as int? ?? -1,
      sequence: (json['sequence'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      winner: json['winner'] as String? ?? '',
    );

Map<String, dynamic> _$game_data_modelToJson(game_data_model instance) =>
    <String, dynamic>{
      'data': instance.data,
      'history': instance.history,
      'howToPlay': instance.howToPlay,
      'player': instance.player,
      'selectNum': instance.selectNum,
      'sequence': instance.sequence,
      'winner': instance.winner,
    };
