import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vet_app/general/loading2.dart';
import 'drawer.dart';

class Help extends StatefulWidget {
  @override
  _HelpState createState() => _HelpState();
}

class _HelpState extends State<Help> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    //final projdata = Provider.of<ProjData>(context);

    return loading
        ? Loading2()
        : Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
                iconTheme: IconThemeData(
                  color: Colors.white,
                ),
                backgroundColor: Colors.blue[900],
                elevation: 0.0,
                title: Text(
                  'உதவி',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                actions: <Widget>[
                  FlatButton.icon(
                    icon: Icon(Icons.arrow_back),
                    textColor: Colors.blue[900],
                    label: Text('பின்னோக்கிய'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ]),
            body: Padding(
              padding: EdgeInsets.only(top: 8),
              child: Card(
                margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
                child: ListView(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(
                        Icons.add,
                        color: Colors.blue[900],
                      ),
                      title: Text(
                        'வழக்குகள்',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        "இந்த தாவலில் சேர் பொத்தானைக் கிளிக் செய்வதன் மூலம் புதிய வழக்கைச் சேர்க்க முடியும். கிளிக் செய்த பிறகு, உங்கள் வழக்கின் விவரங்களைக் கேட்கும் ஒரு விருப்பம் உங்களிடம் இருக்கும். ",
                        style: TextStyle(fontSize: 18.0, color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      title: Text(
                        'விளக்கம்',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'உங்கள் விலங்கு எதிர்கொள்ளும் பிரச்சினையைப் பற்றி எங்களிடம் கூறுங்கள். ',
                        style: TextStyle(fontSize: 18.0, color: Colors.black),
                      ),
                      leading: Icon(
                        Icons.note_add,
                        color: Colors.blue[900],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      title: Text(
                        'குரல் விளக்கம்',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        ' இது உங்கள் குரல் செய்தியை பதிவு செய்ய உதவுகிறது. இந்த விருப்பத்தை கிளிக் செய்வதன் மூலம் உங்கள் பிரச்சினையைப் பற்றி எங்களிடம் கூறலாம். பொத்தானைக் கிளிக் செய்த பிறகு மைக் தானாகவே பதிவு செய்யத் தொடங்கும்.   ',
                        style: TextStyle(fontSize: 18.0, color: Colors.black),
                      ),
                      leading: Icon(
                        Icons.mic,
                        color: Colors.blue[900],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      title: Text(
                        'இடம்',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        ' கீழ்தோன்றும் ஐகானைக் கிளிக் செய்வதன் மூலம் உங்கள் இருப்பிடத்தை இங்கிருந்து தேர்வு செய்யலாம். அதைக் கிளிக் செய்த பிறகு கிராமங்களின் பட்டியல் கிடைக்கும். நீங்கள் வசிக்கும் இடத்தைத் தேர்வுசெய்க',
                        style: TextStyle(fontSize: 18.0, color: Colors.black),
                      ),
                      leading: Icon(
                        Icons.home,
                        color: Colors.blue[900],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      title: Text(
                        'வீட்டு வருகை',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        ' உங்கள் விலங்குக்கு ஒரு மருத்துவர் வீட்டிற்கு வருகை வேண்டுமா இல்லையா என்பதை நீங்கள் தேர்வு செய்யலாம்',
                        style: TextStyle(fontSize: 18.0, color: Colors.black),
                      ),
                      leading: Icon(
                        Icons.pets,
                        color: Colors.blue[900],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      title: Text(
                        'அவசரம்',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        ' இது அவசரநிலை என்றால் அவசர பொத்தானைத் தேர்ந்தெடுக்கவும்',
                        style: TextStyle(fontSize: 18.0, color: Colors.black),
                      ),
                      leading: Icon(
                        Icons.home,
                        color: Colors.blue[900],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      title: Text(
                        'மருத்துவர்களைச் சேர்த்து அறிவிக்கவும்',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        ' உங்கள் வழக்கைச் சேர்க்க இந்த பொத்தானைக் கிளிக் செய்க.',
                        style: TextStyle(fontSize: 18.0, color: Colors.black),
                      ),
                      leading: Icon(
                        Icons.home,
                        color: Colors.blue[900],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.add,
                        color: Colors.blue[900],
                      ),
                      title: Text(
                        'விலங்குகள்',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        " இந்த தாவலில் சேர் பொத்தானைக் கிளிக் செய்வதன் மூலம் உங்கள் விலங்கைப் பதிவு செய்யலாம். கிளிக் செய்த பிறகு, உங்கள் விலங்கின் விவரங்களைக் கேட்கும் ஒரு விருப்பம் உங்களிடம் இருக்கும். ",
                        style: TextStyle(fontSize: 18.0, color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.note,
                        color: Colors.blue[900],
                      ),
                      title: Text(
                        'பெயர்',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        ' உங்கள் விலங்கின் பெயர் இங்கே. எ.கா: நந்தினி ',
                        style: TextStyle(fontSize: 18.0, color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.pets,
                        color: Colors.blue[900],
                      ),
                      title: Text(
                        'இனப்பெருக்கம்',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        ' உங்கள் விலங்கின் இனப்பெருக்கம் இங்கே. எ.கா: பார்கூர்  ',
                        style: TextStyle(fontSize: 18.0, color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.nature_people,
                        color: Colors.blue[900],
                      ),
                      title: Text(
                        'இனங்கள்',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        ' உங்கள் விலங்கின் இனங்கள் இங்கே. எ.கா: மாடு ',
                        style: TextStyle(fontSize: 18.0, color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.calendar_today,
                        color: Colors.blue[900],
                      ),
                      title: Text(
                        'பிறந்த வருடம்',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        ' உங்கள் விலங்கின் பிறந்த ஆண்டு இங்கே எ.கா: 2015 ',
                        style: TextStyle(fontSize: 18.0, color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.history,
                        color: Colors.blue[900],
                      ),
                      title: Text(
                        'மருத்துவ வரலாறு',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        ' உங்கள் விலங்குக்கு கடந்த காலத்தில் ஏதேனும் நோய் / பிரச்சினை இருந்தால் சொல்லுங்கள்  ',
                        style: TextStyle(fontSize: 18.0, color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.add,
                        color: Colors.blue[900],
                      ),
                      title: Text(
                        'செல்லப்பிராணியைச் சேர்க்கவும்',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        ' உங்கள் செல்லப்பிராணியைச் சேர்க்க இங்கே கிளிக் செய்க  ',
                        style: TextStyle(fontSize: 18.0, color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.add,
                        color: Colors.blue[900],
                      ),
                      title: Text(
                        'இடம்',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        " இந்த தாவலில் சேர் பொத்தானைக் கிளிக் செய்வதன் மூலம் உங்கள் இருப்பிடத்தைச் சேர்க்க முடியும்.  ",
                        style: TextStyle(fontSize: 18.0, color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
