import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String? title;
  final bool? isLeading;
  const CustomAppBar({
    Key? key,
    this.title,
    this.isLeading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      elevation: 0,
      automaticallyImplyLeading: isLeading ?? false,
      title: Text(
        title ?? '',
        style: Theme.of(context)
            .textTheme
            .headline5!
            .copyWith(color: Colors.white),
      ),
    );
  }
}
