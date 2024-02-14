import 'package:chat_messenger/constants/constants.dart';
import 'package:chat_messenger/pages/user_profile.dart';
import 'package:chat_messenger/src/features/auth/presentation/providers/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/build_contact_avatar.dart';
import '../components/drawer_item.dart';
import '../components/my_icon_buttons.dart';
import '../components/text_buttons.dart';
import '../components/user_widget.dart';
import 'chat_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // instance of auth
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // sign out user
  void signOut() {
    // get auth service
    final authService = Provider.of<AuthService>(context, listen: false);
    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _globalKey = GlobalKey();

    return Scaffold(
      key: _globalKey,
      backgroundColor: const Color(0xff0e1111),
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
                      onPressed: signOut,
                      icon: Icons.logout_rounded,
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
                color: kPrimaryColor,
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
                  SizedBox(height: 90, child: _buildHorizontalUserList())
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
              child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('users')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return const Text('Error');
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Text('Loading');
                    }
                    return ListView(
                      children: snapshot.data!.docs
                          .map<Widget>((doc) => _buildUserListItem(doc))
                          .toList(),
                    );
                  }),
            ),
          ),
        ],
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
          child: Padding(
            padding: const EdgeInsets.fromLTRB(25, 50, 20, 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    DrawerItem(
                      title: 'Settings',
                      icon: Icons.arrow_back_ios,
                      onTap: () {},
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Row(
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
                    const SizedBox(
                      height: 30,
                    ),
                    DrawerItem(
                      title: 'Account',
                      icon: Icons.key_rounded,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const UserProfile()));
                      },
                    ),
                    DrawerItem(
                      title: 'Chats',
                      icon: Icons.chat_bubble_rounded,
                      onTap: () {},
                    ),
                    DrawerItem(
                      title: 'Notifications',
                      icon: Icons.notifications_rounded,
                      onTap: () {},
                    ),
                    DrawerItem(
                      title: 'Data and Storage',
                      icon: Icons.storage_rounded,
                      onTap: () {},
                    ),
                    DrawerItem(
                      title: 'Help',
                      icon: Icons.help_rounded,
                      onTap: () {},
                    ),
                    const Divider(
                      height: 35,
                      color: kPrimaryColor,
                    ),
                    DrawerItem(
                      title: 'Invite a friend',
                      icon: Icons.people_alt_rounded,
                      onTap: () {},
                    ),
                  ],
                ),
                DrawerItem(
                  title: 'Log out',
                  icon: Icons.logout_rounded,
                  onTap: signOut,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // build a list of users except for the current logged in user
  Widget _buildUserList() {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text('Error');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('Loading');
          }
          return ListView(
            children: snapshot.data!.docs
                .map<Widget>((doc) => _buildUserListItem(doc))
                .toList(),
          );
        });
  }

  // build individual user list items
  Widget _buildUserListItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

    // display all users except current user
    if (_auth.currentUser!.uid != data['uid']) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatPage(
                  receiverUserEmail: data['email'],
                  receiverUserId: data['uid'],
                  receiversName: data['name'],
                ),
              ),
            );
          },
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const UserWidget(),
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data['name'],
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 15),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            'Hello! How are you?',
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          )
                        ],
                      ),
                    ],
                  ),
                  const Column(
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
                        backgroundColor: kPrimaryLightColor,
                        child: Text(
                          '2',
                          style: TextStyle(fontSize: 10),
                        ),
                      )
                    ],
                  )
                ],
              ),
              const Divider(
                thickness: 0.2,
                indent: 70,
              ),
            ],
          ),
        ),
      );

      //   Column(
      //   children: [
      //     ListTile(
      //       leading: const UserWidget(),
      //       subtitle: Text(data['email']),
      //       title: Text(data['name']),
      //       onTap: () {
      //         // pass the clicked user's UID to the chat page
      //         Navigator.push(
      //           context,
      //           MaterialPageRoute(
      //             builder: (context) => ChatPage(
      //               receiverUserEmail: data['email'],
      //               receiverUserId: data['uid'],
      //               receiversName: data['name'],
      //             ),
      //           ),
      //         );
      //       },
      //     ),
      //     const Divider(
      //       thickness: 0.2,
      //       indent: 70,
      //     ),
      //   ],
      // );
    } else {
      return Container();
    }
  }

  Widget _buildHorizontalUserList() {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text('Error');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('Loading');
          }
          return ListView(
            scrollDirection: Axis.horizontal,
            children: snapshot.data!.docs
                .map<Widget>((doc) => _buildHorizontalUserListItem(doc))
                .toList(),
          );
        });
  }

  Widget _buildHorizontalUserListItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

    // display all users except current user
    if (_auth.currentUser!.uid != data['uid']) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatPage(
                  receiverUserEmail: data['email'],
                  receiverUserId: data['uid'],
                  receiversName: data['name'],
                ),
              ),
            );
          },
          child: BuildContactAvatar(
            name: data['name'],
          ),
        ),
      );

      //   Column(
      //   children: [
      //     ListTile(
      //       leading: const UserWidget(),
      //       subtitle: Text(data['email']),
      //       title: Text(data['name']),
      //       onTap: () {
      //         // pass the clicked user's UID to the chat page
      //         Navigator.push(
      //           context,
      //           MaterialPageRoute(
      //             builder: (context) => ChatPage(
      //               receiverUserEmail: data['email'],
      //               receiverUserId: data['uid'],
      //               receiversName: data['name'],
      //             ),
      //           ),
      //         );
      //       },
      //     ),
      //     const Divider(
      //       thickness: 0.2,
      //       indent: 70,
      //     ),
      //   ],
      // );
    } else {
      return Container();
    }
  }
}
