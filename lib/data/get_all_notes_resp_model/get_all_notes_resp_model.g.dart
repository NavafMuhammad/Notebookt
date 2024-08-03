// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_notes_resp_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllNotesRespModel _$GetAllNotesRespModelFromJson(
        Map<String, dynamic> json) =>
    GetAllNotesRespModel(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => NoteModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$GetAllNotesRespModelToJson(
        GetAllNotesRespModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
