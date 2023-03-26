import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CompleteProfile extends StatefulWidget {
  CompleteProfile({Key? key}) : super(key: key);

  @override
  State<CompleteProfile> createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title:  Text("Complete Profile" , style: GoogleFonts.lato(fontSize: 25),),
        
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: ListView(
            children:  [
              const SizedBox(height: 20,),
              
              CupertinoButton(
                onPressed: (){},

                child: const CircleAvatar(
                  backgroundColor: Colors.deepPurpleAccent,
                  radius: 60,
                  child: Icon(Icons.person,size: 60,color: Colors.black87,),
                ),               
              ),

              const TextField(
                decoration: InputDecoration(labelText: "Full Name"),
              ),
               const SizedBox(height: 20,),

              CupertinoButton(
                onPressed: (){},
                color: Colors.deepPurpleAccent,
                child: const Text("Create Account"),
              
              )
            ],
          ),
        ),
      )
    );
  }
}