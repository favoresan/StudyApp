import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/question_model.dart';
import 'functions.dart';

final subjectListProvider = StateProvider<List<Subject>>((ref) => []);
final nameProvider = StateProvider((ref) => user);
