import 'package:json_annotation/json_annotation.dart';

part 'game_data_model.g.dart';

@JsonSerializable()
class GameDataModel {
  Map<String, List<int>>? data;
  @JsonKey(defaultValue: [])
  List<int> history;
  @JsonKey(defaultValue: '')
  String howToPlay;
  @JsonKey(defaultValue: [])
  List<String> player;
  @JsonKey(defaultValue: -1)
  int selectNum;
  @JsonKey(defaultValue: [])
  List<String> sequence;
  @JsonKey(defaultValue: '')
  String winner;

  GameDataModel(
      {this.data,
      required this.history,
      required this.howToPlay,
      required this.player,
      required this.selectNum,
      required this.sequence,
      required this.winner});

  factory GameDataModel.fromJson(Map<String, dynamic> json) =>
      _$GameDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$GameDataModelToJson(this);
}
