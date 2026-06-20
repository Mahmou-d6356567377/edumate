import 'package:edumate/core/consts/constants.dart';
import 'package:edumate/core/themes/conts_colors.dart';
import 'package:edumate/features/navigation/cubits/askai/askai_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:edumate/features/navigation/cubits/addchat/addchat_cubit.dart';

class CustomNewChat extends StatelessWidget {
  const CustomNewChat({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);

        context.read<AskAICubit>().reset();
        context.read<AddChatCubit>().addChat();
      },
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: SvgPicture.asset(Constants.newchat),
          ),
          Text(
            'New Chat',
            style: Theme.of(
              context,
            ).textTheme.titleMedium!.copyWith(color: Color(ConstsColors.kblue)),
          ),
        ],
      ),
    );
  }
}
