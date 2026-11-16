import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:proprietor/src/features/auth/presentation/log_in.dart';
import 'package:sizer/sizer.dart';

class AddTenant extends ConsumerStatefulWidget {
  const AddTenant({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddTenantState();

  static const routeName = '/add_tenant';
}

class _AddTenantState extends ConsumerState<AddTenant> {
  final List<String> _list = [
    'Single Room Flat1',
    'Single Room Flat2',
    'Single Room Flat3',
    'Single Room Flat4',
    'Single Room Flat5'
  ];
  List<String> infoSource = [
    "Friend/Family",
    "Facebook",
    "Online",
    "Radio",
    "Billboard",
    "Trotro",
    "Newspaper",
    "Sales Agent",
    "Other"
  ];
  String policy = 'Yes';
  String infoSourceValue = 'Facebook';
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
                                'Add Tenant',
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tenant Image (Optional)',
                style: theme.textTheme.labelSmall
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 1.h,
              ),
              Container(
                width: 35.w,
                height: 30.w,
                alignment: Alignment.center,
                decoration: ShapeDecoration(
                    color: theme.highlightColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: const Icon(Icons.add_a_photo_outlined),
              )
            ],
          ),
          SizedBox(
            height: 2.h,
          ),
          TextField(
            style: theme.textTheme.bodySmall,
            decoration: InputDecoration(
                labelStyle: theme.textTheme.bodySmall,
                labelText: 'First Name',
                 ),
          ),
          SizedBox(
            height: 2.h,
          ),
          TextField(
            style: theme.textTheme.bodySmall,
            decoration: InputDecoration(
                labelStyle: theme.textTheme.bodySmall,
                labelText: 'Last Name',
                 ),
          ),
          SizedBox(
            height: 2.h,
          ),
          TextField(
            style: theme.textTheme.bodySmall,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                labelStyle: theme.textTheme.bodySmall,
                labelText: 'E-mail Address',
                 ),
          ),
          SizedBox(
            height: 2.h,
          ),
          TextField(
            style: theme.textTheme.bodySmall,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
                labelStyle: theme.textTheme.bodySmall,
                labelText: 'Phone Number',
                 ),
          ),
          SizedBox(
            height: 2.h,
          ),
          DropdownButtonFormField(
            value: _list.first,
            style: theme.textTheme.bodySmall,
            decoration:
                const InputDecoration(  labelText: 'Select Property'),
            items: _list
                .map((toElement) => DropdownMenuItem(
                      value: toElement,
                      child: Text(toElement),
                    ))
                .toList(),
            onChanged: (value) {},
          ),
          SizedBox(
            height: 2.h,
          ),
          DropdownButtonFormField(
            value: _list.first,
            style: theme.textTheme.bodySmall,
            decoration: const InputDecoration(  labelText: 'Country'),
            items: _list
                .map((toElement) => DropdownMenuItem(
                      value: toElement,
                      child: Text(toElement),
                    ))
                .toList(),
            onChanged: (value) {},
          ),
          SizedBox(
            height: 2.h,
          ),
          TextField(
            style: theme.textTheme.bodySmall,
            maxLines: 4,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
                labelStyle: theme.textTheme.bodySmall,
                labelText: 'Current Address',
                 ),
          ),
          SizedBox(
            height: 2.h,
          ),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: DateTimeField(
                  keyboardType: TextInputType.datetime,
                  style: theme.textTheme.bodySmall,
                  initialValue: DateTime.now() ,
                  decoration: InputDecoration(
                      labelStyle: theme.textTheme.bodySmall,
                      labelText: 'Date of Birth',
                       ),
                  onShowPicker: (BuildContext context, DateTime? currentValue) =>
                      showDatePicker(
                    context: context,
                    firstDate: DateTime.now(),
                    initialDate: DateTime.now(),
                    lastDate: DateTime(2099),
                  ),
                  format: DateFormat("EEEE, MMMM d, yyyy"),
                ),
              ),
              SizedBox(width: 2.w,),
              Expanded(
                child: DropdownButtonFormField(
                  value: _list.first,
                  style: theme.textTheme.bodySmall,
                  decoration: const InputDecoration(  labelText: 'Gender',isDense: true),
                  items: _list
                      .map((toElement) => DropdownMenuItem(
                            value: toElement,
                            child: Text(toElement),
                          ))
                      .toList(),
                  onChanged: (value) {},
                ),
              ),
            ],
          ),
          SizedBox(
            height: 2.h,
          ),
          DropdownButtonFormField(
            value: _list.first,
            style: theme.textTheme.bodySmall,
            decoration: const InputDecoration(  labelText: 'Gender'),
            items: _list
                .map((toElement) => DropdownMenuItem(
                      value: toElement,
                      child: Text(toElement),
                    ))
                .toList(),
            onChanged: (value) {},
          ),
          SizedBox(
            height: 2.h,
          ),
          Card(
            child: ListTile(
              // onTap: () async =>
              // _pdfFile != null ? _removeFile(false) : _pickPdfFile(),
              leading: CircleAvatar(
                backgroundColor:
                    Colors.amber.shade800,
                child: const Icon(
                  Icons.picture_as_pdf,
                  color: Colors.white,
                ),
              ),
              title: Text(
                'Upload Documents ',
                style: theme.textTheme.labelMedium,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: const Text(
                'Business Certificate',
                style: TextStyle(fontSize: 12),
              ),
              horizontalTitleGap: 10,
              minLeadingWidth: 0,
              trailing:  Icon(
                      Icons.add_circle,
                      color: theme.primaryColor,
                      size: 30,
                    ),
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          TextField(
            style: theme.textTheme.bodySmall,
            decoration: InputDecoration(
                labelStyle: theme.textTheme.bodySmall,
                labelText: 'Occupation',
                 ),
          ),    SizedBox(
            height: 2.h,
          ),
          TextField(
            style: theme.textTheme.bodySmall,
            maxLines: 5,
            decoration: InputDecoration(
              
                labelStyle: theme.textTheme.bodySmall,
                labelText: 'Additional Notes',
                 ),
          ),
          SizedBox(
            height: 3.h,

          ),
           ElevatedButton(
            onPressed: () {
              // Navigator.pushNamed(context, '/dashboard');
            },
            style: ElevatedButton.styleFrom(
              minimumSize: Size(100.w, 8.h),
              backgroundColor: theme.primaryColor,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 5.w,
                ),
                const Text('Save'),
                Icon(
                  Icons.double_arrow_rounded,
                  color: Colors.white.withOpacity(.5),
                )
              ],
            ),
          ),

           SizedBox(
            height: 2.h,
          ),
        ],
      ),
    );
  }
}
