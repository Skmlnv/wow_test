import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wow_auth/utils/colors.dart';
import 'package:flutter_wow_auth/utils/svg.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool disableBackButton;
  DefaultAppBar({
    Key? key,
    this.disableBackButton = false,
  })  : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.0,
      leading: disableBackButton
          ? null
          : Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: AppSvg(
                  'icons/back.svg',
                  BoxFit.contain,
                ),
              ),
            ),
      actions: [
        Container(
          margin: EdgeInsets.only(right: 16.0),
          child: Badge(
            badgeColor: Colors.transparent,
            elevation: 0.0,
            position: BadgePosition.topEnd(top: 10, end: -9),
            badgeContent: Container(
              width: 10.0,
              height: 10.0,
              decoration: BoxDecoration(
                color: appGreenColor.withAlpha(95),
                shape: BoxShape.circle,
              ),
            ),
            child: AppSvg('icons/question.svg', BoxFit.contain),
          ),
        )
      ],
    );
  }
}
