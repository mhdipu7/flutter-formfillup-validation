import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatefulWidget{
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: HomeActivity(),);
  }
}

class HomeActivity extends StatefulWidget{
  HomeActivity({super.key});

  @override
  State<HomeActivity> createState() => _HomeActivityState();
}

class _HomeActivityState extends State<HomeActivity> {
  final _key = GlobalKey<FormState>();

  TextEditingController nameClt = TextEditingController();

  TextEditingController emailClt = TextEditingController();

  TextEditingController  passwordClt = TextEditingController();

  bool SecureText = true;

  final browncolor= Colors.brown;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:  AppBar(
        title: Text("Regestration"),
        backgroundColor: browncolor,
        elevation: 0,
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Container(
          margin:EdgeInsets.all(15),
          width: MediaQuery.of(context).size.width,
          child: Form(
            key: _key,
            child: Card(
              color: Colors.greenAccent,
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20,),
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: browncolor,
                      child: Icon(Icons.person,size: 40,),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[350],
                          borderRadius: BorderRadius.circular(10)
                      ),

                      child: TextFormField(
                        controller: nameClt,

                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter Your Name",
                            contentPadding: EdgeInsets.only(left: 15)

                        ),
                        validator: (value){
                          if (value!.isEmpty){
                            return "Empty Field";
                          }
                        },
                      ),
                    ),

                    SizedBox(height: 20,),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[350],
                          borderRadius: BorderRadius.circular(10)
                      ),

                      child: TextFormField(
                        controller: emailClt,

                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter Your Email",
                            contentPadding: EdgeInsets.only(left: 15)

                        ),
                        validator: (value){
                          if (value!.isEmpty){
                            return "Empty Field";
                          }
                        },
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[350],
                          borderRadius: BorderRadius.circular(10)
                      ),

                      child: TextFormField(
                        controller: passwordClt,
                        obscureText: SecureText,

                        decoration: InputDecoration(
                            suffixIcon: InkWell(
                                onTap: (){
                                  setState(() {
                                    SecureText =!SecureText;
                                  });
                                },
                                child: Icon(SecureText?Icons.remove_red_eye_outlined:   Icons.remove_red_eye,color:browncolor,)),
                            border: InputBorder.none,
                            hintText: "Enter Your password",
                            contentPadding: EdgeInsets.only(left: 15, top: 15)


                        ),
                        validator: (value){
                          if (value!.isEmpty){
                            return "Empty Field";
                          }
                        },
                      ),
                    ),

                    SizedBox(height: 30,),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(onPressed: (){
                        if(_key.currentState!.validate()){
                          _key.currentState!.save();
                          print(nameClt);
                          print(emailClt);
                          print(passwordClt);
                        }
                      },
                        style: ElevatedButton.styleFrom(backgroundColor: browncolor),

                        child: Text("Singin", style: TextStyle(fontSize: 20, color:Colors.white), ), ),
                    ),
                    SizedBox(height: 30,),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),


    );
  }
}

