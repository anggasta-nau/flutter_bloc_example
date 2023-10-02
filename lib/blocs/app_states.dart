import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../models/user_model.dart';

@immutable
abstract class UserState extends Equatable {}

//DATA LOADING STATE
class UserLoadingState extends UserState {
  @override
  List<Object?> get props => [];
}

//DATA LOADED STATE
class UserLoadedState extends UserState {
  UserLoadedState(this.users);
  final List<Datum> users;
  @override
  List<Object?> get props => [users];
}

//DATA ERROR LOADING STATE
class UserErrorState extends UserState {
  UserErrorState(this.error);
  final String error;
  @override
  List<Object?> get props => [error];
}
