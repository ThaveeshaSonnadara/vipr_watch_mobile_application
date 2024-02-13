import 'package:flutter/material.dart';


class Or_signin_with extends StatelessWidget {
  const Or_signin_with({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(child: Divider(
          color: Colors.grey,
          thickness: 0.5,
          indent: 60,
          endIndent: 5,),
        ),

        Text('or Sign in with', style: Theme.of(context).textTheme.labelMedium!.copyWith(
          color: Colors.grey,),),

        Flexible(child: Divider(
          color: Colors.grey,
          thickness: 0.5,
          indent: 5,
          endIndent: 60,),
        ),
      ],
    );
  }
}
