import 'package:chat_ui_stream_ii_example/api/stream_user_api.dart';
import 'package:chat_ui_stream_ii_example/page/createroom/create_room_page.dart';
import 'package:chat_ui_stream_ii_example/widget/profile_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart' hide User;
import 'package:chat_ui_stream_ii_example/model/user.dart';

class ParticipantsPage extends StatefulWidget {
  @override
  _ParticipantsPageState createState() => _ParticipantsPageState();
}

class _ParticipantsPageState extends State<ParticipantsPage> {
  Future<List<User>> allUsers;
  List<User> selectedUsers = [];

  @override
  void initState() {
    super.initState();

    allUsers = StreamUserApi.getAllUsers();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Add Participants'),
          actions: [
            TextButton(
              child: Text('CREATE'),
              onPressed: selectedUsers.isEmpty
                  ? null
                  : () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            CreateRoomPage(participants: selectedUsers),
                      ));
                    },
            ),
            const SizedBox(width: 8),
          ],
        ),
        body: FutureBuilder<List<User>>(
          future: allUsers,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              default:
                if (snapshot.hasError) {
                  return Center(child: Text('Something Went Wrong Try later'));
                } else {
                  final users = snapshot.data
                      .where((User user) =>
                          user.idUser != StreamChat.of(context).user.id)
                      .toList();

                  return buildUsers(users);
                }
            }
          },
        ),
      );

  Widget buildUsers(List<User> users) => ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];

          return CheckboxListTile(
            value: selectedUsers.contains(user),
            onChanged: (isAdded) => setState(() =>
                isAdded ? selectedUsers.add(user) : selectedUsers.remove(user)),
            title: Row(
              children: [
                ProfileImageWidget(imageUrl: user.imageUrl),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    user.name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          );
        },
      );
}
