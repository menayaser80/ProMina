
class GalleryLoginModel
{
  late UserData? data;
  late String token;
  GalleryLoginModel.fromJson(Map<String,dynamic> json)
  {
    token=json['token'];
    data = json['data'] != null ? UserData.fromJson(json['data']) : null;
  }
}
class UserData
{
  late int id;
  late String name;
  late String email;
  late String phone;
  late String image;
  // late int points;
  // late int credit;

  UserData.fromJson(Map<String,dynamic> json)
  {
    id = json['id'];
    name= json['name'];
    email= json['email'];
    phone= json['phone'];
    image= json['image'];
    // points= json['points'];
    // credit= json['credit'];
  }

}