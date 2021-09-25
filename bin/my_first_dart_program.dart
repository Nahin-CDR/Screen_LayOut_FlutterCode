// Coder : Nazmul Haque Nahin
// Date : 19-09-2021
void main(List<String> arguments) {
  print("||  Welcome to My Dart Program ||");
  print("price of pendrive is = 900 BDT");
  print("Anik has cash = 700 BDT ");
  int price_of_pendrive = 900;
  int cash_Anik_have = 700;
  int need_money = price_of_pendrive - cash_Anik_have;
  print("Anik need = $need_money BDT extra to buy new pendrive");

  //Now suppose Akash has x BDT and x = 400
  //Anik will be Able to buy pendrive if Akash have more than
  int x = 400;
  if (x >= need_money) {
    print("Anik Can buy Pendrive");
  } else {
    print("Sorry !!! its not possible ");
  }
}
