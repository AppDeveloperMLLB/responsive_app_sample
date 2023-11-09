import 'package:flutter/material.dart';
import 'package:responsive_app_sample/user.dart';
import 'package:responsive_app_sample/user_datails_view.dart';
import 'package:responsive_app_sample/user_name_view.dart';

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
          child: OrientationBuilder(
            builder: (context, orientation) {
              return orientation == Orientation.portrait
                  ? Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          UserNameView(name: user.name),
                          const SizedBox(
                            height: 16,
                          ),
                          UserDetailsView(user: user),
                        ],
                      ),
                    )
                  : Row(
                      //crossAxisAlignment: CrossAxisAlignment.center,
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 32.0),
                            child: UserDetailsView(user: user),
                          ),
                        ),
                      ],
                    );
            },
          ),
        ),
      ),
    );
  }
}
