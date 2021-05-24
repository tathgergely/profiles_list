import 'package:flutter/material.dart';
import 'package:profiles_list/models/profile.dart';
import 'package:profiles_list/views/dialogs/profile_details_dialog.dart';

class ProfileCell extends StatelessWidget {
  final Profile profile;

  const ProfileCell({
    required this.profile,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(profile.picture.medium),
        ),
        title: Text(profile.name.first + " " + profile.name.last),
        onTap: () {
          showDialog(context: context,
            builder: (BuildContext context) {
              return ProfileDetailsDialog(profile);
            },
          );
        }
    );
  }
}
