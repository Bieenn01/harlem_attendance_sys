import 'package:cloud_firestore/cloud_firestore.dart';

/// There is already a class called USER in Firebase, That's
/// Why we are using APPUSER here. So that we can differniate;
class AppUser {
  String name;
  String email;
  int? phone;
  int holiday;
  bool notification;
  String? userProfilePicture;
  String? userID;
  String? address;
  bool isAdmin;

  /// This is used for the login verification, profile picture is for showcase
  String? userFace;
  String? deviceIDToken;
  AppUser({
    required this.name,
    required this.email,
    required this.holiday,
    required this.notification,
    required this.isAdmin,
    this.userProfilePicture,
    this.userFace,
    this.phone,
    this.deviceIDToken,
    this.userID,
    this.address,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'holiday': holiday,
      'notification': notification,
      'userProfilePicture': userProfilePicture,
      'userFace': userFace,
      'deviceIDToken': deviceIDToken,
      'address': address,
      'isAdmin': false, // Ensure isAdmin defaults to false
    };
  }


  /// Use it when you fetch data from firebase. it returns a APPUSER objects
  factory AppUser.fromDocumentSnap(DocumentSnapshot documentSnapshot) {
    if (documentSnapshot.exists) {
      Map<String, dynamic>? data = documentSnapshot.data() as Map<String, dynamic>?;
      if (data != null) {
        return AppUser(
          name: data['name'],
          email: data['email'],
          phone: data['phone'],
          holiday: data['holiday'],
          notification: data['notification'],
          userProfilePicture: data['userProfilePicture'],
          userFace: data['userFace'],
          deviceIDToken: data['deviceIDToken'],
          address: data['address'],
          isAdmin: data['isAdmin'] ?? false,
          userID: documentSnapshot.id,
        );
      } else {
        throw Exception('Document data was null');
      }
    } else {
      throw Exception('Document does not exist');
    }
  }



  @override
  String toString() {
    return 'AppUser(name: $name, email: $email, phone: $phone, holiday: $holiday, notification: $notification, userProfilePicture: $userProfilePicture, userID: $userID, address: $address, userFace: $userFace, deviceIDToken: $deviceIDToken)';
  }
}
