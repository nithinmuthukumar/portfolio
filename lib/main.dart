import 'package:flutter/material.dart';
import 'dart:js' as js;
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'About Me',
      theme: ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.blueGrey,
        primaryColor: Colors.blue[800],
        accentColor: Colors.blue[600],

        // Define the default font family.
        fontFamily: 'Georgia',

        // Define the default TextTheme. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: TextTheme(

          headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          body1: TextStyle(fontSize: 32.0,color: Colors.white),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String current="Home";
  double titleDx=0;
  bool isVisible=false;
  ScrollController _scrollController=ScrollController();

  scrollListener(){
    if(_scrollController.offset>840||_scrollController.offset<150){
      setState((){
        isVisible=false;
      });

    }else{
      setState(() {
        isVisible=true;
      });
    }
  }
  @override
  void initState(){
    _scrollController.addListener(scrollListener);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text(current),

        actions: <Widget>[
          RaisedButton(
            child:Text("About Me"),
            onPressed: (){
              _scrollController.animateTo(750, duration: Duration(seconds:1), curve: ElasticInCurve());


            },
          ),
          RaisedButton(
            child: Text("Projects"),
            onPressed: (){

            },
          ),
          RaisedButton(
            child: Text("Resume"),
            onPressed: (){

            },
          ),
          RaisedButton(
            child: Text("Achievements"),
            onPressed: (){

            },
          ),
          RaisedButton(
            child: Text("Clubs"),
            onPressed: (){

            },
          )

        ],

      ),

      body: Center(

        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          controller: _scrollController,
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 160, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Hello, my name is Nithin Muthukumar.\n",
                  style: TextStyle(
                      fontSize: 48,

                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                ButtonBar(

                  alignment: MainAxisAlignment.center,
                  buttonPadding: EdgeInsets.fromLTRB(0,0,0,0),
                  children: <Widget>[
                    RaisedButton(
                      child: Image.asset("assets/images/github_icon.png",scale: 24,),
                      onPressed: (){
                        js.context.callMethod("open", ["https://github.com/nithinmuthukumar"]);
                        },
                    ),
                    RaisedButton(
                      child: Image.asset("assets/images/itch_icon.png",scale: 12,),


                    ),
                    RaisedButton(
                      child: Image.asset("assets/images/github_icon.png",scale: 24,),
                      onPressed: (){
                        js.context.callMethod("open", ["https://github.com/nithinmuthukumar"]);
                      },
                    ),
                    RaisedButton(
                      child: Image.asset("assets/images/itch_icon.png",scale: 12,),


                    ),
                  ],

                ),




                SizedBox( height: 500,),
                Transform.translate(
                  offset: Offset(titleDx,0),
                  child: Text(
                    "About Me",
                    style: TextStyle(
                      fontSize: 36
                    )
                  ),


                ),

                SizedBox(height: 40,),

                AnimatedOpacity(
                  duration: Duration(seconds: 2),
                  opacity: isVisible? 1:0,
                  child:About(),
                ),
                SizedBox(height: 500,),
                Text("Projects"),
                SizedBox(height:500,),
                Text("Resume"),
                SizedBox(height: 500,),
                Text("Achievements"),
                SizedBox(height:500),
                Text("Clubs"),
                SizedBox(height:500)
              ],
            ),
          ),

        ),
      ),


    );
  }
}
class About extends StatelessWidget{
  final text="I'm a highschool student who is passionate about tech and software."
      "\nI enjoy participating in game jams and hackathons,\n"
      "developing software and doing side projects.";
  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[
        Image.asset("assets/images/itch_icon.png",scale:10),
        Text(
          text,
          style: TextStyle(
              fontSize: 18,
              height: 1.5
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );

  }

}
