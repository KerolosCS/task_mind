import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_mind/Features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:task_mind/Features/home/presentation/manager/cubit/navigation_cubit.dart';
import 'package:task_mind/core/constants.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    context.read<HomeCubit>().getHomeData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          body: context
              .read<NavigationCubit>()
              .screens1[context.read<NavigationCubit>().currIndex],
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: primaryColor,
            type: BottomNavigationBarType.fixed,
            currentIndex: context.watch<NavigationCubit>().currIndex,
            onTap: (value) {
              context.read<NavigationCubit>().changeIndex(value);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_circle,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_outline),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_outlined),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.more_horiz_sharp),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: '',
              ),
            ],
          ),
        );
      },
    );
  }
}

// class CustomBottomNavBar extends StatelessWidget {
//   const CustomBottomNavBar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     PersistentTabController controller;
//     controller = PersistentTabController(initialIndex: 0);

//     return SizedBox(
//       child: PersistentTabView(
//         context,
//         controller: controller,
//         screens: context.read<HomeCubit>().screens,
//         items: context.read<HomeCubit>().navBarsItems,
//         confineInSafeArea: true,
//         backgroundColor: Colors.white,
//         handleAndroidBackButtonPress: true,
//         resizeToAvoidBottomInset: true,
//         stateManagement: true,
//         hideNavigationBarWhenKeyboardShows: true,
//         decoration: NavBarDecoration(
//           borderRadius: BorderRadius.circular(10.0),
//           colorBehindNavBar: Colors.white,
//         ),
//         popAllScreensOnTapOfSelectedTab: true,
//         popActionScreens: PopActionScreensType.all,
//         itemAnimationProperties: const ItemAnimationProperties(
//           duration: Duration(milliseconds: 200),
//           curve: Curves.ease,
//         ),
//         screenTransitionAnimation: const ScreenTransitionAnimation(
//           animateTabTransition: true,
//           curve: Curves.ease,
//           duration: Duration(milliseconds: 200),
//         ),
//         navBarStyle:
//             NavBarStyle.style1, // Choose the nav bar style with this property.
//       ),
//     );
//   }
// }
