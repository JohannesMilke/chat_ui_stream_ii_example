import 'package:chat_ui_stream_ii_example/widget/active_users_row_widget.dart';
import 'package:chat_ui_stream_ii_example/widget/chats_widget.dart';
import 'package:flutter/material.dart';

class ChatsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Column(
        children: [
          const SizedBox(height: 12),
          Container(
            height: 100,
            child: ActiveUsersRowWidget(),
          ),
          Divider(),
          Expanded(child: ChatsWidget()),
        ],
      );
}
