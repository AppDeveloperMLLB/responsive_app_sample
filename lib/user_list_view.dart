import 'package:flutter/material.dart';
import 'package:responsive_app_sample/user.dart';

class UserListView extends StatelessWidget {
  const UserListView({
    super.key,
    required this.userList,
    this.onTap,
  });
  final List<User> userList;
  final Function(User)? onTap;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: userList.length,
      itemBuilder: (context, index) {
        final user = userList[index];
        return ListTile(
          title: Text(
            user.name,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          onTap: () async {
            onTap?.call(user);
          },
        );
      },
    );
  }
}
