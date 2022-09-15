// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameDataModel _$GameDataModelFromJson(Map<String, dynamic> json) =>
    GameDataModel(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => e as Map<String, dynamic>)
              .toList() ??
          [],
      history:
          (json['history'] as List<dynamic>?)?.map((e) => e as int).toList(),
      howToPlay: json['howToPlay'] as String?,
      player: (json['player'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      selectNum: json['selectNum'] as int?,
      sequence: (json['sequence'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      winner: json['winner'] as String?,
      autoSelect: json['autoSelect'] as int?,
      ownSelect: json['ownSelect'] as int?,
      isStarted: json['isStarted'] as bool?,
      isEnded: json['isEnded'] as bool?,
    );

Map<String, dynamic> _$GameDataModelToJson(GameDataModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'history': instance.history,
      'howToPlay': instance.howToPlay,
      'player': instance.player,
      'selectNum': instance.selectNum,
      'sequence': instance.sequence,
      'winner': instance.winner,
      'autoSelect': instance.autoSelect,
      'ownSelect': instance.ownSelect,
      'isStarted': instance.isStarted,
      'isEnded': instance.isEnded,
    };
