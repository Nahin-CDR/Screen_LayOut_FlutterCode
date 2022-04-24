import 'package:flutter/material.dart';
import 'package:navigator/codeforces/contest_list.dart';
import 'package:navigator/codeforces/user_info.dart';
import 'package:navigator/codeforces/user_submission.dart';

class MENUS extends StatefulWidget {
  const MENUS({Key? key}) : super(key: key);

  @override
  State<MENUS> createState() => _MENUSState();
}

class _MENUSState extends State<MENUS> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 230,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(50.00),
              ),
              color: Colors.black38,
            ),
            child: Stack(
              children: [
                Positioned(
                    top:80,
                    left: 0,
                    child:Container(
                      height: 100,
                      width: 300,
                      decoration: const BoxDecoration(
                        color:Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50.00),
                          bottomRight: Radius.circular(50.00),
                        )
                      ),
                    )
                ),
                const Positioned(
                    top: 110,
                    left: 20,
                    child: Text("Menus",style: TextStyle(fontSize: 30.00, color: Colors.grey, fontWeight: FontWeight.bold),)
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
                children: [
                  //user Details
                  GestureDetector(
                    child:  Container(
                        height: 100,
                        width: 300,
                        margin: const EdgeInsets.all(10.00),
                        decoration: const BoxDecoration(
                            color:Colors.black12,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50.00),
                              bottomRight: Radius.circular(50.00),
                            )
                        ),
                        child: Center(
                            child : Row(
                              children: [
                                Text("         "),
                                Icon(
                                  Icons.account_circle,
                                  size: 50,
                                ),
                                Text("  User Details",style: TextStyle(fontSize: 25),),
                              ],
                            )
                        )
                    ),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const UserInfo()));
                    }
                  ),
                  //User Submissions
                  GestureDetector(
                    child:Container(
                        height: 100,
                        width: 300,
                        margin: const EdgeInsets.all(10.00),
                        decoration: const BoxDecoration(
                            color:Colors.black12,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50.00),
                              bottomRight: Radius.circular(50.00),
                            )
                        ),
                        child: Center(
                            child : Row(
                              children: const [
                                Text("         "),
                                Icon(
                                  Icons.app_registration,
                                  size: 50,
                                ),
                                Text("  User Submissions",style: TextStyle(fontSize: 25),),
                              ],
                            )
                        )
                    ) ,
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)
                        => const UserSubmission()));
                      }
                  ),
                  //ContestList
                  GestureDetector(
                    child:  Container(
                        height: 100,
                        width: 300,
                        margin: const EdgeInsets.all(10.00),
                        decoration: const BoxDecoration(
                            color:Colors.black12,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50.00),
                              bottomRight: Radius.circular(50.00),
                            )
                        ),
                        child: Center(
                            child : Row(
                              children: const [
                                Text("         "),
                                Icon(
                                  Icons.list_alt,
                                  size: 50,
                                ),
                                Text("  Contest List",style: TextStyle(fontSize: 25)),
                              ],
                            )
                        )
                    ),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)
                        => const ContestList()));
                      }
                  ),
                ],
            ),
          ),
        ],
      ),
    );
  }
}
