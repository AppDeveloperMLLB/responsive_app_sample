import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserNameView extends StatelessWidget {
  const UserNameView({
    super.key,
    required this.name,
  });
  final String name;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.deepPurple.shade300,
            shape: BoxShape.circle,
          ),
          width: 72.w,
          // 高さの場合本来は72.hとするが、同じ大きさとしたいので72.wとしている
          height: 72.w,
          child: Center(
            child: Text(
              "Image",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 16.sp,
              ),
            ),
          ),
        ),
        SizedBox(
          // 横幅の場合は.w, 高さの場合は。hをつける
          width: 16.w,
        ),
        Flexible(
          child: Text(
            name,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
      ],
    );
  }
}
