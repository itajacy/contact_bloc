import 'package:contact_bloc/features/bloc_example/bloc/example_bloc.dart';
import 'package:contact_bloc/features/bloc_example/bloc_example.dart';
import 'package:contact_bloc/features/bloc_example/bloc_freezed/example_freezed_bloc.dart';
import 'package:contact_bloc/features/bloc_example/bloc_freezed_example.dart';
import 'package:contact_bloc/features/contacts/list/bloc/contact_list_bloc.dart';
import 'package:contact_bloc/features/contacts/list/contacts_list_page.dart';
import 'package:contact_bloc/features/contacts/register/bloc/contact_register_bloc.dart';
import 'package:contact_bloc/features/contacts/register/contacts_register_page.dart';
import 'package:contact_bloc/features/contacts/update/bloc/bloc/contact_update_bloc.dart';
import 'package:contact_bloc/features/contacts/update/contacts_update_page.dart';
import 'package:contact_bloc/features/contacts_cubit/list/contacts_list_cubit_page.dart';
import 'package:contact_bloc/features/contacts_cubit/list/cubit/contact_list_cubit.dart';
import 'package:contact_bloc/models/contact_model.dart';
import 'package:contact_bloc/repositories/contacts_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => ContactsRepository(),
      child: MaterialApp(
        initialRoute: '/home',
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routes: {
          '/home': (_) => HomePage(),
          '/bloc/example': (_) => BlocProvider(
                //!  Com o ..add()  ao startar ele já executa o evento findname
                create: (_) => ExampleBloc()..add(ExampleFindNameEvent()),
                child: const BlocExample(),
              ),
          '/bloc/example/freezed': (context) => BlocProvider(
                create: (context) =>
                    ExampleFreezedBloc()..add(ExampleFreezedEvent.findNames()),
                child: const BlocFreezedExample(),
              ),
          '/contacts/list': (context) => BlocProvider(
                create: (context) => ContactListBloc(
                  repository: context.read<ContactsRepository>(),
                )..add(
                    const ContactListEvent.findAll(),
                  ),
                child: const ContactsListPage(),
              ),
          '/contacts/register': (context) => BlocProvider(
                create: (context) => ContactRegisterBloc(
                  contactsRepository: context.read(),
                ),
                child: const ContactsRegisterPage(),
              ),
          '/contacts/update': (context) {
            final contact =
                ModalRoute.of(context)!.settings.arguments as ContactModel;

            return BlocProvider(
              create: (context) => ContactUpdateBloc(
                contactsRepository: context.read(),
              ),
              child: ContactsUpdatePage(contact: contact),
            );
          },
          '/contacts/cubit/list': (context) {
            return BlocProvider(
              create: (context) => ContactListCubit(
                repository: context.read(),
              )..findAll(),
              child: const ContactsListCubitPage(),
            );
          }
        },
        home: const HomePage(),
      ),
    );
  }
}
