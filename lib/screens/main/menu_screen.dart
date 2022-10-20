import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_app/configs/theme/app_colors.dart';
import 'package:study_app/resources/provider.dart';

import '../../resources/functions.dart';

class MenuScreen extends ConsumerWidget {
  const MenuScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userDetails = ref.watch(nameProvider);
    return SizedBox(
      width: double.infinity,
      child: Theme(
        data: ThemeData(
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(foregroundColor: onSurfaceTextColor),
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Positioned(
                top: MediaQuery.of(context).size.height * 0.04,
                right: MediaQuery.of(context).size.width * 0.1,
                child: GestureDetector(
                  onTap: () {
                    toggle();
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    userDetails == null
                        ? SizedBox()
                        : Text(
                            userDetails.displayName ?? 'ls',
                            style: TextStyle(
                              color: onSurfaceTextColor,
                              fontWeight: FontWeight.w900,
                              fontSize: 20,
                            ),
                          ),
                    Spacer(
                      flex: 1,
                    ),
                    _drawerBtn('Website', Icons.web, () => website()),
                    _drawerBtn('Facebook', Icons.facebook, () => facebook()),
                    _drawerBtn('Email', Icons.email, () => email()),
                    Spacer(
                      flex: 4,
                    ),
                    _drawerBtn(
                        'Logout', Icons.logout, () => signOut(context, ref)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _drawerBtn(String label, IconData icon, VoidCallback onPress) {
    return TextButton.icon(
        onPressed: onPress,
        icon: Icon(
          icon,
          size: 15,
        ),
        label: Text(
          label,
          style: TextStyle(
            color: onSurfaceTextColor,
            fontWeight: FontWeight.w400,
            fontSize: 17,
          ),
        ));
  }
}
