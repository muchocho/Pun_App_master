

import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{
  Future<void> addQuizData(Map quizData, String quizid)async{
    await Firestore.instance.collection("quiz").document(quizid).setData(quizData).catchError((e){print(e.toString());
    });
  }


  Future<void> addQuestionData(Map questionData, String quizid)async{
    await Firestore.instance.collection("quiz").document(quizid).collection("QuestionsAndAnswer").add(questionData).catchError((e){
      print(e.toString());
    });
  }

  getQuizData() async{
    return await Firestore.instance.collection("quiz").snapshots();
  }



  getQuizesData(String quizid) async {
    return await Firestore.instance.collection("quiz").document(quizid).collection("QuestionsAndAnswer").getDocuments();
  }

}