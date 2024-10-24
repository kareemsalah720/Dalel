import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/features/cart/presentation/view/cart_view.dart';
import 'package:dalel/features/hoom/presentation/cubit/hoom_cubit.dart';
import 'package:dalel/features/hoom/presentation/view/hoom_view.dart';
import 'package:dalel/features/profile/presentation/view/profile_view.dart';
import 'package:dalel/features/search/presentation/view/search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

PersistentTabController _controller = PersistentTabController();

class HoomNavBarWidget extends StatelessWidget {
  const HoomNavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      items: _navBarsItems(),
      screens: _buildScreens(),
      navBarStyle: NavBarStyle.style12,
      backgroundColor: AppColors.primaryColor,
      decoration: const NavBarDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
    );
  }
}

List<Widget> _buildScreens() {
  return [
    BlocProvider(
      create: (context) => HoomCubit()..getHistoricalPeriods(),
      child: const HoomView(),
    ),
    const CartView(),
    const SearchView(),
    const ProfileView(),
  ];
}

List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.home),
      title: ("Home"),
      activeColorPrimary: AppColors.activeColorPrimary,
      inactiveColorPrimary: AppColors.inactiveColorPrimary,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.shopping_cart),
      title: ("Cart"),
      activeColorPrimary: AppColors.activeColorPrimary,
      inactiveColorPrimary: AppColors.inactiveColorPrimary,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.search),
      title: ("Search"),
      activeColorPrimary: AppColors.activeColorPrimary,
      inactiveColorPrimary: AppColors.inactiveColorPrimary,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.person),
      title: ("Profile"),
      activeColorPrimary: AppColors.activeColorPrimary,
      inactiveColorPrimary: AppColors.inactiveColorPrimary,
    ),
  ];
}
