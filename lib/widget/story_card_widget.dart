import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class AddStoryCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => StoryCardWidget(
        title: '',
        urlImage: '',
        onClicked: () {},
      );
}

class StoryCardWidget extends StatelessWidget {
  final String title;
  final String urlImage;
  final String urlAvatar;
  final VoidCallback onClicked;

  const StoryCardWidget({
    Key key,
    @required this.title,
    @required this.urlImage,
    @required this.onClicked,
    this.urlAvatar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClicked,
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(12),
        ),
        child: buildAdd(),
      ),
    );
  }

  Widget buildAdd() => Center(
        child: Icon(Icons.add, size: 72, color: Colors.white),
      );
}
