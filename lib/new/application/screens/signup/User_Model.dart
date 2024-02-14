import 'package:cloud_firestore/cloud_firestore.dart';


class UserModel{

  final String id;
  String firstname;
  String lastname;
  final String username;
  final String email;
  String phonenumber;

  UserModel({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.username,
    required this.email,
    required this.phonenumber,
  });

  ///getting full name function
  String get fullName => '$firstname $lastname';

  ///format phone number function
  String get formattedPhoneNo => formatPhoneNum(phonenumber);

  static String formatPhoneNum(String phoneNo) {
    if (phoneNo.length == 10) {
      return '+94$phoneNo';
    } else {
      return phoneNo;
    }
  }
  ///used to split the full name into first name and last name
  static List<String> nameParts(fullName) =>
     fullName.split(" ");


  ///used to generate a username from the full name
  static String generateUsername(String fullName) {
    List<String> names = fullName.split(" ");
    String firstname = names[0].toLowerCase();
    String lastname = names.length > 1 ? names[1].toLowerCase() : "";

    String camelCaseUsername = "$firstname$lastname";
    String usernamewithPrefix = "user_$camelCaseUsername";

    return usernamewithPrefix;
  }

  ///creating empty user model
  factory UserModel.empty() => UserModel(
    id: '',
    firstname: '',
    lastname: '',
    username: '',
    email: '',
    phonenumber: '',
  );

  ///convert model to json structure for storing data in firebase
  Map<String, dynamic> toJson() => {
    'id': id,
    'firstname': firstname,
    'lastname': lastname,
    'username': username,
    'email': email,
    'phonenumber': phonenumber,
  };

  ///factory method to create a usermodel from a firebase document snapshot
  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.exists) {
      final data = document.data()!;
      return UserModel(
        id: document.id,
        firstname: data['firstname'] ?? '',
        lastname: data['lastname'] ?? '',
        username: data['username'] ?? '',
        email: data['email'] ?? '',
        phonenumber: data['phonenumber'] ?? '',
      );
    } else {
      // Handle the case when the document doesn't exist
      throw Exception('User document does not exist');
    }
  }


}