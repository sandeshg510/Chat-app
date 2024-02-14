import 'package:flutter/material.dart';

import '../../components/my_icon_buttons.dart';
import '../../components/text_buttons.dart';

class NewHomePage extends StatefulWidget {
  const NewHomePage({super.key});

  @override
  State<NewHomePage> createState() => _NewHomePageState();
}

class _NewHomePageState extends State<NewHomePage> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      backgroundColor: Colors.white10,
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8, top: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyIconButtons(
                      onPressed: () {
                        _globalKey.currentState!.openDrawer();
                      },
                      icon: Icons.menu_rounded,
                    ),
                    MyIconButtons(
                      onPressed: () {},
                      icon: Icons.search_sharp,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
                child: ListView(
                  padding: const EdgeInsets.only(left: 8),
                  scrollDirection: Axis.horizontal,
                  children: const [
                    MyTextButton(
                      title: 'Messages',
                    ),
                    MyTextButton(
                      title: 'Online',
                    ),
                    MyTextButton(
                      title: 'Groups',
                    ),
                    MyTextButton(
                      title: 'More',
                    ),
                  ],
                ),
              )
            ],
          ),
          Positioned(
            top: 170,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.only(left: 25, top: 15, right: 25),
              height: 220,
              decoration: const BoxDecoration(
                color: Color(0xff27c1a9),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Favourite Contacts',
                          style: TextStyle(
                            color: Colors.white,
                          )),
                      MyIconButtons(onPressed: () {}, icon: Icons.more_horiz)
                    ],
                  ),
                  SizedBox(
                    height: 90,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: const [
                        BuildContactAvatar(
                          name: 'Sandy',
                        ),
                        BuildContactAvatar(
                          name: 'Sandy',
                        ),
                        BuildContactAvatar(
                          name: 'Sandy',
                        ),
                        BuildContactAvatar(
                          name: 'Sandy',
                        ),
                        BuildContactAvatar(
                          name: 'Sandy',
                        ),
                        BuildContactAvatar(
                          name: 'Sandy',
                        ),
                        BuildContactAvatar(
                          name: 'Sandy',
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 360,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 15),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                      topLeft: Radius.circular(40))),
              child: ListView(
                padding: const EdgeInsets.only(left: 25, right: 20),
                children: const [
                  BuildConversationRow(),
                  Divider(
                    thickness: 0.2,
                    indent: 70,
                  ),
                  BuildConversationRow(),
                  Divider(
                    thickness: 0.2,
                    indent: 70,
                  ),
                  BuildConversationRow(),
                  Divider(
                    thickness: 0.2,
                    indent: 70,
                  ),
                  BuildConversationRow(),
                  Divider(
                    thickness: 0.2,
                    indent: 70,
                  ),
                  BuildConversationRow(),
                  Divider(
                    thickness: 0.2,
                    indent: 70,
                  ),
                  BuildConversationRow(),
                  Divider(
                    thickness: 0.2,
                    indent: 70,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        height: 65,
        width: 65,
        child: FloatingActionButton(
          shape: const CircleBorder(),
          onPressed: () {},
          child: const Icon(
            Icons.edit_outlined,
            size: 30,
          ),
        ),
      ),
      drawer: Drawer(
        width: 275,
        backgroundColor: Colors.black54,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(40),
                bottomRight: Radius.circular(40))),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.black54,
            boxShadow: [
              BoxShadow(
                color: Color(0x3D000000),
                spreadRadius: 30,
                blurRadius: 20,
              ),
            ],
          ),
          child: const Padding(
            padding: EdgeInsets.fromLTRB(25, 50, 20, 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    DrawerItem(title: 'Settings', icon: Icons.arrow_back_ios),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        UserWidget(),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          'Sandesh Gore',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    DrawerItem(
                      title: 'Account',
                      icon: Icons.key_rounded,
                    ),
                    DrawerItem(title: 'Chats', icon: Icons.chat_bubble_rounded),
                    DrawerItem(
                        title: 'Notifications',
                        icon: Icons.notifications_rounded),
                    DrawerItem(
                        title: 'Data and Storage', icon: Icons.storage_rounded),
                    DrawerItem(title: 'Help', icon: Icons.help_rounded),
                    Divider(
                      height: 35,
                      color: Color(0xff27c1a9),
                    ),
                    DrawerItem(
                        title: 'Invite a friend',
                        icon: Icons.people_alt_rounded),
                  ],
                ),
                DrawerItem(title: 'Log out', icon: Icons.logout_rounded),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final String title;
  final IconData icon;
  const DrawerItem({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 25.0,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 20,
            ),
            const SizedBox(
              width: 40,
            ),
            Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}

class BuildConversationRow extends StatelessWidget {
  const BuildConversationRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                UserWidget(),
                SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'name',
                      style: TextStyle(color: Colors.grey, fontSize: 15),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Hello! How are you?',
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    )
                  ],
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  '15.30',
                  style: TextStyle(color: Colors.grey, fontSize: 10),
                ),
                SizedBox(
                  height: 15,
                ),
                CircleAvatar(
                  radius: 7,
                  backgroundColor: Color(0xff27c1a9),
                  child: Text(
                    '2',
                    style: TextStyle(fontSize: 10),
                  ),
                )
              ],
            )
          ],
        ),
      ],
    );
  }
}

class BuildContactAvatar extends StatelessWidget {
  final String name;
  const BuildContactAvatar({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: Column(
        children: [
          const UserWidget(),
          const SizedBox(
            height: 5,
          ),
          Text(
            name,
            style: const TextStyle(color: Colors.white, fontSize: 15),
          ),
        ],
      ),
    );
  }
}

class UserWidget extends StatelessWidget {
  const UserWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 32,
      backgroundColor: Colors.white,
      child: CircleAvatar(
        radius: 29,
      ),
    );
  }
}
