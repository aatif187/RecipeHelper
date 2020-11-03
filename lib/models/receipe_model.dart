class RecipeModel {
  String url;
  String desc;
  String img;
  String title;
  RecipeModel({this.title, this.desc, this.url, this.img});
  factory RecipeModel.fromMap(Map<String, dynamic> parsedJSON) {
    return RecipeModel(
        desc: parsedJSON["source"],
        img: parsedJSON["image"],
        title: parsedJSON["label"],
        url: parsedJSON["url"]);
  }
}
