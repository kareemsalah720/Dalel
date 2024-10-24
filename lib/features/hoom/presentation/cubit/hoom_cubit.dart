import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/features/hoom/data/model/historical_periods_model.dart';
import 'package:dalel/features/hoom/presentation/cubit/hoom_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HoomCubit extends Cubit<HoomState> {
  HoomCubit() : super(HoomInitial());
  List<HistoricalPeriodsModel> historicalPeriods = [];
  getHistoricalPeriods() async {
    try {
      emit(GetHistoricalPeriodLoadingState());
      await FirebaseFirestore.instance
          .collection(FirebaseStrings.historicalperiods)
          .get()
          .then((value) => value.docs.forEach((element) {
                historicalPeriods.add(
                  HistoricalPeriodsModel.fromJson(
                    element.data(),
                  ),
                );
              }));

      emit(GetHistoricalPeriodSuccessState());
    } on Exception catch (e) {
      emit(GetHistoricalPeriodErrorState(errormessage: e.toString()));
    }
  }
}
