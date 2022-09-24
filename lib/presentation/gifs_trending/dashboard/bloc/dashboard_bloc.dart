import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_sumer/domain/usescases/dashboard_usecase.dart';
import 'dashboard_event.dart';
import 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {

  final DashboardUsecase dashboardUsecase;

  DashboardBloc({required this.dashboardUsecase}) : super(InitialGif()) {
    on((event, emit) async {
      switch (event.runtimeType) {
        case FetchGifs:
          await _mapFetchGifState(event as FetchGifs, emit);
          break;
        case SearchGifs:
          await _mapSearchGifState(event as SearchGifs, emit);
          break;
      }
    });
  }

  Future<void> _mapFetchGifState(FetchGifs event, Emitter<DashboardState> emit) async {
    emit(LoadingGif(items: state.items));
    try {
      final items = await dashboardUsecase.getAll();
      emit(LoadedGif(items: items));
    } catch (e) {
      emit(ErrorGif(error: e.toString()));
    }
  }

  Future<void> _mapSearchGifState(SearchGifs event, Emitter<DashboardState> emit) async {
    emit(LoadingGif(items: state.items));
    try {
      final items = await dashboardUsecase.search(event.query);
      if (items.isEmpty) {
        emit(NoMatchGif());
      } else {
        emit(LoadedGif(items: items));
      }
    } catch (e) {
      emit(ErrorGif(error: e.toString()));
    }
  }

}