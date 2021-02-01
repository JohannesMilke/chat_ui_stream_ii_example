import 'package:chat_ui_stream_ii_example/chats_page.dart';
import 'package:chat_ui_stream_ii_example/page/people_page.dart';
import 'package:chat_ui_stream_ii_example/widget/chats_widget.dart';
import 'package:chat_ui_stream_ii_example/widget/user_image_widget.dart';
import 'package:flutter/material.dart';

class HomePageMobile extends StatefulWidget {
  @override
  _HomePageMobileState createState() => _HomePageMobileState();
}

class _HomePageMobileState extends State<HomePageMobile> {
  int tabIndex = 1;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Chats'),
          centerTitle: true,
          leading: UserImageWidget(),
          actions: [
            IconButton(icon: Icon(Icons.edit), onPressed: () {}),
            SizedBox(width: 8),
          ],
        ),
        body: IndexedStack(
          index: tabIndex,
          children: [
            ChatsPage(),
            PeoplePage(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: tabIndex,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black38,
          onTap: (index) => setState(() => tabIndex = index),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'Chats',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: 'People',
            ),
          ],
        ),
      );
}
