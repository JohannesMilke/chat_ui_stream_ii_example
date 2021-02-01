import 'package:chat_ui_stream_ii_example/api/stream_channel_api.dart';
import 'package:chat_ui_stream_ii_example/api/stream_user_api.dart';
import 'package:chat_ui_stream_ii_example/page/participants_page.dart';
import 'package:chat_ui_stream_ii_example/widget/profile_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class ActiveUsersRowWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => buildCreateRoom(context);

  Widget buildCreateRoom(BuildContext context) => GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ParticipantsPage()),
        ),
        child: Container(
          width: 75,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey.shade100,
                child: Icon(Icons.video_call, size: 28, color: Colors.black),
                radius: 25,
              ),
              Text(
                'Create\nRoom',
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
      );
}
