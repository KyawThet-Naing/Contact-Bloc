part of 'get_all_contact_cubit.dart';

abstract class GetAllContactState extends Equatable {
  const GetAllContactState();
}

class GetAllContactInitial extends GetAllContactState {
  @override
  List<Object> get props => [];
}

class GetAllContactSuccess extends GetAllContactState {
  final List<Contact> contact;

  GetAllContactSuccess(this.contact);

  @override
  List<Object> get props => [contact];
}

class GetAllContactFail extends GetAllContactState {
  final String error;

  GetAllContactFail(this.error);

  @override
  List<Object> get props => [error];
}
