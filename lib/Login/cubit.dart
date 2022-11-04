import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mina_gallery/Login/states.dart';
import 'package:mina_gallery/models/login%20model.dart';
import 'package:mina_gallery/public%20cubit/dio%20helper.dart';
import '../shared/end points.dart';
class GalleryLoginCubit extends Cubit<GalleryLoginStates>
{
  GalleryLoginCubit() : super(GalleryLoginInitialState());
  static GalleryLoginCubit get(context) => BlocProvider.of(context);
  GalleryLoginModel? loginModel;
  void userlogin({
    required String email,
    required String password,
  })
  {
    emit(GalleryLoginLoadingState());
    DioHelper.postData(url: LOGIN,
      data: {
        'email':email,
        'password':password,
      },
    ).then((value) {
      print(value.data);
      loginModel = GalleryLoginModel.fromJson(value.data);
      if(loginModel!.token.isNotEmpty)
        {
          emit(GalleryLoginSuccessState(loginModel!));
        }
      else
        {
          emit(GalleryLoginErrorState(value.data['error_message']));
        }
    }).catchError((error)
    {
      print(error.toString());
      emit(GalleryLoginErrorState(error.toString()));
    });
  }
  IconData suffix=Icons.visibility_outlined;
  bool isPassword=true;
  void changepasswordvisibility()
  {
    isPassword=!isPassword;
    suffix=isPassword?Icons.visibility_outlined:Icons.visibility_off_outlined;
    emit(GallerychangePasswordState());
  }



}