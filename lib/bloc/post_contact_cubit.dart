import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:retrofit_bloc/api/api_service.dart';
import 'package:retrofit_bloc/model/contact.dart';

part 'post_contact_state.dart';

class PostContactCubit extends Cubit<PostContactState> {
  ApiService _apiService;

  PostContactCubit(this._apiService) : super(PostContactInitial());

  void addContact(Contact contact) {
    emit(PostContactLoading());
    _apiService
        .addContact(contact)
        .then((value) => emit(PostContactSuccess()))
        .catchError((e) => emit(PostContactFail(e)));
  }
}
