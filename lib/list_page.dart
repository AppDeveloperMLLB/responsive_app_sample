import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_app_sample/details_page.dart';
import 'package:responsive_app_sample/user.dart';
import 'package:responsive_app_sample/user_list_view.dart';

class ListPage extends HookConsumerWidget {
  const ListPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(
      () {
        // useEffectを使い、初回時のみ画面の向きを縦に固定する
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
        ]);

        // disposeでは画面の向きを縦横両方に戻す
        return () {
          SystemChrome.setPreferredOrientations([
            DeviceOrientation.portraitUp,
            DeviceOrientation.portraitDown,
            DeviceOrientation.landscapeLeft,
            DeviceOrientation.landscapeRight,
          ]);
        };
      },
      [],
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('List Page'),
      ),
      body: SafeArea(
        child: Center(
          child: UserListView(
            userList: userList,
            // User一覧の各アイテムをタップした時の処理
            onTap: (user) async {
              // 画面の向きの変更はどのタイミングでやればいいのか迷う
              // go_routerとかを使っているなら、ルーティングでやる方がいいのかな？

              // 遷移する詳細画面では縦横両方にしたいので設定
              await SystemChrome.setPreferredOrientations([
                DeviceOrientation.portraitUp,
                DeviceOrientation.portraitDown,
                DeviceOrientation.landscapeLeft,
                DeviceOrientation.landscapeRight,
              ]);
              if (context.mounted) {
                await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return DetailsPage(user: user);
                    },
                  ),
                );
              }
              // 戻ってきたら縦向き固定に戻す
              await SystemChrome.setPreferredOrientations(
                [
                  DeviceOrientation.portraitUp,
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
