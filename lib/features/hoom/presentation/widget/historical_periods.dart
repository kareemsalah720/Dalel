import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dalel/core/functions/custom_toast.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/widgets/custom_shimmer_category.dart';
import 'package:dalel/features/hoom/data/model/historical_periods_model.dart';
import 'package:dalel/features/hoom/presentation/cubit/hoom_cubit.dart';
import 'package:dalel/features/hoom/presentation/cubit/hoom_state.dart';
import 'package:dalel/features/hoom/presentation/widget/historical_period_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoricalPeriods extends StatelessWidget {
  const HistoricalPeriods({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HoomCubit, HoomState>(
      listener: (context, state) {
        if (state is GetHistoricalPeriodErrorState) {
          showToast(state.errormessage);
        }
      },
      builder: (context, state) {
        return state is GetHistoricalPeriodLoadingState
            ? const CustomShimmerCategory()
            : SizedBox(
                height: 96,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 20,
                  ),
                  clipBehavior: Clip.none,
                  itemCount: context.read<HoomCubit>().historicalPeriods.length,
                  itemBuilder: (context, index) => HistoricalPeriodsItem(
                    model: context.read<HoomCubit>().historicalPeriods[index],
                  ),
                ));
      },
    );
  }
}
