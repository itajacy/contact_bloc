import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body:
          // SingleChildScrollView(
          //   child: Padding(
          //     padding: EdgeInsets.all(8.0),
          //     child: Wrap(
          //       children: [
          //         _ButtonCard(
          //           onTap: () {
          //             Navigator.of(context).pushNamed('/bloc/example');
          //           },
          //           label: 'Example',
          //         ),
          //         _ButtonCard(
          //           onTap: () {
          //             Navigator.of(context).pushNamed('/bloc/example/freezed');
          //           },
          //           label: 'Example',
          //         ),
          //       ],
          //     ),
          //   ),
          // ),

          Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/bloc/example');
                },
                child: const Text('Example'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/bloc/example/freezed');
                },
                child: const Text('Example Freezed'),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/contacts/list');
                },
                child: const Text('Contact'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('************');
                },
                child: const Text('Contact Cubit'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
