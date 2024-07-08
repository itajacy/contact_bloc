import 'package:contact_bloc/features/contacts/list/bloc/contact_list_bloc.dart';
import 'package:contact_bloc/features/contacts_cubit/list/cubit/contact_list_cubit.dart';
import 'package:contact_bloc/models/contact_model.dart';
import 'package:contact_bloc/repositories/contacts_repository.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../contacts/list/bloc/contact_list_bloc_test.dart';

void main() {
  //! declaração

  late ContactsRepository repository;
  late ContactListCubit bloc;
  late List<ContactModel> contacts;

  //! preparação

  setUp(() {
    repository = MockContactsRepository();
    bloc = ContactListCubit(repository: repository);
    contacts = [
      ContactModel(
          name: 'Rodrigo Rahman', email: 'rodrigo@academiadoflutter.com.br'),
      ContactModel(name: 'Rodrigo', email: 'rodrigo@gmail.com.br'),
    ];
  });
}
