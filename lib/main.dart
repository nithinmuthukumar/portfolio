import 'package:flutter/material.dart';

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
        accentColor: Colors.blueAccent[600],

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
                RaisedButton(
                  child: Text("Projects"),
                  onPressed: (){
                    _scrollController.animateTo(400, duration: Duration(seconds:1), curve: ElasticInCurve());
                  },

                ),
                SizedBox( height: 250,),

                AnimatedOpacity(
                  duration: Duration(seconds: 1),
                  opacity: isVisible? 1:0,


                  child:Text(
                    "I'm a highschool student who is passionate about code."
                        "\nI enjoy participating in game jams and hackathons,\n"
                        "developing software and doing side projects.",
                    style: TextStyle(
                        fontSize: 18,
                        height: 1.5
                    ),
                    textAlign: TextAlign.center,
                  )
                ),
                SizedBox(height: 400,),
                Text("Projects")
              ],
            ),
          ),

        ),
      ),


    );
  }
}
