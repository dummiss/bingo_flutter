import 'package:json_annotation/json_annotation.dart';

part 'game_data_model.g.dart';

@JsonSerializable()
class GameDataModel {
  @JsonKey(defaultValue: [])
  List<Map<String,dynamic>> data;
  // @JsonKey(defaultValue: [])
  List<int>? history;
  // @JsonKey(defaultValue: '')
  String? howToPlay;
  @JsonKey(defaultValue: [])
  List<String> player;
  // @JsonKey(defaultValue: -1)
  int? selectNum;
  // @JsonKey(defaultValue: [])
  List<String>? sequence;
  // @JsonKey(defaultValue: '')
  String? winner;
  // @JsonKey(defaultValue: -1)
  int? autoSelect;
  // @JsonKey(defaultValue: -1)
  int? ownSelect;
  // @JsonKey(defaultValue: false)
  bool? isStarted;
  // @JsonKey(defaultValue: false)
  bool? isEnded;

  GameDataModel(
      {required this.data,
      this.history,
      this.howToPlay,
      required this.player,
      this.selectNum,
      this.sequence,
      this.winner,
      this.autoSelect,
      this.ownSelect,
      this.isStarted,
      this.isEnded});

  factory GameDataModel.fromJson(Map<String, dynamic> json) =>
      _$GameDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$GameDataModelToJson(this);
}
