

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pun_app_master0001/models/questionModel.dart';
import 'package:pun_app_master0001/views/database.dart';
import 'package:pun_app_master0001/views/results.dart';
import 'package:pun_app_master0001/widgets/playquizWidget.dart';
import 'package:pun_app_master0001/widgets/widget.dart';

class PlayQuiz extends StatefulWidget {
  final String quizid;
  PlayQuiz({@required this.quizid});

  @override
  _PlayQuizState createState() => _PlayQuizState();
}

int total =0;
int _correct = 0;
int _incorrect = 0;
int _notAttempted = 0;

class _PlayQuizState extends State<PlayQuiz> {
  

  DatabaseService databaseService = new DatabaseService();
  QuerySnapshot questionsSnapshot;
  final barColor = const Color(0xFFFFA3A3);

  QuestionModel getQuestionModelFromDatasnapshot(
    DocumentSnapshot questionSnapshot){
    QuestionModel questionModel = new QuestionModel();

    questionModel.question = questionSnapshot.data["question"];

    List<String> options = [
      questionSnapshot.data["option1"],
      questionSnapshot.data["option2"],
      questionSnapshot.data["option3"],
      questionSnapshot.data["option4"],

    ];

  options.shuffle();

    questionModel.option1 = options[0];
    questionModel.option2 = options[1];
    questionModel.option3 = options[2];
    questionModel.option4 = options[3];
    questionModel.correctOption = questionSnapshot.data["option1"];
    questionModel.answered = false;
  return questionModel;
  
  }

  @override
  void initState() {
    print("${widget.quizid}");
    databaseService.getQuizesData(widget.quizid).then((value){
      questionsSnapshot = value;
      _notAttempted = 0;
      _correct = 0;
      _incorrect = 0;
      total = questionsSnapshot.documents.length;

      print("$total this is total");
      setState(() {
        
      });
    });
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBar(context),
         backgroundColor: barColor,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Color(0xFF32464B)
        ),
        brightness: Brightness. light,
      ),

      body: Container(
        child: SingleChildScrollView(
                  child: Column(
            children: [
              questionsSnapshot == null ?
              Container(
                child: Center(child: CircularProgressIndicator(),),
              ):
              ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 24),
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemCount: questionsSnapshot.documents.length,
                itemBuilder: (context, index){
                  return QuizPlayTile(
                    questionModel: getQuestionModelFromDatasnapshot(
                      questionsSnapshot.documents[index]
                    ),
                    index: index,
                  );
                }
              )
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.check,color: Color(0xFFFFA3A3)),
         backgroundColor: Color(0xFF32464B),
        onPressed: (){
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) => Results(
            correctAns: _correct,
            incorrect: _incorrect,
            total: total,
          )
          ));
        },
      ),
    );
  }
}


class QuizPlayTile extends StatefulWidget {
  final QuestionModel questionModel;
  final int index;
  QuizPlayTile({@required this.questionModel,@required this.index}); 
  @override
  _QuizPlayTileState createState() => _QuizPlayTileState();
}

class _QuizPlayTileState extends State<QuizPlayTile> {
  
  String optionSelected = "";
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [  
          SizedBox(height: 10,),
          Text("Q${widget.index+1}) ${widget.questionModel.question}", style: TextStyle(fontSize: 19, color: Colors.black87),),
          
          SizedBox(height: 15,),
          GestureDetector( onTap: (){
            if(!widget.questionModel.answered){
              if(widget.questionModel.option1 == widget.questionModel.correctOption){
                optionSelected = widget.questionModel.option1;
                widget.questionModel.answered = true;
                _correct = _correct + 1;
                _notAttempted = _notAttempted - 1;
                setState(() {
                  
                });
              }else{
                optionSelected = widget.questionModel.option1;
                widget.questionModel.answered = true;
                _incorrect = _incorrect + 1;
                _notAttempted = _notAttempted - 1;
                setState(() {
                  
                });
              }
            }
          },
                      child: OptionTile(
              option: "A", 
              description: widget.questionModel.option1, 
              correctAnsweer: widget.questionModel.correctOption, 
              optionSelected: optionSelected
              ),
          ),
            SizedBox(height: 15,),
          
          GestureDetector( onTap: (){
            if(!widget.questionModel.answered){
              if(widget.questionModel.option2 == widget.questionModel.correctOption){
                optionSelected = widget.questionModel.option2;
                widget.questionModel.answered = true;
                _correct = _correct + 1;
                _notAttempted = _notAttempted - 1;
                setState(() {
                  
                });
              }else{
                optionSelected = widget.questionModel.option2;
                widget.questionModel.answered = true;
                _incorrect = _incorrect + 1;
                _notAttempted = _notAttempted - 1;
                setState(() {
                  
                });
              }
            }
          },
                      child: OptionTile(
              option: "B", 
              description: widget.questionModel.option2, 
              correctAnsweer: widget.questionModel.correctOption, 
              optionSelected: optionSelected
              ),
          ),
            SizedBox(height: 15,),
          
          GestureDetector( onTap: (){
            if(!widget.questionModel.answered){
              if(widget.questionModel.option3 == widget.questionModel.correctOption){
                optionSelected = widget.questionModel.option3;
                widget.questionModel.answered = true;
                _correct = _correct + 1;
                _notAttempted = _notAttempted - 1;
                setState(() {
                  
                });
              }else{
                optionSelected = widget.questionModel.option3;
                widget.questionModel.answered = true;
                _incorrect = _incorrect + 1;
                _notAttempted = _notAttempted - 1;
                setState(() {
                  
                });
              }
            }
          },
                      child: OptionTile(
              option: "C", 
              description: widget.questionModel.option3, 
              correctAnsweer: widget.questionModel.correctOption, 
              optionSelected: optionSelected
              ),
          ),
            SizedBox(height: 15,),
          
          GestureDetector( onTap: (){
            if(!widget.questionModel.answered){
              if(widget.questionModel.option4 == widget.questionModel.correctOption){
                optionSelected = widget.questionModel.option4;
                widget.questionModel.answered = true;
                _correct = _correct + 1;
                _notAttempted = _notAttempted - 1;
                setState(() {
                  
                });
              }else{
                optionSelected = widget.questionModel.option4;
                widget.questionModel.answered = true;
                _incorrect = _incorrect + 1;
                _notAttempted = _notAttempted - 1;
                setState(() {
                  
                });
              }
            }
          },
                      child: OptionTile(
              option: "D", 
              description: widget.questionModel.option4, 
              correctAnsweer: widget.questionModel.correctOption, 
              optionSelected: optionSelected
              ),
          ),
          SizedBox(height: 20,)
        ],
      ),
    );
  }
}
