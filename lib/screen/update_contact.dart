
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:retrofit_bloc/bloc/edit_contact_cubit.dart';
import 'package:retrofit_bloc/model/contact.dart';

class UpdateContact extends StatelessWidget {
  final Contact contact;

  UpdateContact({@required this.contact});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EditContactCubit>(
      create: (context) => EditContactCubit(Get.find()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(contact.name),
          centerTitle: true,
        ),
        body: BlocBuilder<EditContactCubit, EditContactState>(
            builder: (_, state) {
          if (state is EditContactInitial) {
            return UpdateForm(contact: contact);
          } else if (state is EditContactLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is EditContactSuccess) {
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Success',style: TextStyle(fontSize: 25,color: Colors.green),),
                SizedBox(height: 20),
                MaterialButton(
                  height: 50,
                  onPressed: () => Get.back(result: 'success'),
                  child: Text('Go Home'),
                )
              ],
            ));
          }
          return Center(child: CircularProgressIndicator());
        }),
      ),
    );
  }
}

class UpdateForm extends StatefulWidget {
  final Contact contact;

  UpdateForm({@required this.contact});

  @override
  _UpdateFormState createState() => _UpdateFormState();
}

class _UpdateFormState extends State<UpdateForm> {
  TextEditingController _nameController;
  TextEditingController _jobController;
  TextEditingController _ageController;
  String _id;

  @override
  void initState() {
    _id = widget.contact.id;
    _nameController = TextEditingController(text: widget.contact.name);
    _jobController = TextEditingController(text: widget.contact.job);
    _ageController = TextEditingController(text: widget.contact.age);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(40),
      children: [
        TextFormField(
          controller: _nameController,
          decoration:
              InputDecoration(labelText: 'Name', border: OutlineInputBorder()),
        ),
        SizedBox(height: 50),
        TextFormField(
          controller: _jobController,
          decoration:
              InputDecoration(labelText: 'Job', border: OutlineInputBorder()),
        ),
        SizedBox(height: 50),
        TextFormField(
          controller: _ageController,
          keyboardType: TextInputType.number,
          decoration:
              InputDecoration(labelText: 'Age', border: OutlineInputBorder()),
        ),
        SizedBox(height: 50),
        MaterialButton(
          height: 50,
          onPressed: () {
            if (_nameController == null ||
                _jobController == null ||
                _ageController == null) {
              Get.defaultDialog(
                  title: 'Warning',
                  content: Text('Please Fill All Required Field !'));
              return;
            }

            Contact contact = Contact(_nameController.text.trim(),
                _ageController.text.trim(), _jobController.text.trim(), null);

            BlocProvider.of<EditContactCubit>(context)
                .updateContact(_id, contact);
          },
          child: Text('Confirm'.toUpperCase()),
        )
      ],
    );
  }
}
