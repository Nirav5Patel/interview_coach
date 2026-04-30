class SessionModel {
  String role;
  String difficulty;
  DateTime date;
  int overallScore;
  int communicationScore;
  int technicalScore;
  int confidenceScore;
  String aiSummaryFeedback;
  List<QuestionAnswer> questionAnswers;

  SessionModel({
    required this.role,
    required this.difficulty,
    required this.date,
    required this.overallScore,
    required this.communicationScore,
    required this.technicalScore,
    required this.confidenceScore,
    required this.aiSummaryFeedback,
    required this.questionAnswers,
  });

  // for saving to Hive
  Map<String, dynamic> toMap() => {
    'role':       role,
    'difficulty': difficulty,
    'date':       date.toIso8601String(),
    'score':      overallScore,
    'commScore':  communicationScore,
    'techScore':  technicalScore,
    'confScore':  confidenceScore,
    'feedback':   aiSummaryFeedback,
    'qas': questionAnswers.map((q) => q.toMap()).toList(),
  };

  // for reading from Hive
  factory SessionModel.fromMap(Map<String, dynamic> m) => SessionModel(
    role:               m['role'],
    difficulty:         m['difficulty'],
    date:               DateTime.parse(m['date']),
    overallScore:       m['score'],
    communicationScore: m['commScore'],
    technicalScore:     m['techScore'],
    confidenceScore:    m['confScore'],
    aiSummaryFeedback:  m['feedback'],
    questionAnswers:    (m['qas'] as List)
        .map((q) => QuestionAnswer.fromMap(Map<String, dynamic>.from(q)))
        .toList(),
  );
}

// ── QuestionAnswer lives inside same file ─────────────────────
class QuestionAnswer {
  String question;
  String userAnswer;
  String aiImprovedAnswer;
  int score;

  QuestionAnswer({
    required this.question,
    required this.userAnswer,
    required this.aiImprovedAnswer,
    required this.score,
  });

  Map<String, dynamic> toMap() => {
    'question':       question,
    'userAnswer':     userAnswer,
    'improvedAnswer': aiImprovedAnswer,
    'score':          score,
  };

  factory QuestionAnswer.fromMap(Map<String, dynamic> m) => QuestionAnswer(
    question:        m['question'],
    userAnswer:      m['userAnswer'],
    aiImprovedAnswer: m['improvedAnswer'],
    score:           m['score'],
  );
}