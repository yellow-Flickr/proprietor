import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proprietor/src/features/tenants/presentation/add_tenant.dart';
import 'package:proprietor/src/features/tenants/presentation/tenant_list.dart';
import 'package:sizer/sizer.dart';
import 'package:proprietor/src/shared/widgets/circles_paint.dart';
import 'package:proprietor/src/shared/widgets/dashboard_menu.dart';

class TenancyHome extends ConsumerWidget {
  const TenancyHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var theme = Theme.of(context);
    List<(String, dynamic, String)> menuItems = [
      ('Add Tenant', Icons.group_add, AddTenant.routeName),
      ('Tenants List', Icons.groups_rounded, TenantList.routeName),
      ('Lease', Icons.bar_chart_rounded, ''),
      ('Send Notices', Icons.send_outlined, ''),
    ];
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 3.w),
      children: [
        SizedBox(
          height: 35.h,
          child: GridView(
            scrollDirection: Axis.horizontal,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: .6,
              crossAxisSpacing: 0,
            ),
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: .3.h),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    padding: EdgeInsets.all(2.h),
                    width: 40.w,
                    height: 10.h,
                    decoration: BoxDecoration(color: theme.primaryColor),

                    child: CustomPaint(
                      painter: CirclesPaint(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Text(
                              'TEST RESULTS ARE OUT!',
                              style: theme.textTheme.headlineMedium?.copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const Expanded(
                            flex: 2,
                            child: Icon(
                              Icons.shopping_basket,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                    //width: width*0.8,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: .3.h),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    padding: EdgeInsets.all(2.h),
                    width: 40.w,
                    height: 10.h,
                    decoration: BoxDecoration(color: theme.primaryColor),

                    child: CustomPaint(
                      painter: CirclesPaint(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Text(
                              'TEST RESULTS ARE OUT!',
                              style: theme.textTheme.headlineMedium?.copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const Expanded(
                            flex: 2,
                            child: Icon(
                              Icons.shopping_basket,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                    //width: width*0.8,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: .3.h),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    padding: EdgeInsets.all(2.h),
                    width: 40.w,
                    height: 10.h,
                    decoration: BoxDecoration(color: theme.primaryColor),

                    child: CustomPaint(
                      painter: CirclesPaint(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Text(
                              'TEST RESULTS ARE OUT!',
                              style: theme.textTheme.headlineMedium?.copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const Expanded(
                            flex: 2,
                            child: Icon(
                              Icons.shopping_basket,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                    //width: width*0.8,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: .3.h),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    padding: EdgeInsets.all(2.h),
                    width: 40.w,
                    height: 10.h,
                    decoration: BoxDecoration(color: theme.primaryColor),

                    child: CustomPaint(
                      painter: CirclesPaint(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Text(
                              'TEST RESULTS ARE OUT!',
                              style: theme.textTheme.headlineMedium?.copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const Expanded(
                            flex: 2,
                            child: Icon(
                              Icons.shopping_basket,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                    //width: width*0.8,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 2.h),
        SizedBox(
          width: 90.w,
          height: 12.h,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 1.2,
              mainAxisSpacing: 2,
              crossAxisSpacing: 2,
            ),
            itemCount: menuItems.length,
            itemBuilder: (context, index) => DashboardMenu(
              onTap: () {
                Navigator.pushNamed(context, menuItems[index].$3);
              },
              label: menuItems[index].$1,
              icon: menuItems[index].$2,
            ),
          ),
        ),
        SizedBox(height: 3.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(Icons.history_rounded, size: 22),
                Text('Recent Activites', style: theme.textTheme.titleSmall),
              ],
            ),
            GestureDetector(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('More', style: Theme.of(context).textTheme.labelMedium),
                  Icon(
                    Icons.arrow_drop_down_rounded,
                    size: 26,
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 12.h,
          child: Center(
            child: Text(
              'No Recent Activities!',
              style: theme.textTheme.labelLarge?.copyWith(color: Colors.grey),
            ),
          ),
        ),
      ],
    );
  }
}
