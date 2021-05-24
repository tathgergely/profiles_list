import 'package:flutter/material.dart';
import 'package:profiles_list/models/profile.dart';

import '../../constants.dart';

class ProfileDetailsDialog extends StatelessWidget {
  final Profile profile;

  ProfileDetailsDialog(this.profile);

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Constants.padding),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Stack(
          children: <Widget>[
            Container(
              width: 400,
              height: 300,
              padding: EdgeInsets.only(
                  left: Constants.padding,
                  top: Constants.avatarPadding,
                  right: Constants.padding,
                  bottom: Constants.padding),
              margin: EdgeInsets.only(top: Constants.avatarPadding),
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(Constants.padding),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black,
                        offset: Offset(0, 10),
                        blurRadius: 10),
                  ]),
              child: Column(
                mainAxisSize: MainAxisSize.min,

                children: <Widget>[
                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          profile.name.title,
                          style:
                          TextStyle(fontSize: 18),
                        ),
                        Text(
                          profile.name.getString(),
                          style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 15,),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget> [
                      Image.asset("assets/images/gender.png", height: 30,),
                      SizedBox(width: 5,),
                      Flexible(child: Text(profile.gender,))
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget> [
                      Icon(Icons.language, size: 30,),
                      SizedBox(width: 5,),
                      Flexible(child: Text(profile.location.getString()),)

                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget> [
                      Icon(Icons.flight_takeoff, size: 30,),
                      SizedBox(width: 5,),
                      Flexible(child: Text(profile.location.coordinates.getString()),)

                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget> [
                      Icon(Icons.schedule, size: 30,),
                      SizedBox(width: 5,),
                      Flexible(child: Text(profile.location.timezone.getString()),)
                    ],
                  ),

                ],
              )
            ),
            Positioned(
              left: Constants.padding,
              right: Constants.padding,
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: Constants.avatarPadding,
                child: ClipRRect(
                    borderRadius: BorderRadius.all(
                        Radius.circular(Constants.avatarPadding)),
                    child: Image.network(profile.picture.medium)),
              ),
            )
          ],
        ));
  }
}
