import 'package:json_annotation/json_annotation.dart';

part 'game_data_model.g.dart';

@JsonSerializable()
class game_data_model {
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

  game_data_model(
      {this.data,
      required this.history,
      required this.howToPlay,
      required this.player,
      required this.selectNum,
      required this.sequence,
      required this.winner});

  factory game_data_model.fromJson(Map<String, dynamic> json) =>
      _$game_data_modelFromJson(json);

  Map<String, dynamic> toJson() => _$game_data_modelToJson(this);
}
