import 'package:flutter/material.dart';
import 'package:pun_app_master0001/widgets/widget.dart';
import 'package:pun_app_master0001/views/database.dart';
class Questions extends StatefulWidget {
  final String quizid;
  Questions(this.quizid);
  @override
  _QuestionsState createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {

   final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  String quest, opt1, opt2, opt3, opt4;
  final barColor = const Color(0xFFFFA3A3);
  DatabaseService databaseService = new DatabaseService();

  publishQuest()async{
    if(_formKey.currentState.validate()){
      
      setState(() {
        isLoading = true;
      });
      
      Map<String,String> questionMap={
        "question" : quest,
        "option1" : opt1,
        "option2" : opt2,
        "option3" : opt3,
        "option4" : opt4,
      };
    await databaseService.addQuestionData(questionMap, widget.quizid).then((value){
      setState(() {
          isLoading = false;
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
            
            new TextFormField(
              validator: (val){return val.isEmpty ? "Enter Question" : null; },
              decoration: InputDecoration(
                hintText: "Question" ,
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
                quest = val;
              }, maxLines: 50,
            ),
            SizedBox(height: 6,),
            TextFormField(
              validator: (val){return val.isEmpty ? "Enter Option1 (Correct Answer)" : null; },
              decoration: InputDecoration(
                hintText: "Option1 (Correct Answer)",
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
                opt1 = val;
              }
            ),
            SizedBox(height: 6,),
            TextFormField(
              validator: (val){return val.isEmpty ? "Enter Option2" : null; },
              decoration: InputDecoration(
                hintText: "Option2",
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
                opt2 = val;
              }
            ),
            SizedBox(height: 6,),
            TextFormField(
              validator: (val){return val.isEmpty ? "Enter Option3" : null; },
              decoration: InputDecoration(
                hintText: "Option3",
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
                opt3 = val;
              }
            ),
            SizedBox(height: 6,),
            TextFormField(
              validator: (val){return val.isEmpty ? "Enter Option4" : null; },
              decoration: InputDecoration(
                hintText: "Option4",
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
                opt4 = val;
              }
            ),

               SizedBox(height: 14,),
               
              GestureDetector(onTap: (){
              publishQuest();
              },
              child: Container(  
                 padding: EdgeInsets.symmetric(vertical: 16),
                 decoration: BoxDecoration(
                   color: Color(0xFF32464B),
                   borderRadius: BorderRadius.circular(38)
                 ),
                 alignment: Alignment.center,
                 width: MediaQuery.of(context).size.width - 48,
                 child: Text("Another Question", style: TextStyle(color: Colors.white, fontSize: 16, fontFamily: 'Roboto', fontWeight: FontWeight.w700),),
               ),
              ),

               SizedBox(height: 14,),
               
              GestureDetector(onTap: (){
                Navigator.pop(context);
              },
              child: Container(  
                 padding: EdgeInsets.symmetric(vertical: 16),
                 decoration: BoxDecoration(
                   color: Color(0xFF48646C),
                   borderRadius: BorderRadius.circular(38)
                 ),
                 alignment: Alignment.center,
                 width: MediaQuery.of(context).size.width - 48,
                 child: Text("Done", style: TextStyle(color: Colors.white, fontSize: 16, fontFamily: 'Roboto', fontWeight: FontWeight.w700),),
               ),
              ),

               SizedBox(height: 80,),
          ],),
        ),
      ),
      )
    );
  }
}