class MatchesModel{

  String? firstTeam;
  String? secondTeam;
  String? firstImage;
  String? date;
  String? score;
  String? secondImage;
  int? clock;
  String? doc;


  MatchesModel({
    this.firstTeam,
    this.secondTeam,
    this.firstImage,
    this.secondImage,
    this.date,
    this.score,
    this.clock,
    this.doc,
  });


  MatchesModel.fromJson(Map<String , dynamic> json){
    firstTeam=json['firstTeam'];
    secondTeam=json['secondTeam'];
    firstImage=json['firstImage'];
    secondImage=json['secondImage'];
    date=json['data'];
    score=json['score'];
    clock=json['clock'];
    doc=json['doc'];
  }

  Map <String , dynamic> toMap(){
    return{
      'firstTeam':firstTeam,
      'secondTeam':secondTeam,
      'firstImage':firstImage,
      'secondImage':secondImage,
      'data':date,
      'score':score,
      'clock':clock,
      'doc':doc,
    };
  }
}