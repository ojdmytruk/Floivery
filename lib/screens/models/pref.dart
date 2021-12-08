import 'dart:convert';
import 'dart:io';
import 'package:floivery/screens/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';

class UserPreferences {
  static SharedPreferences? _preferences;
  static const _keyUsers = 'users';

  static var jsonFile;
  // static bool fileExists = false;

  static Future init() async{
    _preferences = await SharedPreferences.getInstance();
    final String path = await rootBundle.loadString('assets/data.json');
    jsonFile = File (path);
    // fileExists = jsonFile.existsSync();
    // if (fileExists) this.setState(() => fileContent = json.decode(jsonFile.readAsStringSync()));
  }

  static Future setUser(User user) async {
    final json = jsonEncode(user.toJson());
    final idUser = user.id;
    jsonFile.writeAsStringSync(json);
    // var jF = jsonFile;
    // if (jF != null) {
    //   jF.writeAsStringSync(json);
    // }
    var pref = _preferences;
    if (pref != null) {
      await pref.setString(idUser, json);
    }
  }

  // static User getUser(String idUser) {
  //   final json = _preferences.getString(idUser);
  //
  //   return User.fromJson(jsonDecode(json));
  // }

  static Future addUsers(User user) async {
    var pref = _preferences;
    if (pref != null){
      final idUsers = pref.getStringList(_keyUsers) ?? <String>[];
      final newIdUsers = List.of(idUsers)..add(user.id);

      await pref.setStringList(_keyUsers, newIdUsers);
    }
  }


  // static List<User> getUsers() {
  //   final idUsers = _preferences.getStringList(_keyUsers);
  //
  //   if (idUsers == null) {
  //     return <User>[];
  //   } else {
  //     return idUsers.map<User>(getUser).toList();
  //   }
  // }
}