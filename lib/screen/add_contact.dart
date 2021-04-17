import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:retrofit_bloc/bloc/post_contact_cubit.dart';
import 'package:retrofit_bloc/model/contact.dart';

class AddContact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<PostContactCubit>(
      create: (_) => PostContactCubit(Get.find()),
      child: Scaffold(
        appBar: AppBar(title: Text('Add New Contact'), centerTitle: true),
        body: BlocBuilder<PostContactCubit, PostContactState>(
          builder: (_, state) {
            if (state is PostContactInitial) {
              return ContactForm();
            } else if (state is PostContactSuccess) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Success',
                        style: TextStyle(fontSize: 20, color: Colors.green)),
                    SizedBox(height: 20),
                    MaterialButton(
                        height: 50,
                        onPressed: () => Get.back(result: 'success'),
                        child: Text('Go Home'))
                  ],
                ),
              );
            } else if (state is PostContactFail) {
              return Center(
                child: Text(state.error),
              );
            }

            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}

class ContactForm extends StatefulWidget {
  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  String _name, _age, _job;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(40),
          children: [
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Name', border: OutlineInputBorder()),
              validator: (value) {
                if (value.isEmpty)
                  return 'Name is Required!';
                else
                  return null;
              },
              onSaved: (value) => this._name = value,
            ),
            SizedBox(height: 40),
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Job', border: OutlineInputBorder()),
              validator: (value) {
                if (value.isEmpty)
                  return 'Job is Required!';
                else
                  return null;
              },
              onSaved: (value) => this._job = value,
            ),
            SizedBox(height: 40),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'Age', border: OutlineInputBorder()),
              validator: (value) {
                if (value.isEmpty)
                  return 'Age is Required!';
                else
                  return null;
              },
              onSaved: (value) => this._age = value,
            ),
            SizedBox(height: 40),
            MaterialButton(
              height: 50,
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                  Contact contact = Contact(_name, _age, _job, null);
                  BlocProvider.of<PostContactCubit>(context)
                      .addContact(contact);
                }
                return;
              },
              child: Text('Add'),
            )
          ],
        ));
  }
}
