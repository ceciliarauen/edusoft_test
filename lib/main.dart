import 'package:edusoft/app/core/bloc/name_bloc.dart';
import 'package:edusoft/app/core/ui/screens/list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nomes do Censo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) =>
            NamesBloc(httpClient: http.Client())..add(FetchNames()),
        child: const ListScreen(),
      ),
    );
  }
}
