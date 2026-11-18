import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proprietor/src/features/properties/presentation/add_property.dart';
import 'package:proprietor/src/features/properties/presentation/property_detail.dart';
import 'package:sizer/sizer.dart';
import 'package:proprietor/src/shared/widgets/circles_paint.dart';

class PropertyList extends ConsumerStatefulWidget {
  const PropertyList({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PropertyListState();

  static const routeName = '/property_list';
}

class _PropertyListState extends ConsumerState<PropertyList> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        // title: const Text('Property List'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(6.h),
          child: CustomPaint(
            painter: CirclesPaint(),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
              decoration: BoxDecoration(
                //color: theme.colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          width: 10.w,
                          height: 10.w,
                          child: Icon(
                            Icons.business,
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
                              'Property List',
                              style: theme.textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            // Text(
                            //   'The people who you want to campaign to.',
                            //   style: theme.textTheme.bodySmall
                            //       ?.copyWith(color: Colors.white),
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AddProperty.routeName);
        },
        child: const Icon(Icons.add_business_rounded),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.5.h),
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, PropertyDetail.routeName);
            },
            child: Card(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(15),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      color: Colors.grey,
                      height: 12.h,
                      width: 30.w,
                    ),
                  ),
                  SizedBox(width: .6.w),
                  Expanded(
                    flex: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            // height: 7.h,
                            child: Text(
                              'Heights Peak Lodge',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              style: Theme.of(context).textTheme.labelLarge,
                              // ?.copyWith(fontSize: 2.h)
                            ),
                          ),
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Row(
                              //   children: [
                              //     Icon(
                              //       Icons.favorite,
                              //       color: Colors.grey,
                              //       size: 14,
                              //     ),
                              //     Text(
                              //       '45',
                              //       style: Theme.of(context)
                              //           .textTheme
                              //           .labelSmall
                              //           ?.copyWith(color: Colors.grey),
                              //     ),
                              //   ],
                              // ),
                              // Text('•'),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.person,
                                    color: Colors.grey,
                                    size: 10,
                                  ),
                                  Text(
                                    'article.addedBy.name',
                                    overflow: TextOverflow.fade,
                                    maxLines: 1,
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall
                                        ?.copyWith(
                                          color: Colors.grey,
                                          fontSize: 9.5,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 2.w),
                                child: Text(
                                  '•',
                                  style: Theme.of(context).textTheme.labelLarge!
                                      .copyWith(
                                        color: Colors.grey,
                                        fontSize: 3.h,
                                      ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'timeago.format(severFormat.parse(article.createdAt))',
                                  overflow: TextOverflow.fade,
                                  maxLines: 1,
                                  style: Theme.of(context).textTheme.labelSmall
                                      ?.copyWith(
                                        color: Colors.grey,
                                        fontSize: 9.5,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
