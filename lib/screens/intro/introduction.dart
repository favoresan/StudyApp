import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_app/widgets/cirlce_btn.dart';

import '../../configs/theme/app_colors.dart';
import '../../firebase_ref/references.dart';
import '../../loading_status.dart';
import '../../model/question_model.dart';
import '../../resources/provider.dart';
import '../../resources/route_manager.dart';
import '../../services/firebase_storage.dart';

class IntroScreen extends ConsumerStatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends ConsumerState<IntroScreen> {
  @override
  void initState() {
    uploadData();
    getAllPapers();
    super.initState();
  }

  var fireStore = FirebaseFirestore.instance;

  var loadingStatus = LoadingStatus.loading;

  Future<void> uploadData() async {
    loadingStatus = LoadingStatus.loading;

    final manifestContent =
        await DefaultAssetBundle.of(context).loadString('AssetManifest.json');
    final Map<String, dynamic> manifestMap = jsonDecode(manifestContent);
    final papersInAssets = manifestMap.keys
        .where((path) =>
            path.startsWith('assets/DB/papers') && path.contains('.json'))
        .toList();
    List<Subject> questionPapers = [];
    for (var paper in papersInAssets) {
      String stringPaperContent = await rootBundle.loadString(paper);
      questionPapers.add(Subject.fromJson(jsonDecode(stringPaperContent)));
    }
    var batch = fireStore.batch();
    for (var paper in questionPapers) {
      batch.set(qPReference.doc(paper.id), {
        'title': paper.title,
        'img_url': paper.imageUrl,
        'description': paper.description,
        'time_sec': paper.timeSeconds,
        'questions_count':
            paper.questions == null ? 0 : paper.questions?.length,
      });
      for (var question in paper.questions!) {
        final questionPath =
            questionRef(paperId: paper.id, questionId: question.id);
        batch.set(questionPath, {
          'question': question.question,
          'correct_ans': question.correctAnswer,
        });
        for (var ans in question.answers) {
          batch.set(
              questionPath.collection('answers').doc(
                    ans.identifier,
                  ),
              {'identifier': ans.identifier, 'answer': ans.answer});
        }
      }
    }

    await batch.commit();
    loadingStatus = LoadingStatus.completed;
  }

  Future<void> getAllPapers() async {
    // List<String> imgName = ['maths', "biology", 'chemistry', 'physics'];
    try {
      QuerySnapshot<Map<String, dynamic>> data = await qPReference.get();
      // print(data);
      final paperList = data.docs.map((e) => Subject.fromSnapshot(e)).toList();
      // print(paperList);
      allPaper = List.from(paperList);
      for (var paper in paperList) {
        // print(paper.timeSeconds);
        final imgUrl = await getImg(paper.title);
        int timeMin = (paper.timeSeconds / 60).ceil();
        paper.timeSeconds = timeMin;
        paper.imageUrl = imgUrl;
      }
      allPaper = List.from(paperList);
      ref.read(subjectListProvider.notifier).state = List.from(allPaper);
    } catch (e) {
      print(e);
    }
  }

  List<String> images = [];
  List<Subject> allPaper = [];

  late FirebaseAuth _auth;
  User? user = FirebaseAuth.instance.currentUser;
  late Stream<User?> _authStateChanges;

  startDelay() async {
    _auth = FirebaseAuth.instance;
    _authStateChanges = _auth.authStateChanges();
    _authStateChanges.listen((User? users) {
      user = users;
    });
    await Future.delayed(Duration(seconds: 2));
    Navigator.pushReplacementNamed(context, Routes.mainRoute);
  }

  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: mainGradient(context),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: query.width * 0.2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.star,
                size: 65,
              ),
              SizedBox(
                height: 40,
              ),
              const Text(
                'This is a study app. You can use it as you want. If you understand how this works, you would be abel to scale it.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              CircleBtn(
                child: const Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                  size: 35,
                ),
                function: () async {
                  startDelay();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
