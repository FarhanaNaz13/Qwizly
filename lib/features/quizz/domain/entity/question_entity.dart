import 'package:equatable/equatable.dart';

class QuestionEntity extends Equatable {
  final int id;
  final String category;
  final String question;
  final List<String> options;
  final int answerIndex;

  const QuestionEntity({
    required this.id,
    required this.category,
    required this.question,
    required this.options,
    required this.answerIndex,
  });

  @override
  List<Object?> get props => [
        id,
        category,
        question,
        options,
        answerIndex,
      ];
}
