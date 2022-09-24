import 'package:equatable/equatable.dart';

abstract class DashboardEvent extends Equatable {}

class FetchGifs extends DashboardEvent {
  FetchGifs();

  @override
  List<Object> get props => [];
}

class SearchGifs extends DashboardEvent {
  String query;
  SearchGifs(this.query);

  @override
  List<Object> get props => [query];
}