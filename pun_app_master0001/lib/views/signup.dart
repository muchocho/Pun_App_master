import 'package:flutter/material.dart';
import 'package:pun_app_master0001/views/signin.dart';
import 'package:pun_app_master0001/views/auth.dart';
import 'package:pun_app_master0001/helper/functions.dart';


class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
   final barColor = const Color(0xFFFFA3A3);
  final _formKey = GlobalKey<FormState>();
  String email = '', password = '', name = '', emaill = '', pass = '';
  bool isLoading = false;

  AuthService _authService = new AuthService();
  signUp()async{
     if(_formKey.currentState.validate()){
       setState(() {
         isLoading = true;
       });
       _authService.singUpWithEmailAndPass(emaill, pass).then((value){
         if(value != null){
           setState(() {
         isLoading = false;
       });
       HelperFunctions.saveUserLoggedInDetails(isLoggedin: true);
           Navigator.pushReplacement(context, MaterialPageRoute(
             builder: (context) => SignIn()
           ));
         }
       });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
  
      body: isLoading ? Container(
        child: Center(child: CircularProgressIndicator(),),
      ) : Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          color: Color(0xFFFFA3A3),
        child: Column(children: [
          
          Spacer(),

          TextFormField(
            validator: (val){return val.isEmpty ? "Enter you name!" : null; },
            decoration: InputDecoration(
              hintText: "Name" ,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.all(Radius.circular(30))
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF32464B)),
                borderRadius: BorderRadius.all(Radius.circular(30))
              ),
              prefixIcon: Icon(Icons.person, color: Color(0xFF32464B)),
              filled: true,
              fillColor: Colors.white
            ),
            onChanged: (val){
              name = val;
            },
          ),
          
          SizedBox(height: 6,),
          
          TextFormField(
            validator: (val){return val.isEmpty ? "Enter Email" : null; },
            decoration: InputDecoration(
              hintText: "Email" ,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.all(Radius.circular(30))
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF32464B)),
                borderRadius: BorderRadius.all(Radius.circular(30))
              ),
              prefixIcon: Icon(Icons.email, color: Color(0xFF32464B)),
              filled: true,
              fillColor: Colors.white
            ),
            onChanged: (val){
              emaill = val;
            },
          ),
          
          
          SizedBox(height: 6,),
          
          
          TextFormField(
            validator: (val){return val.isEmpty ? "Enter Password" : null; },
            decoration: InputDecoration(
              hintText: "Password",
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.all(Radius.circular(30))
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF32464B)),
                borderRadius: BorderRadius.all(Radius.circular(30))
              ),
              prefixIcon: Icon(Icons.lock, color: Color(0xFF32464B)),
              filled: true,
              fillColor: Colors.white
            ),
            onChanged: (val){
              pass = val;
            },obscureText: true,
          ),

             SizedBox(height: 14,),
             
             GestureDetector(
               onTap: (){
                signUp();
               },
               child: Container(
               padding: EdgeInsets.symmetric(vertical: 16),
               decoration: BoxDecoration(
                 color: Color(0xFF32464B),
                 borderRadius: BorderRadius.circular(38)
               ),
               alignment: Alignment.center,
               width: MediaQuery.of(context).size.width - 48,
               child: Text("Sign Up", style: TextStyle(color: Colors.white, fontSize: 16, fontFamily: 'Roboto', fontWeight: FontWeight.w700),),
             ),
             ),
             
              
              
              SizedBox(height: 18,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?  ", style: TextStyle(fontSize: 15)),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) => SignIn()
                      ));
                    },
                    child: Text("Sign In", style: TextStyle(fontSize: 16, decoration: TextDecoration.underline))
                  ),
                ],
              ),

             SizedBox(height: 30,),
        ],),
      ),
      )
    );
  }
}