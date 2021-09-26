void main(List<String> arguments) {
  // int x = 5;
  // List<String> names = ["Rahim", "Karim", "Jodu", "Modhu"];

  // for (int i = 0; i < names.length; i++) {
  //   print(names[i]);
  // }

  // for (var name in names) {
  //   print(name);
  // }

  // names.forEach((element) {
  //   print(element);
  // });
  makeTea(tea: 1.5, milk: 3.2, water: 20);

  String? bikeColor = null;

  add(7, 9);
}

void add(num x, [num y = 5]) {
  print(x + y);
}

int makeTea(
    {required double tea,
    double? milk,
    double? sugar,
    double water = 100,
    double? darucini,
    double? elach}) {
  print("Making tea with $water cup water...");
  return 5;
}
