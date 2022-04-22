
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

class UserSubmission extends StatefulWidget {
  const UserSubmission({Key? key}) : super(key: key);
  @override
  State<UserSubmission> createState() =>_UserSubmissionState();
}

String userName = "Nahin_junior71";
String problemCount = "50";

List? listResponse;
Map? mapResponse;

class _UserSubmissionState extends State<UserSubmission> {
  final url = "https://codeforces.com/api/user.status?handle=$userName&from=1&count=$problemCount";

  Future ApiCall() async{
    http.Response response;
    response = await http.get(Uri.parse(url));
    print(response.statusCode);

    if(response.statusCode == 200){
      setState(() {
        mapResponse = json.decode(response.body);
        listResponse = mapResponse!['result'];
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
      appBar: AppBar(
        title: const Text("User Submissions"),
      ),
      body: ListView.builder(itemBuilder: (context,index){
        return Container(
          padding: const EdgeInsets.all(15.00),
          margin: const EdgeInsets.only(top: 10, right: 10.00, left: 10.00),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.00),
            color: Colors.black12,
          ),
          child: Column(
            children: [
              //problem name with category
              Container(
                height: 40.00,
                margin:
                const EdgeInsets.only(top: 10, right: 10.00, left: 10.00),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.00),
                  color: Colors.black12,
                ),
                child: Center(
                    child: listResponse![index]['problem'] == null
                        ? const Text("Loading data")
                        : Text(
                        listResponse![index]['problem']['index'].toString()+". "+
                        listResponse![index]['problem']['name'].toString(),
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ))),
              ),
              //problem rating
              Container(
                margin: const EdgeInsets.only(top: 10),
                decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(2)),
                child: Center(
                  child: listResponse![index]['problem'] == null
                      ? const Text("Loading data")
                      : Text(
                        "Rating : " +
                        listResponse![index]['problem']['rating'].toString(),
                        style: const TextStyle(
                        fontSize: 18,
                    ),
                  ),
                ),
              ),
              //Problem Tags
              Container(
                margin: const EdgeInsets.only(top: 10),
                decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(2)),
                child: Center(
                  child: listResponse![index]['problem'] == null
                      ? const Text("Loading data")
                      : Text(
                        "Tags : " +
                        listResponse![index]['problem']['tags'].toString(),
                        style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        ),
                  ),
                ),
              ),
              //Participant type
              Container(
                margin: const EdgeInsets.only(top: 10),
                decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(2)),
                child: Center(
                  child: listResponse![index]['author'] == null
                      ? const Text("Loading data")
                      : Text(
                    "Participant Type : " +
                     listResponse![index]['author']['participantType'].toString(),
                    style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                    ),
                  ),
                ),
              ),
              //Programming Language
              Container(
                margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
                decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(2)),
                child: Center(
                  child: listResponse![index]['programmingLanguage'] == null
                      ? const Text("Loading data")
                      : Text(
                        "Programming Language : " +
                        listResponse![index]['programmingLanguage'].toString(),
                        style: const TextStyle(fontSize: 18),
                  ),
                ),
              ),
              //Submission Status
              Container(
                margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
                decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(2)),
                child: Center(
                  child: listResponse![index]['verdict'] == null
                      ? const Text("Loading data")
                      : listResponse![index]['verdict'].toString() == "OK" ? const Text(
                        "Accepted",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                        ),
                  ) : const Text(
                      "Wrong Answer",
                      style: TextStyle(
                      fontSize: 18,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
      itemCount: listResponse == null ? 0 : listResponse?.length,
      ),
    );
  }
}
