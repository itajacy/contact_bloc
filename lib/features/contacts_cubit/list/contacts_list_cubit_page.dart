import 'package:contact_bloc/features/contacts_cubit/list/cubit/contact_list_cubit.dart';
import 'package:contact_bloc/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/contact_model.dart';

class ContactsListCubitPage extends StatelessWidget {
  const ContactsListCubitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Cubit'),
      ),
      body: RefreshIndicator(
        onRefresh: () => context.read<ContactListCubit>().findAll(),
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              child: Column(
                children: [
                  Loader<ContactListCubit, ContactListCubitState>(
                    selector: (state) {
                      return state.maybeWhen(
                        orElse: () => false,
                        loading: () => true,
                      );
                    },
                  ),
                  BlocSelector<ContactListCubit, ContactListCubitState,
                      List<ContactModel>>(
                    selector: (state) {
                      return state.maybeWhen(
                        orElse: () => <ContactModel>[],
                        data: (contacts) => contacts,
                      );
                    },
                    builder: (_, contacts) {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: contacts.length,
                        itemBuilder: (_, index) {
                          final contact = contacts[index];
                          return ListTile(
                            onLongPress: () => context
                                .read<ContactListCubit>()
                                .deleteByModel(contact),
                            title: Text(contact.name),
                            subtitle: Text(contact.email),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
