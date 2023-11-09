import 'package:flutter/material.dart';

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
          width: 72,
          height: 72,
          child: const Center(
              child: Text(
            "Image",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          )),
        ),
        const SizedBox(width: 16),
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
