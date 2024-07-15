import 'package:calculator/controller/NavigationController.dart';
import 'package:calculator/pages/calculator.dart';
import 'package:calculator/pages/home_page.dart';
import 'package:calculator/pages/loginPage.dart';
import 'package:calculator/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  final NavigationController controller = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() => IndexedStack(
            index: controller.currentIndex.value,
            children: [
              LoginPage(),
              RegisterPage(),
              Calculator(),
              HomePage(),
            ],
          )),
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: GNav(
            backgroundColor: Colors.black,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.grey.shade800,
            gap: 8,
            padding: const EdgeInsets.all(16),
            tabs: const [
              GButton(
                icon: Icons.login,
                text: 'Login',
              ),
              GButton(
                icon: Icons.account_box,
                text: 'Signup',
              ),
              GButton(icon: Icons.calculate, text: 'Calculator'),
              GButton(icon: Icons.home, text: 'Home'),
            ],
            selectedIndex: controller.currentIndex.value,
            onTabChange: (index) {
              controller.changePage(index);
            },
          ),
        ),
      ),
    );
  }
}
