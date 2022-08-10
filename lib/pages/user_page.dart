import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:registration/widgets/appbar.dart';

import '../models/user_model.dart';
import '../resources/constants/path_images.dart';
import '../widgets/buttons/floating_bar_button.dart';
import '../widgets/navigation_bar.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const FloatingActionButtonBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: CustomAppBar(),
      bottomNavigationBar: const FloatingNavigationBar(
        currentIndex: 3,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
                width: 250.w, height: 250.h, child: Image.asset(logoMobyte)),
             Text(thisUser.email!),
            Text(thisUser.username!),
            ElevatedButton(
              child: const Text("Sign out"),
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushNamed(context, '/login');
              },
            )
          ],
        ),
      ),
    );
  }
}
