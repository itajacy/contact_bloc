import 'package:contact_bloc/features/bloc_example/bloc/example_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocExample extends StatelessWidget {
  const BlocExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Example'),
      ),
      // criando um "listener"
      // ouve somente o estado
      body: BlocListener<ExampleBloc, ExampleState>(
        listenWhen: (previous, current) {
          if (previous is ExampleStateInitial && current is ExampleStateData) {
            if (current.names.length > 3) {
              return true;
            }
          }
          return false;
          // return current is ExampleStateData;
        },
        //!  O listener só será executando quando a condição do listnWhen for satisfeita
        listener: (context, state) {
          if (state is ExampleStateData) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('A quantidade de nomes é: ${state.names.length}'),
              ),
            );
          }
        },
        child: Column(
          children: [
            // Ouve e retorna o estado
            BlocConsumer<ExampleBloc, ExampleState>(
              buildWhen: (previous, current) {
                if (previous is ExampleStateInitial &&
                    current is ExampleStateData) {
                  if (current.names.length > 3) {
                    return true;
                  }
                }
                return false;
              },
              listener: (context, state) {
                print('Estado alterado para ${state.runtimeType}');
              },
              builder: (context2, state) {
                if (state is ExampleStateData) {
                  return Text('Total de nomes é ${state.names.length}');
                }
                return const SizedBox.shrink();
              },
            ),
            // quando queremos somente parte do estado
            BlocSelector<ExampleBloc, ExampleState, bool>(
              selector: (state) {
                print('Estado alterado para ${state.runtimeType}');
                if (state is ExampleStateInitial) {
                  return true;
                }
                return false;
              },
              builder: (context, showLoader) {
                if (showLoader) {
                  return const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),

            // queremos somente rebuildar
            // BlocBuilder<ExampleBloc, ExampleState>(
            //   builder: (context, state) {
            //     if (state is ExampleStateData) {
            //       return ListView.builder(
            //         shrinkWrap: true,
            //         itemCount: state.names.length,
            //         itemBuilder: (context, index) {
            //           final name = state.names[index];
            //           return ListTile(
            //             title: Text(name),
            //           );
            //         },
            //       );
            //     }
            //     return const Text('Nenhum nome cadastrado!');
            //   },
            // ),

            // BlocSelector usado no lugar do BlocBuilder sem a logica para
            // apresentar
            BlocSelector<ExampleBloc, ExampleState, List<String>>(
              selector: (state) {
                if (state is ExampleStateData) {
                  return state.names;
                }
                return [];
              },
              builder: (context, names) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: names.length,
                  itemBuilder: (context, index) {
                    final name = names[index];
                    return ListTile(
                      onTap: () {
                        context.read<ExampleBloc>().add(
                              ExampleRemoveNameEvent(name: name),
                            );
                      },
                      title: Text(name),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
