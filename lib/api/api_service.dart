import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:retrofit_bloc/model/contact.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: 'https://60798ad5460a6600174fbee1.mockapi.io/api/')
abstract class ApiService {
  factory ApiService(Dio dio) => _ApiService(dio);

  @GET('')
  Future<List<Contact>> getAllContact();

  @GET('{id}')
  Future<Contact> getDetails(@Path() String id);

  @POST('')
  Future<Contact> addContact(@Body() Contact contact);

  @DELETE('{id}')
  Future<Contact> deleteContact(@Path() String id);

  @PUT('{id}')
  Future<Contact> updateContact(@Path() String id, @Body() Contact contact);
}
