import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'homescreen.dart';
import 'signup.dart';





class FirstScreen extends StatefulWidget {
  

   @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final _formKey=GlobalKey<FormState>();
  final namecontroller=TextEditingController() ;
  final passcontroller=TextEditingController();
  String name,pass;

 @override
 void initState(){
   super.initState();

 }
 void getDetails() async{
  SharedPreferences prefs=await SharedPreferences.getInstance();
  name=prefs.getString("user");
  pass=prefs.getString("pass");

 }
  
  bool _secureText=true;

  void toggle(){
    setState(() {
      _secureText=!_secureText;
    });

  }
  





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
          body: Center(
        child:Form(
          key: _formKey,
          child:Center(
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              

              children:<Widget>[
                Container(
                  height:100.0,
                  width:double.infinity,
                  
                  
                  child: Text("Welcome to Task App",style: TextStyle(
                    fontSize:40.0,
                    fontFamily:'Schyler',
                    fontWeight:FontWeight.bold,
                    foreground: Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = 6
            ..color = Colors.blue[700],


                  ),),
                ),
                SizedBox(
                  height: 50.0,
                ),

                TextFormField(
                  controller:namecontroller ,           
                  
                  
                  validator:(value){
                    if(value.isEmpty && value==name){
                      return "Enter your Username";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText:"Enter Username",
                    border: const OutlineInputBorder(),
                    icon: const Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: const Icon(Icons.lock)),
                  ) ,
                ),
                SizedBox(
                  height: 40.0,
                ),
                TextFormField(
                  controller: passcontroller,                 
                  
                  decoration: InputDecoration(
                    hintText:"Enter Password",
                    border: const OutlineInputBorder(),
                    icon: const Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: const Icon(Icons.lock)),
                    
                  ) ,
                   validator: (val) => val.length < 6 ? 'Password too short.' : null,
                  
                  obscureText: _secureText,
                ),
                SizedBox(
                  height: 50.0,

                ),
                RaisedButton(onPressed: (){                


                  if(_formKey.currentState.validate()){
                  
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>
                  HomeScreen()));
                  }
                  else{
                    SnackBar(content: 
                    Text("Inavlid Credentials"));
                  }

                },
                elevation: 10.0,
                child: Text("Sign In"),
                color: Colors.redAccent,),
                SizedBox(
                  height:50.0
                ),
                RaisedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>
                  SignUp()));
                },
                child:Text("Sign Up"),
                color:Colors.limeAccent)

              ]
            ),
          )
           ),

      ),
    );
  }
}