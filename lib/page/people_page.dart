import 'package:chat_ui_stream_ii_example/widget/stories_grid_widget.dart';
import 'package:flutter/material.dart';

class PeoplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Column(
        children: [
          const SizedBox(height: 12),
          TabBar(
            indicatorPadding: EdgeInsets.symmetric(horizontal: 8),
            tabs: [
              Tab(
                child: Text(
                  'STORIES',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                StoriesGridWidget(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
