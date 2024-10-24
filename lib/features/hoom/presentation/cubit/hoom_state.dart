
sealed class HoomState {}

final class HoomInitial extends HoomState {}
final class GetHistoricalPeriodLoadingState extends HoomState {}
final class GetHistoricalPeriodSuccessState extends HoomState {}
final class GetHistoricalPeriodErrorState extends HoomState {

  final String errormessage;

  GetHistoricalPeriodErrorState({required this.errormessage});
}