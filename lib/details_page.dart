import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_app_sample/user.dart';
import 'package:responsive_app_sample/user_details.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    super.key,
    required this.user,
  });
  final User user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('details'),
      ),
      body: SafeArea(
        child: Center(
          child: UserDetails(
            user: user,
          ),
        ),
      ),
    );
  }
}
