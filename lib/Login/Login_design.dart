import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:mina_gallery/Login/cubit.dart';
import 'package:mina_gallery/Login/states.dart';
import 'package:mina_gallery/modules/layout.dart';
import 'package:mina_gallery/shared/reusable%20components.dart';

class Login_screen extends StatefulWidget
{
  @override
  State<Login_screen> createState() => _Login_screenState();
}
class _Login_screenState extends State<Login_screen> {

  var formkey=GlobalKey<FormState>();
  var emailcontroller=TextEditingController();
  var passwordcontroller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(BuildContext context)=>GalleryLoginCubit(),
      child: BlocConsumer<GalleryLoginCubit,GalleryLoginStates>(
        listener:  (context,state)
        {
          if(state is GalleryLoginSuccessState)
          {
navigateandFinish(context, Layout());
          }
          else if(state is GalleryLoginErrorState)
            {
              showToast(text: state.error, state: ToastColor.ERROR);
            }
        },
        builder:(context,state){
          return Scaffold(
            body: SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Image.asset(
                    'assets/images/mena.jpg',
                    fit: BoxFit.cover,
                    height: double.infinity,
                    width: double.infinity,
                    scale: 1,
                  ),
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage('assets/images/mora.png'),
                        ),
                        Text('My\nGallery',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40.0,
                          ),),

                        SizedBox(
                          height: 20.0,
                        ),
                        GlassmorphicContainer(
                          width: 290,
                          height: 400,
                          borderRadius: 20,
                          blur: 20,
                          alignment: Alignment.bottomCenter,
                          border: 2,
                          linearGradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xFFffffff).withOpacity(0.1),
                                Color(0xFFFFFFFF).withOpacity(0.05),
                              ],
                              stops: [
                                0.1,
                                1,
                              ]),
                          borderGradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xFFffffff).withOpacity(0.5),
                              Color((0xFFFFFFFF)).withOpacity(0.5),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Form(
                              key: formkey,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Container(
                                      child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 35.0,
                                            ),
                                            Center(
                                              child:
                                              Text('LOG IN',style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold,
                                              ),),
                                            ),
                                            SizedBox(
                                              height: 40.0,
                                            ),
                                            defaultformfield(
                                              controller: emailcontroller,
                                              type: TextInputType.emailAddress,
                                              validator: (value)
                                              {
                                                if(value!.isEmpty&&value!=null)
                                                {
                                                  return '  Enter email address';
                                                }
                                              },
                                              label: 'Email Address',
                                            ),
                                            SizedBox(
                                              height: 40.0,
                                            ),
                                            defaultpassword(controller: passwordcontroller,
                                                type: TextInputType.visiblePassword,
                                                onsubmit: (value)
                                                {
                                                  if(formkey.currentState!.validate())
                                                  {
                                                    GalleryLoginCubit.get(context).
                                                    userlogin(email:emailcontroller.text,
                                                        password:passwordcontroller.text);
                                                  }
                                                },
                                                validator: (value)
                                                {
                                                  if(value!.isEmpty&&value!=null)
                                                  {
                                                    return ' password is too short';
                                                  }
                                                },
                                                label: 'password',
                                                ispassword:  GalleryLoginCubit.get(context).isPassword,
                                                suffix:  GalleryLoginCubit.get(context).suffix,
                                                suffixpressed: (){
                                                  GalleryLoginCubit.get(context).changepasswordvisibility();
                                                }
                                            ),
                                            SizedBox(
                                              height: 32.0,
                                            ),
                                            ConditionalBuilder(
                                              condition:state is!GalleryLoginLoadingState,
                                              builder: (context)=>Container(
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(20.0),
                                                    color: Colors.blue,
                                                  ),

                                                  child: MaterialButton(onPressed: (){
                                                    if(formkey.currentState!.validate())
                                                    {
                                                      GalleryLoginCubit.get(context).
                                                      userlogin(email:emailcontroller.text,
                                                          password:passwordcontroller.text);
                                                    }
                                                  },child: Text('SUBMIT',style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20.0,
                                                    color: Colors.white,
                                                  ),
                                                  ),

                                                  )),
                                              fallback:(context)=>Center(child: CircularProgressIndicator()),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                        ),
                      ],
                    ),
                  ),
                ],
              ),

            ),
          );
        } ,

      ),
    );
  }
}