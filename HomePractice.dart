void main(List<String> arguments) {
  Admin smj = Admin(username: "smj", password: "7xxxxxxx");

  // smj.login(username: "smj", password: "7xxxxxxx");

  Customer nahin = Customer(
    username: "nahin",
    password: "123",
    name: "Nahin Ahmed",
    address: "Mymensingh",
  );

  // smj.delete(nahin);
  // nahin.login(username: "nah", password: "123");

  smj.selfRemove();
  nahin.selfRemove();

  smj.updateProfile();
  print(nahin.address);
  nahin.updateProfile(newAddress: "Charpara");
  print(nahin.address);
}

abstract class User {
  String username;
  String password;
  String? name;
  String? address;

  selfRemove();

  User({
    required this.username,
    required this.password,
    this.address,
    this.name,
  });

  login({
    required String username,
    required String password,
  }) {
    if (username == this.username && password == this.password) {
      print("Login successful");
    } else {
      print("Username or password incorrect");
    }
  }

  updateProfile({
    String? newName,
    String? newAddress,
  }) {
    if (newName != null) {
      name = newName;
    }

    if (newAddress != null) {
      address = newAddress;
    }
  }
}

class Admin extends User {
  Admin({
    required String username,
    required String password,
  }) : super(
          username: username,
          password: password,
        );

  @override
  updateProfile({
    String? newName,
    String? newAddress,
  }) {
    print("Are you kidding?");
  }

  delete(User user) {
    print("${user.username} is deleted");
  }

  @override
  selfRemove() {
    print("Admin deleted and system is being destroyed");
  }
}

class Customer extends User {
  Customer({
    required String username,
    required String password,
    required String name,
    required String address,
  }) : super(
          username: username,
          password: password,
          name: name,
          address: address,
        );

  order() {
    print("Ordering");
  }

  @override
  selfRemove() {
    print("Do you have permission from admin?");
  }
}
