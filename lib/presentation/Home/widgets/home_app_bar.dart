import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/BLoC/UserDetails/user_details_bloc.dart';
import 'package:social_media/core/size.dart';
import 'package:social_media/main.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<UserDetailsBloc, UserDetailsState>(
      buildWhen: (previous, current) {
        return current is EditUserDetailsSuccessState;
      },
      builder: (context, state) {
        return Row(
          children: [
            constWidth20,
            Text(
              "Hi,$userName",
              style: theme.textTheme.headlineMedium,
            ),
            const Spacer(),
          ],
        );
      },
    );
  }
}
