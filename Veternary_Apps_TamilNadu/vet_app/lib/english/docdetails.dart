import 'package:flutter/material.dart';
import 'package:vet_app/english/drawer.dart';

class Doctordetails extends StatefulWidget {
  @override
  _DoctordetailsState createState() => _DoctordetailsState();
}

class _DoctordetailsState extends State<Doctordetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Colors.blue[900],
        elevation: 0.0,
        title: Text(
          'Doctor Details',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.arrow_back),
            textColor: Colors.white,
            label: Text('Back'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      drawer: SideBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.network(
            'https://firebasestorage.googleapis.com/v0/b/vetapptn.appspot.com/o/images%2F2020-08-28%2023%3A59%3A42.016510.png?alt=media&token=e7cf7020-4124-4a25-a5bc-9dac5e480ecf',
            width: 100,
            height: 100,
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            'UDUMALAI RADHAKRISHNAN ',
            style: TextStyle(
              //fontFamily: 'Pacifico',
              fontSize: 20.0,
              color: Colors.blue[900],
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 40.0,
            width: 150.0,
            child: Divider(
              color: Colors.white,
              thickness: 3.0,
            ),
          ),
          Card(
            color: Colors.white,
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
            child: ListTile(
                leading: Icon(
                  Icons.phone,
                  color: Colors.black,
                ),
                title: Text(
                  '9977886645',
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                  ),
                )),
          ),
          Card(
            color: Colors.white,
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
            child: ListTile(
                leading: Icon(
                  Icons.local_hospital,
                  color: Colors.black,
                ),
                title: Text(
                  'Veterinarian Surgeon',
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                  ),
                )),
          ),
          Card(
            color: Colors.white,
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
            child: ListTile(
                leading: Icon(
                  Icons.mail,
                  color: Colors.black,
                ),
                title: Text(
                  'udumali@tnvc.in',
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
