import 'package:flutter/material.dart';
import 'dart:js' as js;
void main() => runApp(MyApp());
List<Widget> getProjects(){
  return <Widget>[
    Project(
      "Soulless",
      "assets/images/Soulless.png",
      "LD Jam 45 submission"

    ),
    Project(
      "Necrokiller",
      "assets/images/Necrokiller.png",
      "game made for the Wowie game jam in less than 3 hours"
    ),
    Project(
      "PizzaParty",
      "assets/images/necrokiller.png",
      "Project made for GrizzHacks. This is an app that allows users to create "
          "a party and have others join the party. The purpose of this app is "
          "to make pizza selection easier by factoring in all people at the "
          "party preferences and maximizing satisfaction"
    )
  ];

}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'About Me',
      theme: ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        primaryColor: Colors.blue[800],
        accentColor: Colors.blue[600],

        // Define the default font family.
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
              _scrollController.animateTo(750, duration: Duration(seconds:1), curve:Curves.easeIn);
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

      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        controller: _scrollController,
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 160, 0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(100, 0, 0, 200),
                child:Text(
                  "Hey, I'm \nNithin Muthukumar.",
                  style: TextStyle(
                    fontSize: 68,
                    height: 1.2
                  ),
                  textAlign: TextAlign.left,
                ),

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




              SizedBox( height: 300,),
              Transform.translate(
                offset: Offset(titleDx,0),
                child: Center(
                  child: Text(
                      "About Me",
                      style: TextStyle(
                          fontSize: 36
                      )
                  ),
                ),
              ),

              SizedBox(height: 40,),

              AnimatedOpacity(
                duration: Duration(seconds: 3),
                opacity: isVisible? 1:0,
                child:Center(child:About()),
              ),
              SizedBox(height: 500,),
              Center(child:Text("Projects")),
              Row(

                children: getProjects(),

              ),
              SizedBox(height:500,),
              Text("Resume"),
              SizedBox(height: 500,),
              Column(
                children: <Widget>[
                  Row(children: <Widget>[Text("Achievements"),Text("Clubs")],)
                ],
              ),
            ],
          ),
        ),

      ),


    );
  }
}
class About extends StatelessWidget{
  final text="I'm a highschool student who is passionate about tech and software."
      "\n\nI enjoy participating in game jams and hackathons,\n"
      "developing software and doing side projects.\n\n"
      "My hobbies include playing Magic the Gathering and\n"
      "tinkering with my raspberry pi.";
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
class Project extends StatelessWidget{
  final String title;
  final String imagePath;
  final String description;
  Project(this.title,this.imagePath,this.description);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Card(
        child: Column(

          children: <Widget>[
            ListTile(
              title: Text(title),
              trailing: IconButton(icon: Icon(Icons.info),
                onPressed: () {
                showDialog(context: context,
                builder: (BuildContext context){
                  return AlertDialog(

                    content: ConstrainedBox(
                      child: Text(description),
                      constraints: BoxConstraints(maxWidth: 200),
                    )
                  );
                });

                },
              ),
            ),
            Image.asset(imagePath)
          ],

        ),


      ),
    );
  }
}

