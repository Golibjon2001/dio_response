
class HomeModel {
  String? fullname;
  String? mobile;
  String? id;

  HomeModel({
     this.fullname,
     this.mobile,
     this.id,
  });



  HomeModel.fromJson(Map<String, dynamic> json) :
    fullname=json["fullname"],
    mobile=json["mobile"],
    id=json["id"];


  Map<String, dynamic> toJson() => {
    "fullname": fullname,
    "mobile": mobile,
    "id": id,
  };

  @override
  String toString() {
    return 'HomeModel{fullname: $fullname, mobile: $mobile, id: $id}';
  }
}
