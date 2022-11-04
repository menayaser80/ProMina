import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mina_gallery/Login/Login_design.dart';
import 'package:mina_gallery/modules/slide%20bar.dart';
import 'package:mina_gallery/modules/upload%20image.dart';
import 'package:mina_gallery/shared/reusable%20components.dart';
import '../Icon_broken.dart';
class Layout extends StatefulWidget {
  const Layout({Key? key}) : super(key: key);

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffebe0fe),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(
                          left: 15,
                          top: 5
                      ),
                      child: Text(
                        'Welcome \n Mina',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SideBar()
                  ],
                ),
                const SizedBox(
                  height: 13.0,
                ),
                Row(
                  children: [
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        navigateTo(context, Login_screen());
                        },
                      child: Container(
                        width: 80.0,
                        height: 40.0,
                        color: Colors.grey[300],
                        child: Row(
                          children: [
                            Icon(
                              IconBroken.Logout,
                              size: 16.0,
                            ),
                            SizedBox(
                              width: 7.0,
                            ),
                            Text('log out'),
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        showCupertinoModalPopup(
                            context: context,
                            builder: (BuildContext context) {
                              return Align(
                                alignment: Alignment.center,
                                child: Container(
                                  height: 200,
                                  width: 245,
                                  padding: const EdgeInsets.only(
                                    top: 20,
                                    bottom: 20,
                                    left: 80,
                                    right: 30,
                                  ),
                                  decoration:  BoxDecoration(
                                    color: Colors.white.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children:  [
                                      GestureDetector(
                                        onTap: ()  {
                                         navigateTo(context,UploadImageScreen() );
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20.0),
                                            color: Color (0xfff0d8fa),
                                          ),
                                          height: 50.0,
                                          width: 150.0,
                                          child: Row(
                                            children: [
                                              Image(image: AssetImage('assets/images/gallery.png'),),
                                              Text('Gellary',style: TextStyle(
                                                fontSize: 20.0,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 40.0,
                                      ),
                                      GestureDetector(
                                        onTap: () async {
                                       navigateTo(context, UploadImageScreen());
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20.0),
                                            color: Color(0xffecf6ff),
                                          ),
                                          height: 40.0,
                                          width: 250.0,
                                          child: Row(
                                            children: [
                                              Image(image: AssetImage('assets/images/cam.png'),),
                                              Text('Camera',style: TextStyle(
                                                fontSize: 23,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }
                        );
                      },
                      child: Container(
                        width: 80.0,
                        height: 40.0,
                        color: Colors.grey[300],
                        child: Row(
                          children: [
                            Icon(
                              IconBroken.Upload,
                              size: 16.0,
                            ),
                            SizedBox(
                              width: 7.0,
                            ),
                            Text('Upload'),
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
                const SizedBox(
                  height: 13.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Image(image: AssetImage('assets/images/design1.png')),
                    Image(image: AssetImage('assets/images/design2.png')),
                    Image(image: AssetImage('assets/images/design3.png')),
                  ],
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Image(image: AssetImage('assets/images/design4.png')),
                    Image(image: AssetImage('assets/images/design5.png')),
                    Image(image: AssetImage('assets/images/design6.png')),
                  ],
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Image(image: AssetImage('assets/images/d1.png')),
                    Image(image: AssetImage('assets/images/d2.png')),
                    Image(image: AssetImage('assets/images/d3.png')),
                  ],
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Image(image: AssetImage('assets/images/d4.png')),
                    Image(image: AssetImage('assets/images/d5.png')),
                    Image(image: AssetImage('assets/images/d6.png')),
                  ],
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Image(image: AssetImage('assets/images/design1.png')),
                    Image(image: AssetImage('assets/images/design2.png')),
                    Image(image: AssetImage('assets/images/design3.png')),
                  ],
                ),
                const SizedBox(
                  height: 5.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
