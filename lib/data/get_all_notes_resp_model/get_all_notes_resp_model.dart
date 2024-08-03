import 'package:json_annotation/json_annotation.dart';
import 'package:note_app/data/note_model/note_model.dart';

part 'get_all_notes_resp_model.g.dart';

@JsonSerializable()
class GetAllNotesRespModel {
  @JsonKey(name: 'data')
  List<NoteModel> data;

  GetAllNotesRespModel({this.data = const []});

  factory GetAllNotesRespModel.fromJson(Map<String, dynamic> json) {
    return _$GetAllNotesRespModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetAllNotesRespModelToJson(this);
}
