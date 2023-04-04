import 'package:flutter/foundation.dart';
class User {
  final String? id;
  final String? name;
  final int? age;
  final int? salary;
  final String? mobile;
  const User({this.id, this.name, this.age, this.salary, this.mobile});
}

class UserProvider with ChangeNotifier {
  List<User> _nuser = [];
  //Map<String, dynamic> _user = {};

  List<User> get users {
    return _nuser;
  }

  // Map<String, dynamic> get users {
  //   return _user;
  // }

  addNewUser(User data) {
    _nuser.add(data);
    notifyListeners();
  }
}
