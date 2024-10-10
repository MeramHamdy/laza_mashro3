import 'package:flutter/material.dart';
import 'package:laza_mashro3/screens/home_screen.dart';
import 'package:laza_mashro3/theme_color/themes_provider.dart';
import 'package:provider/provider.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemesProvider>(context);

    return Scaffold(

     body: Padding(
        padding: const EdgeInsets.all(15.0),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50,),
        CircleAvatar(
        backgroundColor: Colors.deepPurple,
            child: IconButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => HomeScreen()));

            },
              icon: Icon(Icons.menu),
            )),
        SizedBox(height: 20,),
        ListTile(
            leading:CircleAvatar(
              child: Icon(Icons.person),
            ),
            title: Text("UserName",),
            subtitle: Text("mera@gmail.com"),
        ),
              SizedBox(height:20 ,),
              Row(
                    children: [
                      Icon(Icons.light_mode_outlined,color: Colors.deepPurple,),
                      SizedBox(width: 10,),
                      Text(
                        themeProvider.isDarkMode? 'Light Mode':'Dark Mode',
                        style: TextStyle(fontSize: 15),
                      ),
                      Spacer(),
                      Switch(
                        value: themeProvider.isDarkMode,
                        onChanged: (value) {themeProvider.toggleThem();},
                        activeColor: Colors.deepPurple,
                        activeTrackColor: Colors.white,
                      )
                    ],
                  ),
              Roow(icoon: Icons.card_giftcard, txt: "Order"),
              Spacer(),
              Roow(icoon: Icons.logout, txt: "Logout"),
              SizedBox(height:50 ,),


            ]),
      )  );
  }
}
class Roow extends StatelessWidget {
  IconData icoon;
  String txt;
   Roow({required this.icoon,required this.txt});

  @override
  Widget build(BuildContext context) {
    return    Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          Icon(icoon,color: Colors.deepPurple,),
          SizedBox(width: 10,),
          Text(txt,style: TextStyle(fontSize: 15),),
        ],
      ),
    );
  }
}

