import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proprietor/src/features/auth/presentation/log_in.dart';
import 'package:proprietor/src/shared/widgets/circles_paint.dart';
import 'package:sizer/sizer.dart';

class SignUp extends ConsumerWidget {
  const SignUp({super.key});
  static const routeName = '/sign_up';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
          Center(
            child: FlutterLogo(
              size: 30.w,
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Text('Sign Up To Proprietor',style: theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w600),),
              SizedBox(
            height: 5.h,
          ),
          TextField(
            style: theme.textTheme.bodySmall,
            decoration: InputDecoration(
              // suffixIcon: Icon(Icons.visibility_rounded),
              prefixIcon: const Icon(Icons.person),
              isDense: true,
              labelText: 'Full Name',
              labelStyle: theme.textTheme.labelMedium,
              hintText: 'Enter your full name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          TextField(
            style: theme.textTheme.bodySmall,
            decoration: InputDecoration(
              // suffixIcon: Icon(Icons.visibility_rounded),
              prefixIcon: const Icon(Icons.mail),
              isDense: true,
              labelText: 'Email',
              labelStyle: theme.textTheme.labelMedium,
              hintText: 'Enter your email',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          TextField(
            style: theme.textTheme.bodySmall,
            obscureText: true,
            decoration: InputDecoration(
              suffixIcon: const Icon(Icons.visibility_off_rounded),
              prefixIcon: const Icon(Icons.key_rounded),
              // isDense: true,
              labelText: 'Password',
              labelStyle: theme.textTheme.labelMedium,
              hintText: 'Enter your password',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(
            height: 2.h,
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
                SizedBox( width: 5.w,),
                const Text('Sign Up'),
                Icon(
                  Icons.double_arrow_rounded,
                  color: Colors.white.withOpacity(.5),
                )
              ],
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Already have an account?'),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, LogIn.routeName);
                },
                style: TextButton.styleFrom(
                  foregroundColor: theme.primaryColor,
                ),
                child: const Text('Log In'),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
