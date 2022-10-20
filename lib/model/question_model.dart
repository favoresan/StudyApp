import 'package:cloud_firestore/cloud_firestore.dart';

class Subject {
  String id;
  String title;
  String? imageUrl;
  String description;
  int timeSeconds, questionCount;
  List<Questions>? questions;

  Subject(
      {required this.id,
      required this.title,
      this.imageUrl,
      required this.description,
      required this.questionCount,
      required this.timeSeconds,
      this.questions});

  Subject.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String,
        title = json['title'] as String,
        imageUrl = json['image_url'] as String,
        description = json['Description'] as String,
        timeSeconds = json['time_seconds'],
        questionCount = 0,
        questions = (json['questions'] as List)
            .map((dynamic e) => Questions.fromJson(e as Map<String, dynamic>))
            .toList();

  Subject.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> json)
      : id = json.data()?['id'] ?? '',
        title = json.data()?['title'] ?? '',
        imageUrl = json.data()?['image_url'] ?? '',
        description = json.data()?['description'] ?? '',
        timeSeconds = json.data()?['time_sec'] ?? 0,
        questionCount = json.data()?['questions_count'] ?? 0,
        questions = [];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['image_url'] = imageUrl;
    data['Description'] = description;
    data['time_seconds'] = timeSeconds;
    if (questions != null) {
      data['questions'] = questions?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Questions {
  String id;
  String question;
  List<Answers> answers;
  String correctAnswer;

  Questions(
      {required this.id,
      required this.question,
      required this.answers,
      required this.correctAnswer});

  Questions.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String,
        question = json['question'] as String,
        answers =
            (json['answers'] as List).map((e) => Answers.fromJson(e)).toList(),
        correctAnswer = json['correct_answer'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['question'] = question;
    data['answers'] = answers.map((v) => v.toJson()).toList();
    data['correct_answer'] = correctAnswer;
    return data;
  }
}

class Answers {
  String? identifier;
  String? answer;

  Answers({this.identifier, this.answer});

  Answers.fromJson(Map<String, dynamic> json)
      : identifier = json['identifier'] as String,
        answer = json['Answer'] as String;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['identifier'] = identifier;
    data['Answer'] = answer;
    return data;
  }
}

// id = json.id,
//         title = json['title'] as String,
//         imageUrl = json['image_url'] as String,
//         description = json['Description'] as String,
//         timeSeconds = json['time_seconds'],
//         questionCount = json['question_count'] as int,
//         questions = [];

// id = json.data()?['id'] ?? '',
//         title = json.data()?['title'] ?? '',
//         imageUrl = json.data()?['image_url'] ?? '',
//         description = json.data()?['Description'] ?? '',
//         timeSeconds = json.data()?['time_seconds'] ?? '',
//         questionCount = json.data()?['question_count'] ?? '',
//         questions = [];
