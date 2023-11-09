import 'package:flutter/material.dart';
import 'package:responsive_app_sample/user.dart';

class UserDetailsView extends StatelessWidget {
  const UserDetailsView({
    super.key,
    required this.user,
    this.width,
  });
  final User user;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _createRow(
            context: context,
            label: "ID",
            content: user.id,
          ),
          const Divider(
            thickness: 1,
            height: 8,
            color: Colors.black,
          ),
          const SizedBox(
            height: 8,
          ),
          _createRow(
            context: context,
            label: "email",
            content: user.email,
          ),
          const Divider(
            thickness: 1,
            height: 8,
            color: Colors.black,
          ),
          const SizedBox(
            height: 8,
          ),
          _createRow(
            context: context,
            label: "age",
            content: "${user.age}",
          ),
          const Divider(
            thickness: 1,
            height: 8,
            color: Colors.black,
          ),
        ],
      ),
    );
  }

  Widget _createRow({
    required BuildContext context,
    required String label,
    required String content,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _createLabel(label, context),
        Flexible(
          child: Align(
            alignment: Alignment.centerRight,
            child: _createText(content, context),
          ),
        ),
      ],
    );
  }

  Widget _createLabel(
    String text,
    BuildContext context,
  ) {
    return Text(
      text,
      maxLines: 3,
      style: Theme.of(context).textTheme.titleLarge,
    );
  }

  Widget _createText(
    String text,
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
