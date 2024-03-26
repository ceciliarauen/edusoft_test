import 'dart:async';
import 'dart:convert';
import 'package:edusoft/app/core/models/name_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

abstract class NamesEvent {}

class FetchNames extends NamesEvent {}

abstract class NamesState {}

class NamesLoading extends NamesState {}

class NamesLoaded extends NamesState {
  final List<NameModel> names;

  NamesLoaded({required this.names});
}

class NamesError extends NamesState {}

class NamesBloc extends Bloc<NamesEvent, NamesState> {
  final http.Client httpClient;

  NamesBloc({required this.httpClient}) : super(NamesLoading()) {
    on<FetchNames>(_fetchNames);
  }

  Future<void> _fetchNames(FetchNames event, Emitter<NamesState> emit) async {
    try {
      final response = await httpClient.get(
        Uri.parse('https://servicodados.ibge.gov.br/api/v2/censos/nomes'),
      );
      if (response.statusCode == 200) {
        final List<dynamic> namesJson = json.decode(response.body);
        final List<NameModel> names =
            namesJson.map((json) => NameModel.fromJson(json)).toList();
        emit(NamesLoaded(names: names));
      } else {
        emit(
          NamesError(),
        );
      }
    } catch (_) {
      emit(
        NamesError(),
      );
    }
  }
}
