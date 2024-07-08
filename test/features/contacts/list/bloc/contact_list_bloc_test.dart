import 'package:contact_bloc/features/contacts/list/bloc/contact_list_bloc.dart';
import 'package:contact_bloc/models/contact_model.dart';
import 'package:contact_bloc/repositories/contacts_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockContactsRepository extends Mock implements ContactsRepository {}

void main() {
  //! declaração

  late ContactsRepository repository;
  late ContactListBloc bloc;
  late List<ContactModel> contacts;

  //! preparação

  setUp(() {
    repository = MockContactsRepository();
    bloc = ContactListBloc(repository: repository);
    contacts = [
      ContactModel(
          name: 'Rodrigo Rahman', email: 'rodrigo@academiadoflutter.com.br'),
      ContactModel(name: 'Rodrigo', email: 'rodrigo@gmail.com.br'),
    ];
  });

  //! execução




  
}
