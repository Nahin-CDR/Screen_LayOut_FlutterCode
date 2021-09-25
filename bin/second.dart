// void main(List<String> arguments) {
//   Mobile xiaomiMiA1 = Mobile(
//     ram: 4,
//     core: 8,
//     camera: 12,
//   );
//
//   print(xiaomiMiA1.camera);
//
//   xiaomiMiA1.capturePhoto();
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
//     print("Capturing photo");
//   }
//
//   Mobile({
//     required this.ram,
//     required this.core,
//     required this.camera,
//   });
// }

main() {
  Bus acBus = Bus(seatNumber: 200, now: 6, isAc: true);

  acBus.whistle();

  Bike honda = Bike(cc: 250, now: 2);
  honda.whistle();
}

class Vehicle {
  int noOfWheel;

  void run() {
    print("Running...");
  }

  void whistle() {
    print("Should be overridden");
  }

  Vehicle({required this.noOfWheel});
}

class Bus extends Vehicle {
  int seatNumber;
  bool isAc;

  void whistle() {
    print("pepep");
  }

  Bus({required this.seatNumber, this.isAc = false, required int now})  : super(noOfWheel: now);
}

class Bike extends Vehicle {
  int cc;

  void whistle() {
    print("pipip");
  }

  Bike({required this.cc, required int now}) : super(noOfWheel: now);
}
