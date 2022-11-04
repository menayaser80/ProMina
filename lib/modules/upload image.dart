import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mina_gallery/public%20cubit/dio%20helper.dart';
import 'package:mina_gallery/shared/end%20points.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UploadImageScreen extends StatefulWidget {
bool isGallery;
UploadImageScreen({required this.isGallery});

  @override
  _UploadImageScreenState createState() => _UploadImageScreenState();
}

class _UploadImageScreenState extends State<UploadImageScreen> {
  XFile? image;
  final _picker = ImagePicker();
  bool showSpinner = false;

  Future getImage() async {
    // showDialog<bool>(
    //     context: context,
    //     builder: (context) => SizedBox(
    //           width: MediaQuery.of(context).size.width * 1.8,
    //           child: AlertDialog(
    //             content: Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceAround,
    //               children: [
    //                 TextButton(onPressed: ()async {
    //
    //                 }, child: Text('Gallery')),
    //                 TextButton(onPressed: () async{
    //                   image =
    //                       await _picker.pickImage(source: ImageSource.camera, imageQuality: 80);
    //                   Navigator.pop(context);
    //                   setState((){});
    //                 }, child: Text('Camera')),
    //               ],
    //             ),
    //             elevation: 0.1,
    //             actions: [],
    //           ),
    //         ));
    if(widget.isGallery == true) {
      image =
      await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);

      setState((){});
    }else {
      image =
      await _picker.pickImage(source: ImageSource.camera, imageQuality: 80);

      setState((){});
    }


    // if (pickedFile != null) {
    //   image = await _picker.pickImage(source: ImageSource.gallery);
    //   setState(() {});
    // } else {
    //   print('no image selected');
    // }
  }

  Future<void> uploadImage() async {
    FormData formData = FormData.fromMap({
      'img': await MultipartFile.fromFile(image!.path, filename: image!.name)


    });
    Response response = await DioHelper.postData(
        url: POST,
        data: formData,
        token:
            "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYTE3MTBmNTA4MzFmY2NiNDYwNGExMzY0ODJmNDFiZjU5OTEzY2JkY2ZhZmU2ZDY1OWJmZmQ5OGVkODE1MDk5MTRmNTRmMjZmZDA2NGZjZDIiLCJpYXQiOjE2NjcyODk3ODUuMDMzMTk5LCJuYmYiOjE2NjcyODk3ODUuMDMzMjAzLCJleHAiOjE2OTg4MjU3ODUuMDI2MzI0LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.bWImC0xkzNQe8iKxL1Scg0tGGZGUy3vWsiX1vBzj1gLvynIMJcOqVkEVZc2C3MgSaCHjyqGkN7zWyqYVqLasAaKKFmj9JiQgXozvPcHJPoJCGQQvogt-gnM0DPeFMF-g_CVJPNZ3nUkXpOLl3Os5DhvW53OVT1n5pisoNyvsrEJURWTXxt1EIxwnmoj0An8y9kq2WSX4Zn2RoVGKe3QnL-KOGKksfv2ahj7hG-ZNwVYazI6TXCIxZBCYGoZtfvq9CjTrVUcCBSiGgdyaJzAZi0lNR2c2zcZxWGbBQ_QvfTFDZmmPyogScE5cgy4MGsnYe4Sw7qLmHIrSsrMaJxRgQ_b7xobq9ob1vDhw9O-VcPpiCllEFyjMkdKOFC8UffoYZB3bafp9KZB6Dr3tS7fo6f4ojAKnj-b8g6AigjuFb4FAYlC0vxT76mtvvYFm8MjH1kH2QmJ0HzvhBxv45K9Cdtuvr3DdrwyDaoROR4eZ6S-Xp-LYuCkZ-e4UenLJC4mDUu8u6xoyLHKul3FhNlAUMj-oScKZgJxRUYhbVxzXruHwaycKdlX284-Y6cfSAf3AjIvfaXYeB1ajGuuCtYceBVGM5tDxY4i9I7kthk3DNRjaRQPIl5c8GQlYV3I3p-RItB33Y-ECNiG92U2fgB8fAVw5urOuFX7pIZZ0NEc6VAY");
    print(response.data);
    //
    // setState(() {
    //   showSpinner = true ;
    // });
    //
    // var stream  = new http.ByteStream(image!.openRead());
    // stream.cast();
    //
    // var length = await image!.length();
    // var uri = Uri.parse('https://technichal.prominaagency.com/api/upload');
    // var request = new http.MultipartRequest('POST', uri);
    // request.fields['title'] = "Static title" ;
    // var multiport = new http.MultipartFile(
    //     'img',
    //     stream,
    //     length);
    //
    // request.files.add(multiport);
    //
    // var response = await request.send() ;
    //
    // print(response.stream.toString());
    // if(response.statusCode == 200){
    //   setState(() {
    //     showSpinner = false ;
    //   });
    //   print('image uploaded');
    // }else {
    //   print('failed');
    //   setState(() {
    //     showSpinner = false ;
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Upload Image'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                getImage();
              },
              child: Container(
                child: image == null
                    ? const Center(
                        child: Text('Pick Image'),
                      )
                    : Center(
                        child: Image.file(
                          File(image!.path),
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
              ),
            ),
            const SizedBox(
              height: 150,
            ),
            GestureDetector(
              onTap: () {
                uploadImage();
              },
              child: Container(
                height: 50,
                width: 200,
                color: Colors.green,
                child: const Center(child: Text('Upload')),
              ),
            )
          ],
        ),
      ),
    );
  }
}
