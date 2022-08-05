import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:registration/widgets/appbar.dart';
import 'package:registration/widgets/buttons/floating_bar_button.dart';

import '../resources/constants/colors.dart';
import '../resources/constants/path_images.dart';
import '../widgets/navigation_bar.dart';
import 'add_transaction_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      floatingActionButton: const FloatingActionButtonBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: CustomAppBar(),
      bottomNavigationBar: const FloatingNavigationBar(
        currentIndex: 0,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
                width: 250.w, height: 250.h, child: Image.asset(logoMobyte)),
            Text(user.email!),
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
