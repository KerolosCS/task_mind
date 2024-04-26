import 'package:flutter/material.dart';

class CustomElevatedBtn extends StatelessWidget {
  const CustomElevatedBtn({
    super.key,
    this.onPressed,
  });
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * .079,
      width: MediaQuery.sizeOf(context).width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        gradient: LinearGradient(
          colors: [
            Color(0xffCC9A25),
            Color(0xffFBD203),
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          stops: [0, 1],
        ),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        onPressed: onPressed,
        child: const Text(
          'تسجيل الدخول',
          style: TextStyle(
            color: Color(0xffffffff),
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
