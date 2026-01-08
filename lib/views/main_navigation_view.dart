import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_sru/controllers/main_navigation_controller.dart';
import 'package:test_sru/views/home/book_mark/book_mark_view.dart';
import 'package:test_sru/views/home/home_view.dart';
import 'package:test_sru/views/search/search_view.dart';

import '../gen/assets.gen.dart';
import '../utils/app_style.dart';
import '../widgets/app_text.dart';

class MainNavigationView extends StatelessWidget {
  const MainNavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MainNavigationController());

    List<Widget> navMenuDashboard = [
      const HomeView(),
      const SearchView(),
      const BookMarkView(),
    ];
    return Scaffold(
      body: DoubleBackToCloseApp(
        snackBar: SnackBar(
          content: AppText(
            text: "Tekan kembali lagi untuk keluar dari aplikasi",
            textStyle: AppTextStyle.h4.copyWith(color: Colors.black),
          ),
          closeIconColor: Colors.red,
          backgroundColor: Colors.white,
          showCloseIcon: true,
        ),
        child: Obx(
          () => IndexedStack(
            index: controller.currentIndex.value,
            children: navMenuDashboard,
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0.0,
        color: Colors.white,
        child: Obx(
          () {
            final currentIndex = controller.currentIndex.value;
            return BottomNavigationBar(
              showSelectedLabels: false,
              showUnselectedLabels: false,
              currentIndex: currentIndex,
              elevation: 0.0,
              backgroundColor: Colors.white,
              onTap: (index) => controller.changeIndex(index),
              items: [
                BottomNavigationBarItem(
                  icon: () {
                    if(currentIndex == 0) {
                      return Assets.images.homeSelected.image();
                    }
                    return Assets.images.homeUnselected.image();
                  } (), 
                  label: "Home"
                ),
                 BottomNavigationBarItem(
                  icon: () {
                    if(currentIndex == 1) {
                      return Assets.images.searchSelected.image();
                    }
                    return Assets.images.searchUnselected.image();
                  } (), 
                  label: "Search"
                ),
                 BottomNavigationBarItem(
                  icon: () {
                    if(currentIndex == 2) {
                      return Assets.images.bookmarkSelected.image();
                    }
                    return Assets.images.bookmarkUnselected.image();
                  } (), 
                  label: "Bookmark"
                ),
              ]
            );
          }
        ),
      ),
    );
  }
}