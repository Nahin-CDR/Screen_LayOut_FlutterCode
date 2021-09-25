
main() {

  Vehicle myBus = new Vehicle(capacity: 4,no_of_wheel:5,isAC: true);
  print(myBus.isAC);


}


class Vehicle{
  int no_of_wheel;
  double capacity;
  bool isAC;

  void run()
  {
    print("Car is running");
  }
  void whistle()
  {
    print("should be overridedn");
  }
  Vehicle({
    required this.capacity,
    this.isAC = false,
    required this.no_of_wheel

  });








}



// // Coder : Nazmul Haque Nahin
// // Date : 23-09-2021
//
// void main(List<String> arguments) {
//   Mobile samsung = new Mobile(
//       ram: 4,
//       core: 8,
//       camera: 12
//   );
//
//   print(samsung.camera);
//   print(samsung.ram);
//   samsung.playMusic();
// }
//
// class Vehicle {
//   //property and method
//
// }
//
// class Mobile {
//   double ram;
//   int core;
//   double camera;
//
//   void playMusic() {
//     print("Playing music");
//   }
//
//   void capturePhoto() {
//     print("Capturing Photo");
//   }
//
//   Mobile({
//     required this.camera,
//     required this.core,
//     required this.ram
//   });
// }
//
// //   Mobile(
// //       {required double ramArg, required int coreArg, required double cameraArg})
// //       : ram = ramArg,
// //         core = coreArg,
// //         camera = cameraArg;
// // }
