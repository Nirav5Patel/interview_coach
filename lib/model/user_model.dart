import 'package:interview_coach/model/session_model.dart';

class UserModel {
  String name;
  String targetRole;
  String experienceLevel;
  DateTime createdAt;
  List<SessionModel> sessions;

  UserModel({
    required this.name,
    required this.targetRole,
    required this.experienceLevel,
    required this.createdAt,
    List<SessionModel>? sessions,
  }) : sessions = sessions ?? [];
}