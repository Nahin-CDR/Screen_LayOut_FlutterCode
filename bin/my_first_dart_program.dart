// Coder : Nazmul Haque Nahin
// Date : 26-09-2021
import 'dart:io';

import 'third.dart';

//Map<String,String>Container;
Map<String,String>Container={};

void main(List<String> arguments) {

  //Both Admins and Customers are Users.
  //A user can login to the system using their username and password,
  //update their profiles (update name and address).
  //Admins can delete other user and Customers can register to the system.
  //Write a program in Dart using OOP concepts learnt so far.
  //List<String>Container;

  print("------------------------------");
  print("Welcome to Shonar Bangla HOTEL");
  print("What do you want ?");
  print("To Login ? or SignUp ?");
  print("Enter 1 for login or 2 for SignUp");
  var choice = stdin.readLineSync();
  if(choice == "1"){
    LogIn_panel();
  }else if(choice == "2"){
    SignUp();
  }else{
    print("Wrong Input !");
  }




  //Map m = {'name':'Tom','Id':'E1001'};
  //print('Map :${m}');

  //dynamic res = m.remove('name');
  //print('Value popped from the Map :${res}');






}
void LogIn_panel(){
   print("Press 1 to Login As Admin ");
   print("Press 2 to Login As Customer ");
   var choice = stdin.readLineSync();
   if(choice == "1"){
       print("Input your user ID and password Sir.");
       stdout.write("Enter Your name: "); var name = stdin.readLineSync();
       stdout.write("Enter Your password: "); var pass = stdin.readLineSync();
       if(name == "abul" && pass == "123"){
          print("LogIn Successful !");
          print("WELCOME ADMIN");
          ADMIN_PANNEL();
       }else{
         print("Wrong id or Password");
       }
   }
   else if(choice == "2") {

   }else{
     print("Wring Choice !");
   }
}

void SignUp(){

  stdout.write("Enter Name : "); String name = stdin.readLineSync()??"";
  stdout.write("Enter Address : "); String address = stdin.readLineSync()??"";
  if(name.isEmpty || address.isEmpty){
    print("You did not give correct input");
  }else{
    Container[name]=address;
    print("SignUp Successful");
  }

}

void ADMIN_PANNEL(){

  if(Container.isEmpty){
    print("there is no record yet !");
  }else{
    print(Container);
  }

}

