import 'package:flutter/material.dart';
import 'package:test_sumer/common/injector/injector.dart';
import 'package:test_sumer/presentation/gifs_trending/dashboard/bloc/dashboard_bloc.dart';
import 'package:test_sumer/presentation/gifs_trending/dashboard/bloc/dashboard_event.dart';
import 'package:test_sumer/presentation/gifs_trending/dashboard/bloc/dashboard_state.dart';

class DashboardSearchbox extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(10)
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: const Icon(
              Icons.search,
              color: Colors.black54,
              size: 28,
            ),
          ),
          Flexible(
            child: SizedBox(
              width: double.infinity,
              child: TextField(
                decoration: const InputDecoration(
                  hintText: 'Search by name',
                  hintStyle: TextStyle(
                    color: Colors.black38,
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                  ),
                  border: InputBorder.none,
                ),
                style: const TextStyle(
                  color: Colors.black38,
                ),
                onChanged: (value) {
                  var dashboardBloc = Injector.resolve<DashboardBloc>();
                  if (value.length > 2 && dashboardBloc.state is! LoadingGif) {
                    dashboardBloc.add(SearchGifs(value));
                  }
                },
              ),
            ),
          )
        ],
      ),
    );
  }

}