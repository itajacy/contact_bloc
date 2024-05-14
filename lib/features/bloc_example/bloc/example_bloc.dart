import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';

part 'example_event.dart';
part 'example_state.dart';

class ExampleBloc extends Bloc<ExampleEvent, ExampleState> {
  ExampleBloc() : super(ExampleStateInitial()) {
    //!mapeando o evento
    on<ExampleFindNameEvent>(_findNames);
  }

  FutureOr<void> _findNames(
    ExampleFindNameEvent event,
    Emitter<ExampleState> emit,
  ) async {
    await Future.delayed(Duration(seconds: 4));
    final names = [
      'Rodrigo',
      'Academia',
      'Flutter',
      'Dart',
      'Flutter Bloc',
    ];
    emit(ExampleStateData(names: names));
  }
}
