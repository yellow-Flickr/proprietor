import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proprietor/src/auth/log_in.dart';
import 'package:sizer/sizer.dart';

class Amenities extends ConsumerStatefulWidget {
  const Amenities({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AmenitiesState();

  static const routeName = '/amenities';
}

class _AmenitiesState extends ConsumerState<Amenities> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        // title: const Text('Property List'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(
              onPressed: () {
                setState(() {
                  isDeleting = !isDeleting;
                });
              },
              icon: const Icon(Icons.delete))
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
                                'Amenities',
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
          await _dialogBuilder(context, addAmenity: true);
        },
        child: const Icon(Icons.task_alt_rounded),
      ),
      body: GridView(
        padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.5.h),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 2.h, crossAxisCount: 2, childAspectRatio: 9),
        children: [
          GestureDetector(
            onTap: () async {
              await _dialogBuilder(context);
              // Navigator.pushNamed(context, PropertyDetail.routeName);
            },
            child: SizedBox(
              width: 35.w,
              height: 3.h,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Visibility(
                    visible: !isDeleting,
                    replacement: Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.all(.5.w),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: theme.colorScheme.error,
                            shape: BoxShape.rectangle,
                            borderRadius: const BorderRadius.horizontal(
                                left: Radius.circular(2))),
                        child: Icon(
                          Icons.remove,
                          color: Colors.white,
                          size: 2.h,
                        ),
                      ),
                    ), child: Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.all(.5.w),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: theme.primaryColor,
                            shape: BoxShape.rectangle,
                            borderRadius: const BorderRadius.horizontal(
                                left: Radius.circular(2))),
                        child: Icon(
                          Icons.network_wifi,
                          color: Colors.white,
                          size: 2.h,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 1.w,
                  ),
                  Expanded(
                    flex: 8,
                    child: Text(
                      'Internet (Cloud)',
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(fontWeight: FontWeight.w500)
                      // ?.copyWith(fontSize: 2.h)
                      ,
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              // Navigator.pushNamed(context, PropertyDetail.routeName);
            },
            child: SizedBox(
              width: 35.w,
              height: 3.h,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.all(.5.w),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: theme.primaryColor,
                          shape: BoxShape.rectangle,
                          borderRadius: const BorderRadius.horizontal(
                              left: Radius.circular(2))),
                      child: Icon(
                        Icons.power,
                        color: Colors.white,
                        size: 2.h,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 1.w,
                  ),
                  Expanded(
                    flex: 8,
                    child: Text(
                      'Electricity',
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(fontWeight: FontWeight.w500)
                      // ?.copyWith(fontSize: 2.h)
                      ,
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              // Navigator.pushNamed(context, PropertyDetail.routeName);
            },
            child: SizedBox(
              width: 35.w,
              height: 3.h,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.all(.5.w),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: theme.primaryColor,
                          shape: BoxShape.rectangle,
                          borderRadius: const BorderRadius.horizontal(
                              left: Radius.circular(2))),
                      child: Icon(
                        Icons.water,
                        color: Colors.white,
                        size: 2.h,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 1.w,
                  ),
                  Expanded(
                    flex: 8,
                    child: Text(
                      'Water (Pumped Borehole)',
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(fontWeight: FontWeight.w500)
                      // ?.copyWith(fontSize: 2.h)
                      ,
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

  bool isEditing = false;
  bool isDeleting = false;
  Future<bool> _dialogBuilder(BuildContext context, {bool addAmenity = false}) {
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
            title: Text(addAmenity ? 'Add Amenity' : 'Amenity Detail'),
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
                    hintText: 'Amenity Label',
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
                  backgroundColor: (isEditing || addAmenity)
                      ? theme.primaryColor
                      : Colors.amber.shade800,
                  textStyle: Theme.of(context)
                      .textTheme
                      .labelLarge
                      ?.copyWith(color: Colors.white),
                ),
                child: Text(
                  (isEditing || addAmenity) ? 'Save' : 'Edit',
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
                  if (addAmenity) {
                    Navigator.of(context).pop(false);
                    return;
                  } else {
                    setState(() {
                      isEditing = !isEditing;
                    });
                  }
                },
              ),
            ],
          ),
        );
      },
    ).then((onValue) => onValue ?? false);
  }
}
