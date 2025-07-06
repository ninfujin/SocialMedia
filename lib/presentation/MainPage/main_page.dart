import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/core/colors.dart';
import 'package:social_media/presentation/AddAndEditPost/add_post_screen.dart';
import 'package:social_media/BLoC/bottomNavigation/bottom_navigation_cubit.dart';
import 'package:social_media/presentation/Home/home_screen.dart';
import 'package:social_media/presentation/Suggestion/suggestion_screen.dart';
import 'package:social_media/presentation/Explore/explore_screen.dart';
import 'package:social_media/presentation/Profile/profile_screen.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  static List<Widget> screens = [
    const HomeScreen(),
    const ExploreScreen(),
    const AddPostScreen(),
    const SuggestionScreen(),
    const ProfileScreen(),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocConsumer<BottomNavigationCubit, BottomNavigationState>(
      listener: (context, state) {
        if (state is BottomNavigationInitial) {
          currentIndex = state.index;
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: screens[currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: transparentColor,
            unselectedItemColor:
                theme.brightness == Brightness.dark ? whiteColor : blackColor,
            selectedItemColor: primaryColor,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            currentIndex: currentIndex,
            enableFeedback: true,
            onTap: (value) {
              context
                  .read<BottomNavigationCubit>()
                  .bottomNvigationButtonClick(index: value);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "主页",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: "发现",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add),
                label: "添加",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.diversity_3_rounded),
                label: "建议",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "我的",
              )
            ],
          ),
        );
      },
    );
  }
}
