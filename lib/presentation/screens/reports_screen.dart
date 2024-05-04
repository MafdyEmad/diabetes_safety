import 'package:diabetes_safety/core/theme/palette.dart';
import 'package:diabetes_safety/core/utile/shared/extentions.dart';
import 'package:diabetes_safety/cubit/sugar_cubit/sugar_cubit.dart';
import 'package:diabetes_safety/models/option_model.dart';
import 'package:diabetes_safety/models/sugar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List meal = [
      'قبل الغداء ',
      'بعد الغداء ',
      'قبل الفطار ',
      'بعد الفطار ',
      'قبل العشاء ',
      'بعد العشاء ',
    ];
    final image = Image.asset('assets/report.png');
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            Text(
              'التقارير',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            Expanded(
              child: BlocBuilder<SugarCubit, SugarState>(
                buildWhen: (previous, current) => current is SugarDelete,
                builder: (context, state) {
                  return FutureBuilder<List<Sugar>>(
                      future: context.read<SugarCubit>().getSugars(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.separated(
                            separatorBuilder: (context, index) => const SizedBox(height: 12),
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) => ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: image,
                              title: Text(
                                snapshot.data![index].added!.formattedDate,
                                style: Theme.of(context).textTheme.displayMedium,
                              ),
                              subtitle: Text(
                                'قياس السكر ${meal[snapshot.data![index].meal]} ${snapshot.data![index].body} ملغم/دل',
                                style: Theme.of(context).textTheme.displayMedium,
                              ),
                              trailing: IconButton(
                                onPressed: () {
                                  context.read<SugarCubit>().deleteSugar(snapshot.data![index].id!.toString());
                                },
                                icon: const Icon(Icons.close),
                              ),
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Text(
                              'حدث خطأ',
                              style: Theme.of(context).textTheme.displayLarge,
                            ),
                          );
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(color: AppPalette.primaryButtonColorLight),
                          );
                        }
                      });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
