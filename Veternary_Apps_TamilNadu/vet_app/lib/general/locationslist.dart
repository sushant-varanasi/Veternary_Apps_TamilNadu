import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:vet_app/english/confirmlocationtile.dart';
import 'package:vet_app/english/locationtile.dart';
import 'package:vet_app/general/user.dart';

import 'locationClass.dart';

class LocationsList extends StatefulWidget {
  @override
  _LocationslistState createState() => _LocationslistState();
}

class _LocationslistState extends State<LocationsList> {
  @override
  Widget build(BuildContext context) {
    final user2 = Provider.of<User>(context);
    final location = Provider.of<List<LocationData>>(context) ?? [];

    return ListView.builder(
        itemCount: location.length,
        itemBuilder: (context, index) {
          print(index);
          print(location.length);

          return location[index].uid == user2.uid
              ? LocationTile(
                  locationtile: location[index],
                )
              : Container();
        });
  }
}
