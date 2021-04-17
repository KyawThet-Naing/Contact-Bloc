part of 'post_contact_cubit.dart';

abstract class PostContactState extends Equatable {
  const PostContactState();

  @override
  List<Object> get props => throw UnimplementedError();
}

class PostContactInitial extends PostContactState {
  @override
  List<Object> get props => throw UnimplementedError();
}


class PostContactLoading extends PostContactState {
  @override
  List<Object> get props => throw UnimplementedError();
}


class PostContactSuccess extends PostContactState {
  // final Contact contact;
  //
  // PostContactSuccess(this.contact);

  @override
  List<Object> get props => [];
}

class PostContactFail extends PostContactState {
  final String error;

  PostContactFail(this.error);

  @override
  List<Object> get props => [error];
}
