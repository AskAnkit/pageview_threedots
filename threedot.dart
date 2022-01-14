

import 'package:flutter/material.dart';
import 'package:signtry/utils/colors.dart';

import 'login_page.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int pageValue = 0;

  PageController myPageController = PageController();
  // @override
  // void initState() {
  //   Timer.periodic(const Duration(seconds: 4), (Timer timer){
  //     if(pageValue<2){
  //       pageValue++;
  //     }else{
  //       myPageController.animateTo(
  //              pageValue.toDouble(), duration: const Duration(seconds: 4),
  //              curve: Curves.easeIn);
  //     }
  //   }
  //   );
  //
  //   super.initState();
  // }
  //
  // @override
  // void dispose() {
  //   myPageController.dispose();
  //   super.dispose();
  // }
  //
  //

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            color: Colour.whiteColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Container(
                      padding: const EdgeInsets.only(top: 60),
                      child: Image.asset(
                        'lib/assets/images/logo2.png',
                        scale: 1.2,
                      )
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                RichText(
                    text: const TextSpan(
                        text: 'Welcome to',
                        style: TextStyle(color: Colors.black87, fontSize: 20),
                        children: <TextSpan>[
                          TextSpan(
                              text: ' Sign',
                              style: TextStyle(color: Colour.textColor))
                        ])),
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                  height: 300,
                  // decoration:  const BoxDecoration(
                  //   color:  Colors.blue,
                  //   shape: BoxShape.circle,
                  // ),
                  width: double.infinity,

                  child: PageView.builder(
                      controller: myPageController,
                      itemCount: 3,
                      onPageChanged: (value) {
                        setState(() {
                          debugPrint(value.toString());
                          pageValue = value;
                        });
                      },
                      itemBuilder: (context, index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: const BoxDecoration(

                                image: DecorationImage(
                                    image: AssetImage(
                                        'lib/assets/images/walk.png')
                                ),
                                shape: BoxShape.circle,
                              ),

                              height: 300,
                              width: 300,
                              // color: pageValue == 0
                              //     ?Colors.yellow : (pageValue == 1) ? Colors.red : Colors.green,
                            ),
                          ],
                        );
                      }),
                ),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for(int i = 0; i < 3; i++)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black, width: 1),
                            color: (pageValue == 0 && i == 0) ? Colour.themeColor
                                : (pageValue == 1 && i == 1) ? Colour.themeColor
                                : (pageValue == 2 && i == 2)
                                ? Colour.themeColor
                                : Colour.lightTheme,
                          ),
                          height: 12,
                          width: 12,

                        ),
                      )
                  ],
                ),
           const SizedBox(height: 50,),
                GestureDetector(

                  child: Container(
                    height: 50,
                    width: double.infinity,

                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('lib/assets/images/next.png')
                      )
                    ),
                  ),
                  onTap: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const LoginPage()));
                  },
                ),
              ],
            ),
          ),
        ),
      );
    }
  }

