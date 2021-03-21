import 'package:flutter/material.dart';

class Results extends StatefulWidget {

  final int correctAns, incorrect, total;
  Results({@required this.correctAns, @required this.incorrect, @required this.total});
  @override
  _ResultsState createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("${widget.correctAns}/${widget.total}", style:  TextStyle(fontSize: 30),),
              SizedBox(height: 8,),
              Text("You answered ${widget.correctAns} answers correctly and ${widget.incorrect} answers incorrectly", style:  TextStyle(fontSize: 24, color: Colors.grey),
              textAlign: TextAlign.center,),
              SizedBox(height: 15,),
              
              GestureDetector(onTap: (){
              Navigator.pop(context);
            },
            child: Container(  
               padding: EdgeInsets.symmetric(vertical: 16),
               decoration: BoxDecoration(
                 color: Color(0xFF32464B),
                 borderRadius: BorderRadius.circular(38)
               ),
               alignment: Alignment.center,
               width: MediaQuery.of(context).size.width - 48,
               child: Text("Go to Home", style: TextStyle(color: Colors.white, fontSize: 16, fontFamily: 'Roboto', fontWeight: FontWeight.w700),),
             ),
            ),


            ],
          ),
        ),
      ),
    );
  }
}