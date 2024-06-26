import 'package:contact_bloc/features/bloc_example/bloc/example_bloc.dart';
import 'package:contact_bloc/features/bloc_example/bloc_example.dart';
import 'package:contact_bloc/features/bloc_example/bloc_freezed/example_freezed_bloc.dart';
import 'package:contact_bloc/features/bloc_example/bloc_freezed_example.dart';
import 'package:contact_bloc/features/contacts/list/contacts_list_page.dart';
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
    return MaterialApp(
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
        '/contacts/list': (context) => const ContactsListPage(),
      },
      home: const HomePage(),
    );
  }
}
