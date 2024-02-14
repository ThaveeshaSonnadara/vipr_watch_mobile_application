import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../screens/signup/User_Model.dart';


class UserRepository extends GetxController{
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// save data to firestore function

  Future<void> saveDataToFirestore(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } on PlatformException catch (e) {
      throw e.message as String;
    } on FirebaseException catch (e) {
      throw e.message as String;
    } on FormatException catch (e) {
      throw e.message;
    } on Exception catch (e) {
      throw e.toString();
    }
  }
}