import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proprietor/src/auth/log_in.dart';
import 'package:sizer/sizer.dart';

class TenantList extends ConsumerStatefulWidget {
  const TenantList({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TenantListState();

  static const routeName = '/tenant_list';
}

class _TenantListState extends ConsumerState<TenantList> {
  int stepIndex = 0;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        // title: const Text('Add Property'),
        // shape: const RoundedRectangleBorder(
        //     borderRadius: BorderRadius.only(bottomRight: Radius.circular(0))),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(6.5.h),
          child: CustomPaint(
            painter: CirclesPaint(),
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
                decoration: BoxDecoration(
                    //color: theme.colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(5)),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                            width: 10.w,
                            height: 10.w,
                            child: Icon(
                              Icons.groups_2_sharp,
                              color: theme.primaryColor,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Tenant List',
                                style: theme.textTheme.titleSmall?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                              Text(
                                'The people who you want to campaign to.',
                                style: theme.textTheme.bodySmall
                                    ?.copyWith(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
        children: [
          Card(
            color: theme.primaryColor,
            shape: const RoundedRectangleBorder(
              // side: BorderSide(
              //   color: theme.primaryColor,
              // ),
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(5),
              ),
            ),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
              height: 26.h,
              child: CustomPaint(
                painter: CirclesPaint(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 18.w,
                          height: 18.w,
                          color: Colors.white,
                          child: Icon(
                            Icons.person,
                            color: theme.primaryColor,
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Morrison Monroe',
                                textAlign: TextAlign.center,
                                style: theme.textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.amber.shade800),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.location_on,
                                    color: Colors.white60,
                                    size: 12,
                                  ),
                                  Text(
                                    'Morrison Monroe',
                                    style: theme.textTheme.labelSmall?.copyWith(
                                        fontSize: 9,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white60),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Expanded(
                      child: Text(
                        'The Lester B. Pearson International Scholarships at the University of  Toronto provide an unparalleled opportunity for outstanding international students to study at one of the world’s best universities in one of the world’s most multicultural cities. The scholarship program is intended to recognize students who demonstrate exceptional academic achievement and creativity and who are recognized as leaders within their school.',
                        maxLines: 3,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.bodySmall
                            ?.copyWith(color: Colors.white, fontSize: 9),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
