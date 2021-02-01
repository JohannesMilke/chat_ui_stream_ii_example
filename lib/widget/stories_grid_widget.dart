import 'package:chat_ui_stream_ii_example/widget/story_card_widget.dart';
import 'package:flutter/material.dart';

class StoriesGridWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double padding = 10;

    return GridView.builder(
      itemCount: 1,
      padding: EdgeInsets.all(padding),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 4,
      ),
      itemBuilder: (context, index) {
        if (index == 0) {
          return AddStoryCardWidget();
        } else {
          return Container();
        }
      },
    );
  }
}
