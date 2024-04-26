import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.path,
    required this.txt,
  });
  final String path;
  final String txt;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: NetworkImage(path),
            height: 60,
            width: 60,
            fit: BoxFit.fill,
          ),
          SizedBox(
            width: 60,
            child: Text(
              txt ?? 'عسل',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
