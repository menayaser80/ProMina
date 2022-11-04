import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast({
  required String text ,
  required ToastColor state ,
}) =>  Fluttertoast.showToast(
  msg: text,
  toastLength: Toast.LENGTH_SHORT,
  gravity: ToastGravity.BOTTOM,
  timeInSecForIosWeb: 5,
  backgroundColor: ChangeToastColor(state),
  textColor: Colors.white,
  fontSize: 16.0,
);
enum ToastColor {SUCCESS,ERROR,WARNING}
Color ChangeToastColor(ToastColor state)
{
  Color color;
  switch(state){
    case ToastColor.SUCCESS:
      color = Colors.green;
      break;
    case ToastColor.ERROR:
      color = Colors.red;
      break;
    case ToastColor.WARNING:
      color = Colors.amber;
      break;
  }
  return color;
}
Widget myDivider()=>Padding(
  padding: EdgeInsetsDirectional.only(
    start: 20.0,
  ),
  child: Container(
    width: double.infinity,
    height: 1.0,
    color: Colors.grey[300],

  ),
);
void navigateTo(context,Widget)=>Navigator.push(context, MaterialPageRoute(
  builder:(context)=>Widget,
));
Widget defaultpassword({
  required TextEditingController controller,
  required TextInputType type,
  Function(String x)?onchange,
  Function(String x)?onsubmit,
  required String? Function(String?val)?validator,
  required String label,
  IconData? suffix,
  bool ispassword=false,
  VoidCallback? suffixpressed,
})=>TextFormField(
  controller: controller,
  decoration: InputDecoration(
    suffixIcon: suffix!=null?IconButton(
      onPressed:suffixpressed,
      icon:   Icon(
        suffix,
      ),
    ):null,
    labelText: label,
 enabledBorder: OutlineInputBorder(
   borderRadius: BorderRadius.circular(20.0),
 ),
    border: OutlineInputBorder(),
  ),
  validator: validator,
  keyboardType:type,
  obscureText: ispassword,
  onChanged: onchange,
  onFieldSubmitted:onsubmit,
);
Widget defaultformfield({
  required TextEditingController controller,
  required TextInputType type,
  Function(String x)?onchange,
  required String? Function(String?val)?validator,
  required String label,

})=> TextFormField(
    controller: controller,
    decoration: InputDecoration(
      labelText: label,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      border: OutlineInputBorder(),
    ),
    validator: validator,

    keyboardType:type,
    onChanged:onchange
);
void navigateandFinish(context,Widget)=>Navigator.pushAndRemoveUntil(context,MaterialPageRoute(
  builder: (context)=>Widget,
),
      (route)
  {
    return false;
  },
);