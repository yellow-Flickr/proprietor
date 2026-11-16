import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';
import 'package:proprietor/src/shared/widgets/circles_paint.dart';

class Maintenance extends ConsumerStatefulWidget {
  const Maintenance({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MaintenanceState();

  static const routeName = '/maintenance';
}

class _MaintenanceState extends ConsumerState<Maintenance> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
        appBar: AppBar(
          // title: const Text('Property List'),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            // IconButton(
            //     onPressed: () {
            //       setState(() {
            //         isDeleting = !isDeleting;
            //       });
            //     },
            //     icon: const Icon(Icons.delete))
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(6.h),
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
                                  'Maintenance',
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
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await _dialogBuilder(context);
          },
          child: const Icon(Icons.build),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.5.h),
          children: [
            Card.outlined(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: theme.primaryColor,
                ),
                borderRadius: const BorderRadius.horizontal(
                  left: Radius.circular(5),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 15.h,
                    padding:
                        EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
                    color: theme.primaryColor,
                    child: CustomPaint(
                      painter: CirclesPaint(),
                      child: Column(
                        children: [
                          Text(
                            'Broken Pipe Plumbing',
                            style: theme.textTheme.titleSmall?.copyWith(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Heights Peak Room 6',
                            style: theme.textTheme.bodySmall?.copyWith(
                                color: Colors.white54,
                                fontSize: 9,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 1.5.h,
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
                  Container(
                    height: 8.h,
                    padding: EdgeInsets.symmetric(vertical: 1.h),
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            backgroundColor: theme.colorScheme.error,
                            textStyle: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(color: Colors.white),
                          ),
                          child: Text(
                            'Delete',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(color: Colors.white),
                          ),
                          onPressed: () {
                            // context.read<TimerStates>().addtimer(TimerModel(
                            //       id: 0,
                            //       title: 'Pomodoro Workout',
                            //       countDown: const Duration(minutes: 1),
                            //     ));
                          },
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            backgroundColor: Colors.amber.shade800,
                            textStyle: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(color: Colors.white),
                          ),
                          child: Text(
                            'Edit',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(color: Colors.white),
                          ),
                          onPressed: () async {
                            await _dialogBuilder(context, editMaitenance: true);
                          },
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            backgroundColor: theme.primaryColor,
                            textStyle: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(color: Colors.white),
                          ),
                          child: Text(
                            'Done',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(color: Colors.white),
                          ),
                          onPressed: () async {
                           },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }

  Future<bool> _dialogBuilder(BuildContext context,
      {bool editMaitenance = false}) {
    var theme = Theme.of(context);

    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder:
              (BuildContext context, void Function(void Function()) setState) =>
                  AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            title: Text(
                !editMaitenance ? 'Add Maitenance Task' : 'Task Detail'),
            content: Wrap(
              spacing: 1.5.h,
              runSpacing: 1.5.h,
              children: [
                TextField(
                  maxLines: 1,
                  style: theme.textTheme.bodySmall,
                  // controller: title,
                  decoration: const InputDecoration(
                    isDense: true,
                    prefixIcon: Icon(
                      Icons.title_rounded,
                      color: Colors.grey,
                    ),
                    hintText: 'Task Label',
                  ),
                ),
                TextField(
                  maxLines: 1,
                  style: theme.textTheme.bodySmall,
                  // controller: title,
                  decoration: const InputDecoration(
                    isDense: true,
                    prefixIcon: Icon(
                      Icons.house,
                      color: Colors.grey,
                    ),
                    hintText: 'Location',
                  ),
                ),
                TextField(
                  maxLines: 4,
                  style: theme.textTheme.bodySmall,
                  // controller: title,
                  decoration: const InputDecoration(
                    isDense: true,
                    prefixIcon: Icon(
                      Icons.description,
                      color: Colors.grey,
                    ),
                    hintText: 'Description',
                  ),
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context)
                      .textTheme
                      .labelLarge
                      ?.copyWith(color: theme.colorScheme.error),
                ),
                child: Text(
                  'Cancel',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge
                      ?.copyWith(color: theme.colorScheme.error),
                ),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
              SizedBox(
                width: 4.w,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  backgroundColor: (!editMaitenance)
                      ? theme.primaryColor
                      : Colors.amber.shade800,
                  textStyle: Theme.of(context)
                      .textTheme
                      .labelLarge
                      ?.copyWith(color: Colors.white),
                ),
                child: Text(
                  (!editMaitenance) ? 'Save' : 'Edit',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge
                      ?.copyWith(color: Colors.white),
                ),
                onPressed: () {
                  // context.read<TimerStates>().addtimer(TimerModel(
                  //       id: 0,
                  //       title: 'Pomodoro Workout',
                  //       countDown: const Duration(minutes: 1),
                  //     ));
                },
              ),
            ],
          ),
        );
      },
    ).then((onValue) => onValue ?? false);
  }
}
