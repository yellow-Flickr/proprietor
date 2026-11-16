import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';

class CirclesPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(.05)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    var radius = size.width / 2;
    const angle = 2 * pi / 15;
    final center = Offset(size.width / 2, size.height / 2);

    for (int i = 0; i < 20; i++) {
      final point = Offset(
        center.dx + radius * cos(angle * i),
        center.dy + radius * sin(angle * i),
      );
      canvas.drawCircle(point, radius, paint);
      radius -= 10;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class LogIn extends ConsumerWidget {
  const LogIn({super.key});
  static const routeName = '/';

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
              size: 40.w,
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(
            'Log In To Proprietor',
            style: theme.textTheme.headlineMedium
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 5.h,
          ),
          TextField(
            style: theme.textTheme.bodySmall,
            decoration: const InputDecoration(
              // suffixIcon: Icon(Icons.visibility_rounded),
              prefixIcon: Icon(Icons.mail),
              isDense: true,
              labelText: 'Email',
               hintText: 'Enter your email',
             
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          TextField(
            style: theme.textTheme.bodySmall,
            obscureText: true,
            decoration: const InputDecoration(
              suffixIcon: Icon(Icons.visibility_off_rounded),
              prefixIcon: Icon(Icons.key_rounded),
              // isDense: true,
              labelText: 'Password',
               hintText: 'Enter your password',
             
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: true,
                    onChanged: (value) {},
                  ),
                  Text(
                    'Remember me',
                    style: theme.textTheme.labelSmall,
                  ),
                ],
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/forgot_password');
                },
                style: TextButton.styleFrom(
                  foregroundColor: theme.primaryColor,
                ),
                child: Text(
                  'Forgot Password?',
                  style: theme.textTheme.labelSmall
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/dashboard');
            },
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
                const Text('Log In'),
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
              const Text('Don\'t have an account?'),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/sign_up');
                },
                style: TextButton.styleFrom(
                  foregroundColor: theme.primaryColor,
                ),
                child: const Text('Sign Up'),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
