
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

class UserStatistics extends StatefulWidget {
  const UserStatistics({Key? key}) : super(key: key);
  @override
  State<UserStatistics> createState() =>_UserStatisticsState();
}

String userName = "Nahin_junior71";
String problemCount = "50";
var bucket = new Map();

List? listResponse;
Map? mapResponse;
Map? accepted;
String? acLen = "-1";
String? totalAttempted = "-1";
String? total_rejected = "-1";




class _UserStatisticsState extends State<UserStatistics> {
  final url = "https://codeforces.com/api/user.status?handle=$userName";//&from=1&count=$problemCount";

  Future ApiCall() async{
    http.Response response;
    response = await http.get(Uri.parse(url));
    print(response.statusCode);
    if(response.statusCode == 200){
      setState(() {
        mapResponse = json.decode(response.body);
        listResponse = mapResponse!['result'];
        Set<String>uniqueCountAC = Set();
        Set<String>uniqueCountTotal = Set();
        listResponse?.forEach((element) {
          if(element['verdict'].toString() == "OK" ){
              String test = element['problem']['contestId'].toString() + element['problem']['name'].toString();
              uniqueCountAC.add(test);
              uniqueCountTotal.add(test);
          }else{
            String test = element['problem']['contestId'].toString() + element['problem']['name'].toString();
            uniqueCountTotal.add(test);
          }
        });
      int ac = uniqueCountAC.length;
      acLen = uniqueCountAC.length.toString();//myList.length;
      int total_attempted = uniqueCountTotal.length;
      int rejected = total_attempted-ac;
      totalAttempted = total_attempted.toString();
      total_rejected = rejected.toString();
      print("Total Accepted : $acLen");


      });
    }else{
      print("Error");
    }
  }

  //call this ApiCall() method at first when u come to this page
  @override
  void initState() {
    // TODO: implement initState
    ApiCall();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("User Statics"),
      ),
      body: Column(
        children: [
          Container(
              height: 80,
              width: MediaQuery.of(context).size.width-20,
              margin: const EdgeInsets.all(5.00),
              decoration: const BoxDecoration(

                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30.00),
                    topRight: Radius.circular(50.00),
                  )
              ),
              child: Center(
                  child : Row(
                    children: [
                      Text("         "),
                      Container(
                        child: acLen != "-1"?Text("Total Attempted : "+totalAttempted.toString()
                          ,style: TextStyle(
                            fontSize: 20.00,
                          ),
                        ):Text("Loading data.."),
                      )
                    ],
                  )
              )
          ),
          Container(
              height: 50,
              width: MediaQuery.of(context).size.width-20,
              margin: const EdgeInsets.all(10.00),
              decoration: const BoxDecoration(
                  color:Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30.00),
                    topRight: Radius.circular(50.00),
                  )
              ),
              child: Center(
                  child : Row(
                    children: [
                      Text("         "),
                      Image(image: AssetImage("images/ac.png"),
                        height: 24,
                        width: 24,
                      ),
                      Container(
                        child: acLen != "-1"?Text("  Accepted : "+acLen.toString()
                        ,style: TextStyle(
                            fontSize: 20.00,
                          ),
                        ):Text("Loading data.."),
                      )
                    ],
                  )
              )
          ),
          Container(
              height: 80,
              width: MediaQuery.of(context).size.width-10,
              margin: const EdgeInsets.all(0.00),
              decoration: const BoxDecoration(

                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30.00),
                    topRight: Radius.circular(50.00),
                  )
              ),
              child: Center(
                  child : Row(
                    children: [
                      Text("           "),
                      Image(image: AssetImage("images/wa.png"),
                        height: 24,
                        width: 24,
                      ),
                      Container(
                        child: acLen != "-1"?Text("  Wrong Ans : "+total_rejected.toString()
                          ,style: TextStyle(
                            fontSize: 20.00,

                          ),
                        ):Text("Loading data.."),
                      )
                    ],
                  )
              )
          ),
        ],
      ),
    );
  }
}
