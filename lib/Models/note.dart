class Note {
  String title;
  String content;
  //DateTime? dateadded;

  Note({required this.title, required this.content});

  // factory Note.fromMap(Map<String, dynamic>map){
  //   return Note(
  //
  //     title: map["title"],
  //     content: map["content"],
  //     dateadded: DateTime.tryParse(map["dateadded"]),
  //   );
  // }

  // Map<String,dynamic> toMap(){
  //   return{
  //     "title": title,
  //     "dateadded": dateadded!.toIso8601String()
  //   };
  // }

}
