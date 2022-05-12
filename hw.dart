
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'menus.dart';

class Demo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InfoPage(),
    );
  }

}

class InfoPage extends StatefulWidget {
  const InfoPage({Key? key}) : super(key: key);
  @override
  State<InfoPage> createState() => _InfoPageState();
}

String name = "abc";
class _InfoPageState extends State<InfoPage> {
  TextEditingController userName = TextEditingController();
  TextEditingController passWord = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Flexible(
              flex: 2,
                child:   Padding(

                  padding: const EdgeInsets.all(1.0),
                  child: TextField(
                    controller: userName,
                    decoration: InputDecoration(
                      hintText: "user name here",
                      hintStyle: TextStyle(fontSize: 10.0),
                      labelText: "user handle",
                      labelStyle: TextStyle(color: Colors.deepOrange),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      suffixIcon: Icon(Icons.abc_outlined),
                    ),
                    autofocus: true,
                    keyboardType: TextInputType.name,
                    maxLength: 20,
                  ),
                ),
            ),
            Flexible(
              flex: 2,
              child:   Padding(
                padding: const EdgeInsets.all(1.0),
                child: TextField(
                controller: passWord,
                decoration: InputDecoration(
                  hintText: "password here",
                  hintStyle: TextStyle(fontSize: 10.0),
                  labelText: "user Pass",
                  labelStyle: TextStyle(color: Colors.deepOrange),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  suffixIcon: Icon(Icons.abc_outlined),
                ),
                autofocus: true,
                keyboardType: TextInputType.name,
                maxLength: 20,
              ),
            ),),
            Flexible(
                flex: 1,
                child:  Container(
                  height: 50, width: 150,
                  child: ElevatedButton(
                      onPressed: (){
                        if(userName.text == "nahin" && passWord.text == "123"){
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return MENUS();
                          }));
                        }else{
                       showCupertinoDialog(context: context, builder: (context){
                         return  AlertDialog(
                           title: const Text('Information Mismatched !'),
                           content: SingleChildScrollView(
                             child: ListBody(
                               children: const <Widget>[
                                 Text('given user name or password is incorrect'),
                                 Text('please be careful!'),
                               ],
                             ),
                           ),
                           actions: <Widget>[
                             TextButton(
                               child: const Text('Try again'),
                               onPressed: () {
                                 Navigator.of(context).pop();
                               },
                             ),
                           ],
                         );

                       });
                    }},
                      child: Text("Login")
              ),
            ))
          ],
        ),
      ),
    );
  }
}
