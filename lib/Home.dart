import 'dart:ui';
import 'dart:html' as html;
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  _Home createState() => new _Home();
}

class _Home extends State<Home> {

  void showMenu() {
    setState(() {
      visibleMenu = !visibleMenu;
    });
  }

ChewieController _chewieController;
final VideoPlayerController videoPlayerController = VideoPlayerController.network("https://uc9e6229b82dc625f50588448f4b.dl.dropboxusercontent.com/cd/0/inline/A1k_OtcgzgceW7qP4DGBVVRjTbI_DcH6y_QekjkUgXGCnQkmcxqJLXjMhgY9WKHXY87Xhq9zn-TJMtUYOTNI9U-tJiHOOsI3oOF_pGkecgAxLGiUOVGYPxB3y1mCbv2kfIU/file#");

@override
void initState()
{
  _chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      aspectRatio: 16 / 9,
      // Prepare the video to be played and display the first frame
      autoInitialize: true,
      looping: true,
      autoPlay: true,
      // Errors can occur for example when trying to play a video
      // from a non-existent URL
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );
  super.initState();
}

  void twitter(){
    html.window.open('https://twitter.com','_blank');
  }

   void youtube(){
    html.window.open('https://youtube.com','_blank');
  }

   void facebook(){
    html.window.open('https://facebook.com','_blank');
  }
   
  @override
  void dispose() {
    super.dispose();
    // IMPORTANT to dispose of all the used resources
    videoPlayerController.dispose();
    _chewieController.dispose();
  }

  bool visibleMenu = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: ScrollConfiguration(
          behavior: MyBehavior(),
          child: SingleChildScrollView(
              child: Column(children: <Widget>[
            SizedBox(
              child: Stack(
                children: <Widget>[
                  Container(child: Image.asset("assets/images/image.jpg")),
                  Container(
                      padding: EdgeInsets.only(top: 300),
                      child: Center(
                        child: Text("LifeBoat",
                            style: GoogleFonts.girassol(
                                textStyle: TextStyle(
                                    fontSize: 90, color: Colors.amber))),
                      )),
                  Container(
                      padding: EdgeInsets.only(top: 400),
                      child: Center(
                        child: Text("Rediscover yourself",
                            style: GoogleFonts.abel(
                                textStyle: TextStyle(
                                    fontSize: 30,
                                    color: Colors.amber,
                                    fontWeight: FontWeight.w100))),
                      )),
                     BackdropFilter(
                        filter: visibleMenu? ImageFilter.blur(sigmaX: 0.7, sigmaY: 0.7) : ImageFilter.blur(sigmaX: 0, sigmaY: 0),
                        child: Opacity(
                            opacity: visibleMenu ? 0.2 : 0,
                            child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(30.0),
                                    topRight: Radius.circular(30)),
                                    child: Container(
                                      height: MediaQuery.of(context).size.height,
                                      color: Colors.amber,
                                      width: 400,
                                )))),
                  Row(
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: FlatButton(
                              onPressed: showMenu,
                              highlightColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              child: Icon(
                                Icons.menu,
                                color: Colors.amber,
                                size: 40,
                              ))),
                    ],
                  ),
                  Visibility (
                 child: Container( 
                   height: MediaQuery.of(context).size.height,
                   width: 400,
                   child: Column(children: <Widget>[
                   Padding(
                     child: Text("Random stuff goes here"),
                   padding: EdgeInsets.only(top: 100))
                  ],)),
                  visible: visibleMenu,
                  )
                ],
              ),
            ),
            Padding(
              child: Text("Who We Are",
                  style: GoogleFonts.abel(
                      textStyle: TextStyle(fontSize: 50, color: Colors.amber))),
              padding: EdgeInsets.only(top: 100, bottom: 10),
            ),
            Padding(
              padding: EdgeInsets.only(left: 50, right: 50, bottom: 100),
              child: Text(
                "LifeBoat is an organisation focused on making quality mental health care service accesible to everyone in our locality, and in time, all of India. Our app virtualizes the initial steps of diagnosis and cure of mental health issues, so patients may have easy and low cost-free access to voluntary professionals and local support groups. Have you been feeling Lonely? Depressed? Have you been battling an Addiction? But you don't have access to mental health care? Take the LifeBoat, and join us on this journey!",
                style: GoogleFonts.abel(
                    textStyle: TextStyle(fontSize: 20, color: Colors.amber)))),

                    Container(color: Colors.white,child: Chewie(controller: _chewieController)),
    
            ClipRRect(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30.0),
                                    topRight: Radius.circular(30)),
                                child: Container(
                                  height: 200,
                                    color: Colors.amber[50],
                                    child: Column(children: <Widget>[
                                     Center( 
                                         child: Padding( child: Row(
                                           
                                           mainAxisAlignment: MainAxisAlignment.center,
                                           children: <Widget>[
                                        FlatButton(onPressed: twitter, child: Image.asset("assets/images/twitter.png")
                                        ),
                                        FlatButton(onPressed: facebook, child: Image.asset("assets/images/facebook.png")
                                        ),
                                        FlatButton(onPressed: youtube, child: Image.asset("assets/images/youtube.png")
                                        ),
                                      ],),
                                      padding: EdgeInsets.only(bottom: 20, top: 60)))
                                    ],)
                                )
            )
          ])),
        ));
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
