import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proprietor/src/features/administration/presentation/administration_home.dart';
import 'package:proprietor/src/features/auth/presentation/log_in.dart';
import 'package:proprietor/src/features/payments/presentation/payments_home.dart';
import 'package:proprietor/src/features/properties/presentation/properties_home.dart';
import 'package:proprietor/src/features/tenants/presentation/tenancy_home.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:sizer/sizer.dart';

class Dashboard extends ConsumerStatefulWidget {
  const Dashboard({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DashboardState();

  static const routeName = '/dashboard';
}

class _DashboardState extends ConsumerState<Dashboard> {
  final _advancedDrawerController = AdvancedDrawerController();
  int _currentIndex = 0;

  void _onTabSelected(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AdvancedDrawer(
        openRatio: .60,
        backdrop: Container(
          width: double.infinity,
          height: double.infinity,
          color: theme.primaryColor,
          child: Transform.scale(
              scale: 2,
              child: CustomPaint(
                painter: CirclesPaint(),
              )),
        ),
        controller: _advancedDrawerController,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
        animateChildDecoration: true,
        rtlOpening: false,
        // openScale: 1.0,
        disabledGestures: false,
        childDecoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        drawer: SafeArea(
            child: ListTileTheme(
                textColor: Colors.white,
                iconColor: Colors.white,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 20.w,
                          height: 20.w,
                          margin: EdgeInsets.only(
                            top: 24.0,
                            bottom: 2.h,
                          ),
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.person,
                            color: theme.primaryColor,
                            size: 15.w,
                          ),
                        ),
                        Text(
                          'Bill John',
                          style: theme.textTheme.headlineLarge?.copyWith(
                              color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'College Student',
                          style: theme.textTheme.labelLarge
                              ?.copyWith(color: Colors.white54),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    ListTile(
                      onTap: () {},
                      leading: const Icon(Icons.home),
                      title: const Text('Home'),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: const Icon(Icons.cast_for_education_rounded),
                      title: const Text('My Class'),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: const Icon(Icons.task_alt_rounded),
                      title: const Text('My Tasks'),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: const Icon(Icons.calendar_month_outlined),
                      title: const Text('Schedules'),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: const Icon(Icons.chat_bubble),
                      title: const Text('Messages'),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: const Icon(Icons.settings),
                      title: const Text('Settings'),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    ListTile(
                      onTap: () {},
                      leading: const Icon(Icons.exit_to_app_rounded),
                      title: const Text('Log out'),
                    ),
                    const Spacer(),
                    DefaultTextStyle(
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white54,
                      ),
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 16.0,
                        ),
                        child: const Text('Terms of Service | Privacy Policy'),
                      ),
                    ),
                  ],
                ))),
        child: Scaffold(
          appBar: AppBar(
            titleSpacing: 0,
            leadingWidth: 12.w,
            leading: IconButton(
              onPressed: () {
                _advancedDrawerController.showDrawer();
              },
              icon: ValueListenableBuilder<AdvancedDrawerValue>(
                valueListenable: _advancedDrawerController,
                builder: (_, value, __) {
                  return AnimatedSwitcher(
                    duration: const Duration(milliseconds: 250),
                    child: Icon(
                      Icons.window,
                      size: 7.w,
                      key: ValueKey<bool>(value.visible),
                    ),
                  );
                },
              ),
            ),
            // Icon(
            //   Icons.list_alt_rounded,
            //   size: 7.w,
            //   color: theme.primaryColor,
            // ),
            title: const Text(
              'Proprietor',
            ),
            centerTitle: true,
            actions: [
              Icon(
                Icons.notifications_active_rounded,
                color: theme.primaryColor,
                size: 6.w,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w),
                child: CircleAvatar(
                  backgroundColor: theme.primaryColor,
                  radius: 3.5.w,
                  child: const Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
          body: IndexedStack(
            index: _currentIndex,
            children: const [
              PropertiesHome(),
              TenancyHome(),
              AdministrationHome(),
              PaymentsHome(),
             ],
          ),
          bottomNavigationBar: BottomNavBar(
            currentIndex: _currentIndex,
            onTap: _onTabSelected,
          ),
        ));
  }
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SalomonBottomBar(
      currentIndex: currentIndex,
      backgroundColor: theme.colorScheme.surfaceContainer,
      unselectedItemColor: Colors.grey,
      selectedItemColor: theme.colorScheme.inversePrimary,
      selectedColorOpacity: .3,
      itemShape: const StadiumBorder(),
      // itemPadding: currentIndex==2?  EdgeInsets.symmetric(vertical: 10, horizontal: 10): EdgeInsets.symmetric(vertical: 10, horizontal: 16) ,
      onTap: onTap,
      items: [
        SalomonBottomBarItem(
          icon: const Icon(Icons.roofing_rounded),
          activeIcon: Icon(
            Icons.business_rounded,
            color: theme.primaryColor,
          ),
          title: Text(
            "properties",
            style: Theme.of(context)
                .textTheme
                .labelSmall
                ?.copyWith(color: theme.primaryColor),
          ),
        ),
        SalomonBottomBarItem(
          icon: const Icon(Icons.people_alt),
          activeIcon: Icon(
            Icons.groups_2_sharp,
            color: theme.primaryColor,
          ),
          title: Text(
            "tenancy",
            style: Theme.of(context)
                .textTheme
                .labelSmall
                ?.copyWith(color: theme.primaryColor),
          ),
        ),
        SalomonBottomBarItem(
          icon: const Icon(Icons.receipt_long_rounded),
          activeIcon: Icon(
            Icons.history_edu,
            color: theme.primaryColor,
          ),
          title: Text(
            "administration",
            style: Theme.of(context)
                .textTheme
                .labelSmall
                ?.copyWith(color: theme.primaryColor),
          ),
        ),

        // SalomonBottomBarItem(
        //   icon: const Icon(Icons.shopping_bag_rounded),
        //   activeIcon: const Icon(
        //     Icons.shop,
        //     color: Colors.white,
        //   ),
        //   title: Text(
        //     "shop",
        //     style: Theme.of(context)
        //         .textTheme
        //         .labelSmall
        //         ?.copyWith(color: Colors.white),
        //   ),
        // ),
        SalomonBottomBarItem(
          icon: const Icon(Icons.monetization_on_rounded),
          activeIcon: Icon(
            Icons.savings_rounded,
            color: theme.primaryColor,
          ),
          title: Text(
            "payments",
            style: Theme.of(context)
                .textTheme
                .labelSmall
                ?.copyWith(color: theme.primaryColor),
          ),
        ),
      ],
    );
  }
}
