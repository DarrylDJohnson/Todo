import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:todo/model/user.dart';

@immutable
abstract class UserState extends Equatable {
  UserState([List props = const []]) : super(props);
}

class Initial extends UserState {
  @override
  String toString() => 'User initial';
}

class Unauthenticated extends UserState {
  @override
  String toString() => 'User unauthenticated';
}

class Authenticated extends UserState {
  final User user;

  Authenticated(this.user);

  @override
  String toString() => 'Authenticated user {$user}';
}

class Error extends UserState {
  final String error;

  Error(this.error) : super([error]);

  @override
  String toString() => 'Error {SignInState: $error }';
}
