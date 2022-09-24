import '../../../../domain/entities/gif_entity.dart';

abstract class DashboardState {
  final List<GifEntity> items;
  final bool loading;
  final String? error;
  DashboardState({required this.items, required this.loading, this.error});
}

class InitialGif extends DashboardState {
  InitialGif() : super(items: [], loading: false);
}

class LoadingGif extends DashboardState {
  LoadingGif({required List<GifEntity> items}) : super(items: [], loading: true);
}

class LoadedGif extends DashboardState {
  LoadedGif({required List<GifEntity> items}) : super(items: items, loading: false);
}

class NoMatchGif extends DashboardState {
  NoMatchGif() : super(items: [], loading: false);
}

class ErrorGif extends DashboardState {
  ErrorGif({required String error}) : super(items: [], loading: false, error: error);
}