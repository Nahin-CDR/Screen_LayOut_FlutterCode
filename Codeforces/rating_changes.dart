import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

class RatingChanges extends StatefulWidget {
  final String id;
  RatingChanges({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<RatingChanges> createState() => _RatingChangesState(contestID: id);
}

List? listResponse;
Map? mapResponse;

class _RatingChangesState extends State<RatingChanges> {
  String contestID;
  _RatingChangesState({required this.contestID});
  get ID => contestID.toString();


  Future ApiCall() async {
    http.Response response;
    response = await http.get(Uri.parse("https://codeforces.com/api/contest.ratingChanges?contestId=$contestID"));
    print(response.statusCode);
    print(contestID);

    if (response.statusCode == 200) {
      setState(() {
        mapResponse = json.decode(response.body);
        listResponse = mapResponse!['result'];
      });
    } else {
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
        title: const Text("Rating Changes"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(15.00),
            margin: const EdgeInsets.only(top: 10, right: 10.00, left: 10.00),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.00),
              color: Colors.black12,
            ),
            child: Column(
              children: [

                Container(
                  child: Text(contestID),
                ),
                //Contest Name
                Container(
                  margin:
                      const EdgeInsets.only(top: 10, right: 10.00, left: 10.00),
                  child: Center(
                      child: listResponse![index]['contestName'] == null
                          ? const Text("Loading data")
                          : Text(listResponse![index]['contestName'].toString(),
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.bold,
                              ))),
                ),
                //User Name
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Container(
                    child: listResponse![index]['handle'] == null
                        ? const Text("Loading data")
                        : Text(
                            "used ID : " +
                                listResponse![index]['handle'].toString(),
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                  ),
                ),
                //Rank
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(2)),
                  child: Center(
                    child: listResponse![index]['rank'] == null
                        ? const Text("Loading data")
                        : Text(
                            "Rank : " + listResponse![index]['rank'].toString(),
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                  ),
                ),
                //Old Rating
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(2)),
                  child: Center(
                    child: listResponse![index]['oldRating'] == null
                        ? const Text("Loading data")
                        : Text(
                            "Old Rating : " +
                                listResponse![index]['oldRating'].toString(),
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                  ),
                ),
                //New Rating
                Container(
                  margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(2)),
                  child: Center(
                    child: listResponse![index]['newRating'] == null
                        ? const Text("Loading data")
                        : Text(
                            "New Rating : " +
                                listResponse![index]['newRating'].toString(),
                            style: const TextStyle(fontSize: 18),
                          ),
                  ),
                ),
                //Submission Status
              ],
            ),
          );
        },
        itemCount: listResponse == null ? 0 : listResponse?.length,
      ),
    );
  }
}
