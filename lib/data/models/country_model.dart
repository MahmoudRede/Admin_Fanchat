class CountryModel {
  String? image;
  String? name;


  CountryModel({
    this.image,
    this.name,

  });
  CountryModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    name = json['name'];

  }

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'name': name,

    };
  }
}
