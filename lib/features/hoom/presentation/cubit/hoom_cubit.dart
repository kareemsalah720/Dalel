// ignore_for_file: avoid_function_literals_in_foreach_calls
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/features/hoom/data/model/historical_periods_model.dart';
import 'package:dalel/features/hoom/data/model/wars_model.dart';
import 'package:dalel/features/hoom/presentation/cubit/hoom_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HoomCubit extends Cubit<HoomState> {
  HoomCubit() : super(HoomInitial());
  List<HistoricalPeriodsModel> historicalPeriods = [];
  List<WarsModel> warsList = [];
  getHistoricalPeriods() async {
    try {
      emit(GetHistoricalPeriodLoadingState());
      await FirebaseFirestore.instance
          .collection(FirebaseStrings.historicalperiods)
          .get()
          .then((value) => value.docs.forEach((element) async {
                await getWarsList(element);
                historicalPeriods.add(
                  HistoricalPeriodsModel.fromJson(
                    element.data(),
                    warsList,
                  ),
                );
                emit(GetHistoricalPeriodSuccessState());
              }));
      
    } on Exception catch (e) {
      emit(GetHistoricalPeriodErrorState(errormessage: e.toString()));
    }
  }

  Future<void> getWarsList(QueryDocumentSnapshot<Map<String, dynamic>> element) async {
      await FirebaseFirestore.instance
        .collection(FirebaseStrings.historicalperiods)
        .doc(element.id)
        .collection(
          FirebaseStrings.wars,
        )
        .get()
        .then((value) => value.docs.forEach((element) {
              warsList.add(WarsModel.formJson(element.data()));
            }));
  }
}
