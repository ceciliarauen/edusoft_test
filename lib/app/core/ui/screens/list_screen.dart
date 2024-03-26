import 'package:edusoft/app/core/bloc/name_bloc.dart';
import 'package:edusoft/app/core/models/name_model.dart';
import 'package:edusoft/app/core/ui/screens/name_details_screen.dart';
import 'package:edusoft/app/core/values/design_system_colors.dart';
import 'package:edusoft/app/core/values/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: DesignSystemColors.green,
        title: const Center(
          child: Text(
            'Nomes do Censo',
          ),
        ),
      ),
      body: const ListNames(),
    );
  }
}

class ListNames extends StatelessWidget {
  const ListNames({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NamesBloc, NamesState>(
      builder: (context, state) {
        if (state is NamesLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is NamesLoaded) {
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: state.names.length,
            itemBuilder: (context, index) {
              NameModel name = state.names[index];
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NameDetailScreen(
                          currentIndex: index,
                          names: state.names,
                        ),
                      ),
                    );
                  },
                  child: Card(
                    color: DesignSystemColors.green,
                    elevation: 20,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: BorderSide.none,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Center(
                        child: Text(
                          name.name,
                          style: GoogleFonts.quicksand(
                            textStyle: TextStyles.semiBold16White,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        } else if (state is NamesError) {
          return const Center(
            child: Text(
              'Erro ao carregar os nomes.',
            ),
          );
        }
        return Container();
      },
    );
  }
}
