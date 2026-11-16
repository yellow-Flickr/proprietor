import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';
import 'package:proprietor/src/shared/widgets/circles_paint.dart';

class ForgotPassword extends ConsumerWidget {
  const ForgotPassword({super.key});
  static const routeName = '/forgot_password';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        flexibleSpace: Container(
          width: double.infinity,
          height: double.infinity,
          color: theme.primaryColor,
          child: Transform.scale(
              scale: 2,
              child: CustomPaint(
                painter: CirclesPaint(),
              )),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 4.w,
        ),
        child: Column(children: [
          SizedBox(
            height: 5.h,
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(
            'Forgotten Password?',
            style: theme.textTheme.headlineMedium
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
           SizedBox(
            height: 3.h,
          ),
          SizedBox(
            width: 60.w,
            child: Text(
              'Enter your E-mail address to recover your password',
              style: theme.textTheme.labelSmall
                  ?.copyWith(color: theme.hintColor),textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          TextField(
            style: theme.textTheme.bodySmall,
            decoration: InputDecoration(
              // suffixIcon: Icon(Icons.visibility_rounded),
              prefixIcon: const Icon(Icons.mail),
              // isDense: true,
              labelText: 'E-mail',
              labelStyle: theme.textTheme.labelMedium,
              hintText: 'Enter your e-mail',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              minimumSize: Size(100.w, 6.h),
              backgroundColor: theme.primaryColor,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 5.w,
                ),
                const Text('Recover'),
                Icon(
                  Icons.double_arrow_rounded,
                  color: Colors.white.withOpacity(.5),
                )
              ],
            ),
          ),
         
        ]),
      ),
    );
  }
}
