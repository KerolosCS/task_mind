import 'package:flutter/material.dart';

class CustomSearch extends StatelessWidget {
  const CustomSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 50,
          width: MediaQuery.sizeOf(context).width * .77,
          child: TextFormField(
            decoration: const InputDecoration(
              // prefixIconConstraints: ,
              hintText: 'ابحث عن المنتج',
              prefixIcon: Icon(Icons.search),
              isDense: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(28),
                ),
              ),
            ),
          ),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.share,
            size: 30,
          ),
        )
      ],
    );
  }
}
