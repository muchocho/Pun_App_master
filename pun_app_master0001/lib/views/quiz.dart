import 'package:flutter/material.dart';
import 'package:pun_app_master0001/views/database.dart';
import 'package:pun_app_master0001/views/makequest.dart';
import 'package:random_string/random_string.dart';
import 'package:pun_app_master0001/widgets/widget.dart';

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {

  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  String quizname, quizdes, quizid, imgURL;
  final barColor = const Color(0xFFFFA3A3);
  DatabaseService databaseService = new DatabaseService();

  publish()async{
    if(_formKey.currentState.validate()){
      
      setState(() {
        isLoading = true;
      });

      quizid = randomAlphaNumeric(16);
      Map<String,String> quizMap = {
        "imgURL" : imgURL,
        "quizId" : quizid,
        "quizTitle" : quizname,
        "quizDescription" : quizdes
      };
      await databaseService.addQuizData(quizMap, quizid).then((value){
        setState(() {
          isLoading = false;
          Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) => Questions(quizid)
          ));
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBar(context),
        backgroundColor: barColor,
        elevation: 0.0,
        brightness: Brightness. light,
      ),
    
    
      body: isLoading ? Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ) : Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          color: Color(0xFFFFA3A3),
        child: SingleChildScrollView(
                  child: Column(children: [
            
            TextFormField(
              validator: (val){return val.isEmpty ? "Enter Image URL" : null; },
              decoration: InputDecoration(
                hintText: "Image URL" ,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.all(Radius.circular(30))
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF32464B)),
                  borderRadius: BorderRadius.all(Radius.circular(30))
                ),
                
                filled: true,
                fillColor: Colors.white
              ),
              onChanged: (val){
                imgURL = val;
              },
            ),
            SizedBox(height: 6,),
            TextFormField(
              validator: (val){return val.isEmpty ? "Enter Quiz Title" : null; },
              decoration: InputDecoration(
                hintText: "Quiz Title" ,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.all(Radius.circular(30))
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF32464B)),
                  borderRadius: BorderRadius.all(Radius.circular(30))
                ),
                
                filled: true,
                fillColor: Colors.white
              ),
              onChanged: (val){
                quizname = val;
              },
            ),
            SizedBox(height: 6,),
            TextFormField(
              validator: (val){return val.isEmpty ? "Enter Quiz Description" : null; },
              decoration: InputDecoration(
                hintText: "Quiz Description",
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.all(Radius.circular(30))
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF32464B)),
                  borderRadius: BorderRadius.all(Radius.circular(30))
                ),
               
                filled: true,
                fillColor: Colors.white
              ),
              onChanged: (val){
                quizdes = val;
              }
            ),

               SizedBox(height: 50,),
               
              GestureDetector(onTap: (){
                publish();
              },
              child: Container(  
                 padding: EdgeInsets.symmetric(vertical: 16),
                 decoration: BoxDecoration(
                   color: Color(0xFF32464B),
                   borderRadius: BorderRadius.circular(38)
                 ),
                 alignment: Alignment.center,
                 width: MediaQuery.of(context).size.width - 48,
                 child: Text("Publish", style: TextStyle(color: Colors.white, fontSize: 16, fontFamily: 'Roboto', fontWeight: FontWeight.w700),),
               ),
              ),

               

               SizedBox(height: 300,),
          ],),
        ),
      ),
      )
    );
  }
}