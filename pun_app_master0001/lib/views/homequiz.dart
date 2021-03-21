import 'package:flutter/material.dart';
import 'package:pun_app_master0001/views/database.dart';
import 'package:pun_app_master0001/views/quiz.dart';
import 'package:pun_app_master0001/widgets/widget.dart';
import 'package:pun_app_master0001/views/playquiz.dart';
class QuizMaker extends StatefulWidget {
  @override
  _QuizMakerState createState() => _QuizMakerState();
}

class _QuizMakerState extends State<QuizMaker> {
  final barColor = const Color(0xFFFFA3A3);
  Stream quizStream;
  DatabaseService databaseService = new DatabaseService();

  Widget quizList(){
    
    return Container(
      
      margin: EdgeInsets.symmetric(horizontal: 24),
      child: StreamBuilder(
        stream: quizStream,
        builder: (context, snapshot){
          return snapshot.data == null ? Container(): ListView.builder(
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index){
            return QuizTile(
              imgURL: snapshot.data.documents[index].data["imgURL"],
              title: snapshot.data.documents[index].data["quizTitle"],
              desc: snapshot.data.documents[index].data["quizDescription"],
              quizid: snapshot.data.documents[index].data["quizId"]
            );
          });
        },
      ),
    );
  }
  
  @override
  void initState() {
    databaseService.getQuizData().then((val){
      setState(() {
        quizStream = val;
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
        brightness: Brightness. light,
      ),

      
      body: 
      quizList(
        
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add,color: Color(0xFFFFA3A3)),
        backgroundColor: Color(0xFF32464B),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => Quiz()
          ));
        },
      ),
    );
  }
}




class QuizTile extends StatelessWidget {
  final String title;
  final String desc;
  final String imgURL;
  final String quizid;
  QuizTile({@required this.title,@required this.desc,@required this.imgURL,@required this.quizid});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => PlayQuiz(
            quizid: quizid,
          )
        ));
      },
          child: Container(
        margin: EdgeInsets.only(top: 8),
        height: 150,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(imgURL, width: MediaQuery.of(context).size.width - 48, fit: BoxFit.cover,)
              ),
            Container(

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              color: Color(0xFFFFA3A3),),
              
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text(title, style: TextStyle(color: Color(0xFF32464B), fontSize: 17, fontWeight: FontWeight.w700)),
                Text(desc, style: TextStyle(color: Color(0xFF32464B), fontSize: 14, fontWeight: FontWeight.w700))
              ],
              ),
            ),
          ],
        ),
      ),
    ); 
  }
}