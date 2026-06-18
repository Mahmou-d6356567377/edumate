part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}
class ProfileSuccess extends ProfileState {
  final Userprofilemodel userProfile;

  ProfileSuccess(this.userProfile);
}

class ProfileFailure extends ProfileState {
  final String errorMessage;

  ProfileFailure(this.errorMessage);
}


