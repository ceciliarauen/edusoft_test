import 'package:edusoft/app/core/models/name_model.dart';
import 'package:edusoft/app/core/values/design_system_colors.dart';
import 'package:edusoft/app/core/values/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NameDetailScreen extends StatelessWidget {
  final int currentIndex;
  final List<NameModel> names;

  const NameDetailScreen({
    super.key,
    required this.currentIndex,
    required this.names,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detalhes do Nome - ${names[currentIndex].name}',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Card(
              color: DesignSystemColors.paleGreenColor,
              elevation: 20,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: BorderSide.none,
              ),
              child: SizedBox(
                width: double.infinity,
                child: FittedBox(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "${names[currentIndex].rank}º - ${names[currentIndex].name} - ${names[currentIndex].frequency}",
                      style: GoogleFonts.quicksand(
                        textStyle: TextStyles.medium18Black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (currentIndex > 0)
                  ElevatedButton(
                    child: const Text('Anterior'),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NameDetailScreen(
                            currentIndex: currentIndex - 1,
                            names: names,
                          ),
                        ),
                      );
                    },
                  ),
                if (currentIndex < names.length - 1)
                  ElevatedButton(
                    child: const Text('Próximo'),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NameDetailScreen(
                            currentIndex: currentIndex + 1,
                            names: names,
                          ),
                        ),
                      );
                    },
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
