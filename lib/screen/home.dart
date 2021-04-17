import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:retrofit_bloc/bloc/get_all_contact_cubit.dart';
import 'package:retrofit_bloc/model/contact.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:retrofit_bloc/screen/add_contact.dart';
import 'package:retrofit_bloc/screen/update_contact.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contact'), centerTitle: true),
      body: BlocBuilder<GetAllContactCubit, GetAllContactState>(
        builder: (context, state) {
          if (state is GetAllContactSuccess) {
            return contactListUI(contact: state.contact, context: context);
          } else if (state is GetAllContactFail) {
            return Center(child: Text(state.error));
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          String result = await Get.to(() => AddContact());
          if (result == 'success') {
            BlocProvider.of<GetAllContactCubit>(context).getAllContact();
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }

  contactListUI({List<Contact> contact, BuildContext context}) {
    return contact.length == 0
        ? Center(child: Text('Contact is Empty !'))
        : ListView.builder(
            itemCount: contact.length,
            itemBuilder: (_, index) => Card(
                    child: Slidable(
                  actionPane: SlidableBehindActionPane(),
                  actions: [
                    IconSlideAction(
                        icon: Icons.edit,
                        caption: 'Update',
                        color: Colors.indigoAccent,
                        onTap: () async {
                          String result = await Get.to(
                              () => UpdateContact(contact: contact[index]));
                          if (result != null && result == 'success') {
                            BlocProvider.of<GetAllContactCubit>(context)
                                .getAllContact();
                          }
                        }),
                  ],
                  secondaryActions: [
                    IconSlideAction(
                      icon: Icons.delete,
                      caption: 'Delete',
                      //icon color default - white
                      foregroundColor: Colors.white,
                      color: Colors.redAccent,
                      onTap: () {
                        BlocProvider.of<GetAllContactCubit>(context)
                            .deleteContact(contact[index].id);
                      },
                    )
                  ],
                  child: ListTile(
                    title: Text(contact[index].name),
                    subtitle: Text(contact[index].job),
                    trailing: Text('Age is : ${contact[index].age}'),
                  ),
                )));
  }
}
