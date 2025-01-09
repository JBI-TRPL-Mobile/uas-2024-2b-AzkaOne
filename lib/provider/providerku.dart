import 'package:flutter/material.dart';
import 'package:template_project/model/user.dart';

class Providerku with ChangeNotifier {
  List<Users> _registerUsers = [];

  List<Users> get registerUsers => _registerUsers;

  void registerUser(Users user) {
    _registerUsers.add(user);
    notifyListeners();
  }

  Users? loginUser(String email, String password) {
    for (var user in _registerUsers) {
      if (user.email == email && user.password == password) {
        return user;
      }
    }
    return null;
  }
}



