// Coder : Nazmul Haque Nahin
// Date : 26-09-2021
import 'dart:io';

import 'third.dart';

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
  print("------------------------------\n\n");
  bool turn = true;
  while(turn){
    stdout.write("Enter 1 for login, 2 for SignUp , 0 for exit the program : ");
    var choice = stdin.readLineSync();
    if(choice == "1"){
      LogIn_panel();
    }else if(choice == "2"){
      SignUp();
    }else if(choice == "0"){
      turn = false;
    }
    else{
      print("Wrong Input !");
    }

  }


  //Map m = {'name':'Tom','Id':'E1001'};
  //print('Map :${m}');

  //dynamic res = m.remove('name');
  //print('Value popped from the Map :${res}');






}
void LogIn_panel(){
   print("Press 1 to Login As Admin ");
   print("Press 2 to Login As Customer ");
   stdout.write("Enter your choice : "); var choice = stdin.readLineSync();
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
       stdout.write("Enter your name : "); String name = stdin.readLineSync()??"";
       stdout.write("Enter your address : "); String address = stdin.readLineSync()??"";
       if(name.isNotEmpty && address.isNotEmpty){
         if(Container.containsKey(name) && Container.containsValue(address)){
           USER_PANNEL();
         }else{
           print("user ID and address did not match");
         }
       }else{
         print("Something went wrong !");
       }

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
    if(Container.containsKey(name)) {
      print("This user name is already exists. please try another ");
    }else{
      Container[name]=address;
      print("Congratulations $name !");
      print("SignUp Successful");
    }
  }
}

void ADMIN_PANNEL(){

  print("---WELCOME TO ADMIN PANEL----");
  bool turn = true;
  while(turn){
    print("what do u want ? ");
    print("Press 1 to see All records,");
    print("press 2 for delete a user,");
    print("Press 3 for update a user");
    print("Press 0 to logOut");
    stdout.write("Enter your choice :");
    var choice = stdin.readLineSync();
    if(choice == "1"){
      if(Container.isEmpty){

        print("there is no record yet ! Enter a new record first");

      }else{

        print(Container);

      }
    }else if(choice == "2"){

      stdout.write("Enter the user name u wanna remove from database :"); String name = stdin.readLineSync()??"";

      if(name.isNotEmpty){

        if(Container.containsKey(name)){

          Container.remove(name);
          print("You have successfully removed user $name from database");

        }else{

          print("This user does not exist in database");

        }
      }else{

        print("Enter a valid name which exists in database please");

      }
    }else if(choice == "3"){
      stdout.write("Enter the user name u wanna update from database :"); String name = stdin.readLineSync()??"";
      if(name.isNotEmpty && Container.containsKey(name)){
        stdout.write("Enter new name :"); var newName = stdin.readLineSync()??"";
        stdout.write("Enter new Address : "); var newAddress = stdin.readLineSync()??"";
        if(newName.isNotEmpty && newAddress.isNotEmpty){
          Container[newName] = newAddress;
          print("Update Successful !");
        }else{
          print("Something went wrong ");
        }

      }else{
        print("Wrong input or USER NAME does not exist");
      }
    }else if(choice == "0"){
      turn = false;
    }

  }
}

void USER_PANNEL(){
  print("---Welcome to USER PANEL---");
  bool turn = true;
  while(turn){
    print("Enter 1 to update your details again");
    print("Enter 2 to logOut");
    stdout.write("Enter your choice : "); var choice = stdin.readLineSync();
    if(choice == "1"){
    //  stdout.write("Enter the user name u wanna update from database :"); String name = stdin.readLineSync()??"";
    //  if(name.isNotEmpty && Container.containsKey(name)){
        stdout.write("Enter new name :"); var newName = stdin.readLineSync()??"";
        stdout.write("Enter new Address : "); var newAddress = stdin.readLineSync()??"";
        if(newName.isNotEmpty && newAddress.isNotEmpty){
          if(Container.containsKey(newName)){
            print("This user name already exist ! try new one");
          }else{
            Container[newName] = newAddress;
            print("Update Successful !");
          }
        }else{
          print("Something went wrong ");
        }

      //}else{
       // print("Wrong input or USER NAME does not exist");
      //}
    }else if(choice == "2"){
      turn = false;
    }else{
      print("Wrong choice");
    }
  }
}