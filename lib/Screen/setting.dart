import 'package:flutter/material.dart';

import 'auth/sign_in_screen.dart';

class Settingscreen extends StatelessWidget {
  const Settingscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: const Text("Setting"),
        centerTitle: true,
        elevation: 5,
        shadowColor: Colors.black,
        backgroundColor: const Color(0xFF17203A).withOpacity(0.8),
        foregroundColor: Colors.white,
        //automaticallyImplyLeading: false,
      ),*/

      appBar: const CostomAppBar(
        title: "Setting",
      ),
      body: Column(
        children: [
          Padding(
            //padding: const EdgeInsets.symmetric(vertical: 16.0),
            padding: const EdgeInsets.only(top: 20, left: 20),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return SignInScreen();
                }));
              },
              style: ElevatedButton.styleFrom(
                elevation: 10,
                backgroundColor: const Color(0xFF17203A).withOpacity(0.8),
                foregroundColor: Colors.white,
                fixedSize: const Size(250, 50),
                shape: const StadiumBorder(),
              ),
              child: const Text(
                "Sign Out",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CostomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CostomAppBar({super.key, required this.title});
  final String title;
  //final actions;
  //final leading;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //color: const Color.fromARGB(255, 32, 161, 44),
      //padding: const EdgeInsets.only(top: 10),
      /*decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15))),*/
      appBar: AppBar(
        title: const Text("設定"),
        centerTitle: true,
        toolbarHeight: 60,
        elevation: 5,
        shadowColor: Colors.black,
        backgroundColor: const Color(0xFF17203A).withOpacity(0.8),
        foregroundColor: Colors.white,
        leading: const Icon(Icons.settings),
        actions: [
          PopupMenuButton(onSelected: (value) {
            // your logic
          }, itemBuilder: (BuildContext context) {
            return const [
              PopupMenuItem(
                //value: '/hello',
                child: Text(
                  "可以",
                ),
              ),
              PopupMenuItem(
                //value: '/about',
                child: Text("多放"),
              ),
              PopupMenuItem(
                //value: '/contact',
                child: Text("功能"),
              )
            ];
          })
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
