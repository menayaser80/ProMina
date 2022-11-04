import 'package:mina_gallery/models/login%20model.dart';

abstract class GalleryLoginStates
{
}
class GalleryLoginInitialState extends GalleryLoginStates
{}
class GalleryLoginLoadingState extends GalleryLoginStates
{}
class GalleryLoginSuccessState extends GalleryLoginStates
{
  final GalleryLoginModel loginModel;

  GalleryLoginSuccessState(this.loginModel);

}
class GalleryLoginErrorState extends GalleryLoginStates
{

  late final String error;
  GalleryLoginErrorState(this.error);
}
class GallerychangePasswordState extends GalleryLoginStates
{}