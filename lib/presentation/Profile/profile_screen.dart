import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/BLoC/UserDetails/user_details_bloc.dart';
import 'package:social_media/BLoC/UserPost/user_post_bloc.dart';
import 'package:social_media/core/bacground.dart';
import 'package:social_media/core/colors.dart'; // 导入 colors.dart 以使用颜色常量
import 'package:social_media/presentation/Home/home_screen.dart';

import 'package:social_media/presentation/Profile/widgets/profile_section_one.dart';
import 'package:social_media/presentation/Profile/widgets/profile_section_two.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    // 在组件初始化时触发用户详情和用户帖子的加载事件
    context.read<UserDetailsBloc>().add(FeatchUserDetailsEvent());
    context.read<UserPostBloc>().add(FeatchAllMyPostEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; // 获取屏幕尺寸
    return Scaffold(
      // 在Scaffold中添加AppBar，这是放置返回按钮的规范位置
      appBar: AppBar(
        // leading属性用于放置AppBar左侧的Widget，通常是返回按钮
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), // 返回箭头图标
          color: blackColor, // 设置图标颜色，可以根据主题调整
          onPressed: () {
            // 点击按钮时，使用Navigator.pop返回到上一个页面
            // Navigator.of(context).pop();
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => HomeScreen()), // 导航到 MainPage
                  (route) => false, // 移除所有之前的路由，确保MainPage是新的根路由
            );
          },
        ),
        title: const Text(
          "个人资料", // 页面标题
          style: TextStyle(color: blackColor), // 设置标题颜色
        ),
        centerTitle: true, // 标题居中
        backgroundColor: Colors.transparent, // 背景透明，与页面的Background Widget融合
        elevation: 0, // 移除AppBar的阴影
        toolbarHeight: MediaQuery.of(context).size.height * 0.10, // 设置AppBar的高度为屏幕高度的20%
      ),
      body: Background(
        child: SafeArea(
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                // SliverToBoxAdapter用于将非Sliver Widget（如ProfileSectionOne）放入Sliver列表
                SliverToBoxAdapter(
                  child: ProfileSectionOne(
                    size: size, // 传递屏幕尺寸给ProfileSectionOne
                  ),
                ),
              ];
            },
            // NestedScrollView的body部分，显示ProfileSectionTwo
            body: const ProfileSectionTwo(),
          ),
        ),
      ),
    );
  }
}
