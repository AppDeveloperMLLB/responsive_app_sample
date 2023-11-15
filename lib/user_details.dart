import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_app_sample/user.dart';
import 'package:responsive_app_sample/user_datails_view.dart';
import 'package:responsive_app_sample/user_name_view.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        // OrientationBuilderを入れ子にすると、子の方で正しいorientationが取れないので、
        // MediaQueryから取得
        return MediaQuery.orientationOf(context) == Orientation.portrait
            ? Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    UserNameView(name: user.name),
                    SizedBox(
                      height: 16.w,
                    ),
                    UserDetailsView(user: user),
                  ],
                ),
              )
            : Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: UserNameView(
                        name: user.name,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: UserDetailsView(user: user),
                    ),
                  ),
                ],
              );
      },
    );
  }
}
