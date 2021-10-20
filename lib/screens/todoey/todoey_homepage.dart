import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firstproject/screens/global/global.dart';
import 'package:firstproject/utils/colors.dart';
import 'package:flutter/material.dart';


class toDoEyHome extends StatefulWidget {
  static String route = "toDoeyHome";


  @override
  _toDoEyHomeState createState() => _toDoEyHomeState();
}

class _toDoEyHomeState extends State<toDoEyHome> {



  bool value = false;

  TextEditingController addTaskController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [

            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: MyColors.blue,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height*0.1,),
                    Container(decoration: BoxDecoration(
                      shape: BoxShape.circle,color: MyColors.white
                    ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Icon(Icons.list,color: MyColors.blue,),
                        )),

                    SizedBox(height: 20,),
                    Text("Todoey",style: TextStyle(color: MyColors.white,fontSize: 40,fontWeight: FontWeight.bold),)
                    ,Text("12 Tasks",style: TextStyle(color: MyColors.white,fontSize: 17),)

                  ],
                ),
              ),
            ),
            Positioned(
              top: 250,
              bottom: 0,
              child: Container(
                // height: 420,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50))
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal:20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [


                      Expanded(
                        child: StreamBuilder(
                          stream: FirebaseFirestore.instance.collection('Data').snapshots(),
                          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (!snapshot.hasData) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }

                            return ListView(
                              children: snapshot.data.docs.map((document) {
                                return Row(
                                  children: [
                                    Container(width: 200,
                                      child: Center(child: Text(document['text'])),

                                    ),
                                    Checkbox(
                                      value: this.value,
                                      onChanged: (bool value) {
                                        setState(() {
                                          this.value = value;
                                        });
                                      },
                                    ),
                                  ],
                                );
                              }).toList(),
                            );
                          },
                        ),
                      ),



                    ],
                  ),
                ),
              ),
            ),


            Positioned(top: 0,
              bottom: 50,right: 50,
              child: Align(alignment: Alignment.bottomRight,
                child: GestureDetector(
                  onTap: (){

                    showModalBottomSheet<void>(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          decoration: BoxDecoration(
                            color: MyColors.white,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(30.0),
                              topRight: Radius.circular(30.0),
                            ),

                          ),
                          height: 500,

                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(30.0),
                                  child:  TextField(
                                   controller: addTaskController,
                                    decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.blue),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color:Colors.blue),
                                      ),
                                      hintText: "Add Task"
                                  ),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 30),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: ElevatedButton(
                                          child: const Text('Add'),
                                          onPressed: () {

                                            FirebaseFirestore.instance
                                                .collection('Data')
                                                .add({'text': addTaskController.text.toString()});
                                            globalData.saveTaskValue = addTaskController.text;
                                            setState(() {

                                            });
                                            Navigator.pop(context);
                            addTaskController.clear();
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );

                  },
                  child: Container(decoration: BoxDecoration(
                    color: MyColors.blue,
                    shape: BoxShape.circle
                  ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Icon(Icons.add,color: MyColors.white,),
                      )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
