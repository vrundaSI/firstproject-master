import 'package:firebase_auth/firebase_auth.dart';
import 'package:firstproject/custom_widgets/custom_button.dart';
import 'package:firstproject/custom_widgets/custom_textfield.dart';
import 'package:firstproject/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:firstproject/screens/todoey/todoey_homepage.dart';




class SignUp extends StatefulWidget {
  static String route = "SignUp";

  const SignUp({Key key}) : super(key: key);


  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Stack(
            children: [

              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: MyColors.blue,
              ),
              Positioned(
                top: 195,
                bottom: 0,
                child: Container(
                  // height: 420,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50))
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal:20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: MediaQuery.of(context).size.height*0.1,),
                        Column(mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Text("SignIn to Project",style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold
                            ),),
                            SizedBox(height: 5,),
                            Text("Please Enter Your Credentials",style: TextStyle(
                                fontSize: 14,
                            ),),
                          ],
                        ),
                        const Spacer(),
                        CustomTextField(isValue: false,
                          title:" ",
                          controller: emailController,
                          hintText: "Your Email",

 obSecure: false,                         keyboardType: TextInputType.text,
                        ),
                        const SizedBox(height: 10,),
                        CustomTextField(isValue: false,
                          title:" ",
                          obSecure: true,
                          controller: passwordController,
                          hintText: "Your Password",

                          keyboardType: TextInputType.text,
                        ),

                        SizedBox(height: MediaQuery.of(context).size.height*0.1,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CustomButton(
                             icon: Icons.forward_outlined,
                              onClick: () async{

                                Navigator.of(context).pushNamed(ToDoEyHome.route);
                              },
                            ),
                          ],
                        ),
                        const Spacer(),

                        const SizedBox(height: 15,)

                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
