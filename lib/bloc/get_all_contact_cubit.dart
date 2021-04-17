import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:retrofit_bloc/api/api_service.dart';
import 'package:retrofit_bloc/model/contact.dart';

part 'get_all_contact_state.dart';

class GetAllContactCubit extends Cubit<GetAllContactState> {
  ApiService _apiService;

  GetAllContactCubit(this._apiService) : super(GetAllContactInitial()) {
    getAllContact();
  }

  getAllContact() {
    emit(GetAllContactInitial());
    _apiService
        .getAllContact()
        .then((value) => emit(GetAllContactSuccess(value)))
        .catchError((e) => emit(GetAllContactFail(e)));
  }

  void deleteContact(String id) {
    emit(GetAllContactInitial());
    _apiService
        .deleteContact(id)
        .then((value) => emit(getAllContact()))
        .catchError((e) => emit(GetAllContactFail(e)));
  }
}
