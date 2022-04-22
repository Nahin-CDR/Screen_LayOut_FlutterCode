import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserInfo extends StatefulWidget {
  const UserInfo({Key? key}) : super(key: key);
  @override
  State<UserInfo> createState() =>_UserInfoState();
}

String userName = "Nahin_junior71";

List? listResponse;
Map? mapResponse;

class _UserInfoState extends State<UserInfo> {
  final url = "https://codeforces.com/api/user.info?handles=$userName";


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
        title: const Text("User Info"),
      ),
      body: ListView.builder(itemBuilder: (context,index){
        return Container(
          padding: const EdgeInsets.all(15.00),
          margin: const EdgeInsets.only(top: 10, right: 10.00, left: 10.00),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.00),
            color: Colors.black12,
          ),
          child: Column(
            children: [
              //User Photo
              Container(
                width: 180.00,
                height: 200.00,
                margin: const EdgeInsets.only(top: 10, right: 10.00, left: 10.00),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.00),
                  color: Colors.white,
                ),
                child: Center(
                        child: listResponse![index]['titlePhoto'] == null ? const Text("Loading data") :
                        Container(
                          margin: const EdgeInsets.all(5.00),
                          width: 150.00,
                          height: 180.00,
                          child: const Text(""),//Image(image: NetworkImage(imageUrl.toString())),
                          decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: const BorderRadius.all(Radius.circular(15.00)),
                          image: DecorationImage(image: NetworkImage(listResponse![index]['titlePhoto'].toString()),
                          fit: BoxFit.fill,
                          )
                        ),
                    ),
                ),
              ),
              //Name
              Container(
                margin: const EdgeInsets.only(top: 10),
                decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(2)),
                child: Center(
                  child: listResponse![index]['firstName'] == null
                      ? const Text("Loading data")
                      : Text(
                    "Name : " +
                        listResponse![index]['firstName'].toString(),
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              //Country Name
              Container(
                margin: const EdgeInsets.only(top: 10),
                decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(2)),
                child: Center(
                  child: listResponse![index]['country'] == null
                      ? const Text("Loading data")
                      : Text(
                    "Country : " +
                        listResponse![index]['country'].toString(),
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              //City Name
              Container(
                margin: const EdgeInsets.only(top: 10),
                decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(2)),
                child: Center(
                  child: listResponse![index]['city'] == null
                      ? const Text("Loading data")
                      : Text(
                    "City : " +
                        listResponse![index]['city'].toString(),
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              //Total Friends
              Container(
                margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
                decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(2)),
                child: Center(
                    child: listResponse![index]['friendOfCount'] == null
                        ? const Text("Loading data")
                        : Text("Friends : "+
                        listResponse![index]['friendOfCount'].toString(),
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    )
                ),
              ),
              //Contest Rating
              Container(
                margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
                decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(2)),
                child: Center(
                  child: listResponse![index]['rating'] == null
                      ? const Text("Loading data")
                      : Text(
                    "Contest Rating : " +
                        listResponse![index]['rating'].toString(),
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ),
              //MaxRating
              Container(
                margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
                decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(2)),
                child: Center(
                  child: listResponse![index]['maxRating'] == null
                      ? const Text("Loading data")
                      : Text(
                    "Max Rating : " +
                        listResponse![index]['maxRating'].toString(),
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ),
              //Current Rank
              Container(
                margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
                decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(2)),
                child: Center(
                  child: listResponse![index]['rank'] == null
                      ? const Text("Loading data")
                      : Text(
                    "Current Rank : " +
                        listResponse![index]['rank'].toString(),
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ),
              //Max Rank
              Container(
                margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
                decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(2)),
                child: Center(
                  child: listResponse![index]['maxRank'] == null
                      ? const Text("Loading data")
                      : Text(
                    "Max Rank : " +
                        listResponse![index]['maxRank'].toString(),
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        );
      },itemCount: listResponse == null ? 0 : listResponse?.length),
    );
  }
}
