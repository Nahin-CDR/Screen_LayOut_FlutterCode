import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:navigator/codeforces/rating_changes.dart';
class SetReminder extends StatefulWidget {
  const SetReminder({Key? key}) : super(key: key);
  @override
  State<SetReminder>createState()=>_SetReminderState();
}

List? listResponse;
Map? mapResponse;
String? lastContest = "";
int? time = -1;
int? Totalhours = -1;
double hours = -1;
double minutes = -1;
int days = 0;
int sec = 0;
int temp = 0;
double seconds = 0;
double rem1 = 0;
double rem2 = 0;
String? tempTime;

class _SetReminderState extends State<SetReminder>{


  final url = "https://codeforces.com/api/contest.list?gym=false";
  Future ApiCall() async{
    http.Response response;
    response = await http.get(Uri.parse(url));
    print("Status Code : ${response.statusCode}");

    if(response.statusCode == 200){
      setState(() {
        mapResponse = json.decode(response.body);
        listResponse = mapResponse!['result'];
        listResponse?.forEach((element) {
          if(element['phase'].toString() == "BEFORE"){
            tempTime = element['relativeTimeSeconds'].toString();
            lastContest = element['name'].toString();
           // print(tempTime);
          }});
      });
    }else{
      print("Error");
    }

    time = int.parse(tempTime!);
    time = time!*(-1);
    sec = time!;
  }
  int sec = 50;
  int period = 0;
  int h = 0;
  int m = 0;
  int s = 0;
  void startCountDown(){
    Timer.periodic(Duration(seconds:1), (timer) {
      if(sec > 0){
        setState(() {

          hours =sec/3600.round();
          h = hours.toInt();
          rem1 = sec%3600; //remaining seconds after taking hour
          minutes = rem1/60.round();
          m =  minutes.toInt();
          rem2 = rem1%60;
          seconds = rem2;
          s = seconds.toInt();

          sec--;
        });
      }else {
        timer.cancel();
      }
    });
  }
  //call this ApiCall() method at first when u come to this page
  @override
  void initState() {
    // TODO: implement initState
    //code for timer
    ApiCall();
    startCountDown();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        title: const Text("Upcoming Contest"),
      ),
      body: ListView(
        children: [
          //Time remaining
          Container(
            margin: EdgeInsets.all(20),
              child: Center(
                child: Text("${h.toString()} : ${m.toString()} : ${s.toString()}",
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold
                  ),
                ),
              )
          ),
          //Contest Name
          Container(
            padding: const EdgeInsets.all(15.00),
            margin: const EdgeInsets.all(15.00),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.00),
              color: Colors.green,
            ),
            child: Center(
                child: Text("$lastContest",
                    style: const TextStyle(fontSize: 20.00,color: Colors.white))
            ),
          ),
          //remaining days
          Container(
            padding: const EdgeInsets.all(15.00),
            margin: const EdgeInsets.all(15.00),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.00),
              color: Colors.white,
            ),
            child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Set Reminder ",
                        style: TextStyle(fontSize: 20.00)),
                    Icon(
                      Icons.alarm
                    )
                  ],
                )
            ),
          ),

        ],
      )
    );
  }
}
