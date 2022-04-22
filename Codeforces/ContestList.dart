
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:navigator/codeforces/rating_changes.dart';

class ContestList extends StatefulWidget {
  const ContestList({Key? key}) : super(key: key);
  @override
  State<ContestList> createState() =>_ContestListState();
}

String contestID = "5";


List? listResponse;
Map? mapResponse;

class _ContestListState extends State<ContestList> {
  final url = "https://codeforces.com/api/contest.list?gym=false";

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
        title: const Text("Last 50 Contests"),
      ),
      body: ListView.builder(itemBuilder: (context,index){
        return GestureDetector(
          onTap: (){
            if(listResponse![index]['phase'].toString() == "FINISHED" && listResponse![index]['type'].toString() == "CF"){
             // Go to rating changes page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RatingChanges(id:listResponse![index]['id'].toString())),
              );
            }else{
              // show toast
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Rating didn't change yet for this contest",
                style: TextStyle(
                  fontSize: 17.00,
                ),
                ),
                duration: Duration(milliseconds: 1000),
              ));
              print(listResponse![index]['id'].toString());
            }

          },
          child: Container(
            padding: const EdgeInsets.all(15.00),
            margin: const EdgeInsets.only(top: 10, right: 10.00, left: 10.00),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.00),
              color: Colors.black12,
            ),
            child: Column(
              children: [
                //Contest Name
                Container(
                  margin:
                  const EdgeInsets.only(top: 10, right: 10.00, left: 10.00),
                  child: Center(
                      child: listResponse![index]['name'] == null
                          ? const Text("Loading data")
                          : Text(
                          listResponse![index]['name'].toString(),
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.bold,
                          ))),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(2)),
                  child: Center(
                    child: listResponse![index]['phase'] == null
                        ? const Text("Loading data")
                        : listResponse![index]['phase'].toString() == "BEFORE"? const Text(
                          "In Queue",
                          style: TextStyle(
                          fontSize: 18,
                          color: Colors.green,
                          fontWeight: FontWeight.bold
                        ),
                    ):const Text(
                      "Finished",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
        itemCount: listResponse == null ? 0 : 50,
      ),
    );
  }
}
