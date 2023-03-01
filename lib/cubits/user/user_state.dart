part of 'user_cubit.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {
  @override
  List<Object> get props => [];
}

class UserLoading extends UserState {
  @override
  List<Object> get props => [];
}

class UserLoaded extends UserState {
  //if the data is loaded we will need the user model so we created the user list
  List<User> userList;
  UserLoaded({required this.userList});
  @override
  List<Object> get props =>[userList];
}

class UserError extends UserState {
  String message;

  UserError({required this.message});

  @override
  List<Object> get props => [message];
}
