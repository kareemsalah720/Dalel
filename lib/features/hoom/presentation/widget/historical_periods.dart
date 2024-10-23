import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/widgets/custom_shimmer_category.dart';
import 'package:dalel/features/hoom/data/model/historical_periods_model.dart';
import 'package:dalel/features/hoom/presentation/widget/historical_period_item.dart';
import 'package:flutter/material.dart';

class HistoricalPeriods extends StatelessWidget {
  const HistoricalPeriods({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance
            .collection(FirebaseStrings.historicalperiods)
            .get(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text("Something went wrong");
          }

          if (snapshot.hasData && !snapshot.data!.docs[0].exists) {
            return const Text("Document does not exist");
          }

          if (snapshot.connectionState == ConnectionState.done) {
            List<HistoricalPeriodsModel> historicalperiods = [];
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              historicalperiods
                  .add(HistoricalPeriodsModel.fromJson(snapshot.data!.docs[i]));
            }
            return SizedBox(
                height: 96,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 20,
                  ),
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) => HistoricalPeriodsItem(
                    model: historicalperiods[index],
                  ),
                ));
          }
          return const CustomShimmerCategory();
        });
  }
}
