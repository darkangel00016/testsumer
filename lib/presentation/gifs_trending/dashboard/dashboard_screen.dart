import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:test_sumer/presentation/gifs_trending/dashboard/bloc/dashboard_event.dart';
import 'package:test_sumer/presentation/gifs_trending/dashboard/bloc/dashboard_state.dart';
import 'package:test_sumer/presentation/gifs_trending/dashboard/widgets/dashboard_searchbox.dart';
import 'package:test_sumer/presentation/themes/theme_color.dart';
import '../../../common/injector/injector.dart';
import '../../../domain/entities/gif_entity.dart';
import 'bloc/dashboard_bloc.dart';
import 'widgets/dashboard_item.dart';

class DashboardScreen extends StatefulWidget {
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  late DashboardBloc dashboardBloc;

  @override
  void initState() {
    super.initState();
    dashboardBloc = Injector.resolve<DashboardBloc>()..add(FetchGifs());
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: DashboardSearchbox(),
      centerTitle: false,
      automaticallyImplyLeading: false,
    ),
    body: Container(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
      child: BlocBuilder<DashboardBloc, DashboardState>(
        bloc: dashboardBloc,
        builder: (_, state) {
          return _mapStateToWidget(state);
        },
      ),
    ),
  );

  Widget _mapStateToWidget(DashboardState state) {
    switch (state.runtimeType) {
      case LoadingGif:
        return const Center(
          child: CircularProgressIndicator(
            color: AppColor.primaryColor,
            backgroundColor: Colors.transparent,
          ),
        );
      case LoadedGif:
        final List<GifEntity> items = state.items;
        return _dashboardItems(items);
      case NoMatchGif:
        return const Center(
          child: Text('No found coincidences'),
        );
      case ErrorGif:
        return Center(
          child: Text(state.error??"Error"),
        );
      default:
        return Container();
    }
  }

  Widget _dashboardItems(List<GifEntity> items) {
    return RefreshIndicator(
      onRefresh: () async {
        dashboardBloc.add(FetchGifs());
      },
      child: SingleChildScrollView(
        child: StaggeredGrid.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: items.map((item) => DashboardItem(item: item)).toList(),
        ),
      )
    );
  }
}