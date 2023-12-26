
import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? id;
  final String fName;
  final String lName;
  final String email;
  final String phoneNumber;
  final String password;

  UserEntity({
    this.id,
    required this.fName,
    required this.lName,
    required this.email,
    required this.phoneNumber,
    required this.password,
  });
  
  @override
  
  List<Object?> get props =>[fName, lName, email, phoneNumber, password];
}


