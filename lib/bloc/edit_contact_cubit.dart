import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:retrofit_bloc/api/api_service.dart';
import 'package:retrofit_bloc/model/contact.dart';

part 'edit_contact_state.dart';

class EditContactCubit extends Cubit<EditContactState> {
  ApiService _apiService;

  EditContactCubit(this._apiService) : super(EditContactInitial());

  void updateContact(String id, Contact contact) {
    emit(EditContactLoading());
    _apiService
        .updateContact(id, contact)
        .then((value) => emit(EditContactSuccess()))
        .catchError((e) => emit(EditContactFail(e)));
  }
}
