//model
class Character {
  late int charId;
  late String name;
  late String nickName;
  late String image;
  late List<dynamic> jobs;
  late String statusIfDeadOrAlive;
  late List<dynamic> appearance;
  late String actorName;
  late String category;
  late String birthday;
  late List<dynamic> betterCallSaulAppearance;

  Character.fromJson(Map<String, dynamic> json){
    charId = json['char_id'];
    name = json['name'];
    nickName = json['nickname'];
    image = json['img'];
    jobs = json['occupation'];
    statusIfDeadOrAlive = json['status'];
    appearance = json['appearance'];
    actorName = json['portrayed'];
    category = json['category'];
    birthday = json['birthday'];
    betterCallSaulAppearance = json['better_call_saul_appearance'];
  }
}