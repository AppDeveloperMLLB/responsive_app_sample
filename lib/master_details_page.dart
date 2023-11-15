import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_app_sample/context_extension.dart';
import 'package:responsive_app_sample/details_page.dart';
import 'package:responsive_app_sample/user.dart';
import 'package:responsive_app_sample/user_details.dart';
import 'package:responsive_app_sample/user_list_view.dart';

class MasterDetailPage extends StatefulWidget {
  const MasterDetailPage({super.key});

  @override
  State<MasterDetailPage> createState() => _MasterDetailPageState();
}

class _MasterDetailPageState extends State<MasterDetailPage> {
  User selectedValue = userList[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("UserList"),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: UserListView(
                  userList: userList,
                  onTap: (value) {
                    // 一覧をタップした時の動作
                    if (context.isTablet()) {
                      // タブレットの場合は詳細の表示を更新する
                      setState(() {
                        selectedValue = value;
                      });
                    } else {
                      // スマホの場合は詳細画面に遷移する
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return DetailsPage(
                              user: value,
                            );
                          },
                        ),
                      );
                    }
                  },
                ),
              ),
              if (context.isTablet())
                // タブレットの場合は詳細を横に表示
                Expanded(
                  flex: 8,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: UserDetails(
                      user: selectedValue,
                    ),
                  ),
                )
            ],
          );
        },
      ),
    );
  }
}
