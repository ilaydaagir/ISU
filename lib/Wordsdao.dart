


import 'package:isu/screens/Words.dart';

import 'DatabaseHelper.dart';

class Wordsdao{

  Future<List<Words>> get3RandomWord(String category) async{
    //WHERE word_type like '%$aramaKelimesi%'
    var db = await DatabaseHelper.databaseAccess();
    String aramaKelimesi=category;
    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM meyveler WHERE word_type='$aramaKelimesi' ORDER BY RANDOM() LIMIT 3");
    return List.generate(maps.length, (i) {
      var row = maps[i];
      return Words(row["word_id"], row["word_name"], row["word_image"], row["word_url"], row["word_type"], row["word_description"]);
    });
  }
// Verileri çekerken yanlış seçenekler içerisinde doğru kelimenin olmaması için word_id gönderiyoruz
  Future<List<Words>> get2FalseAnswer(int word_id,String category) async{
    String aramaKelimesi=category;
    var db = await DatabaseHelper.databaseAccess();
// Göndereceğim word_id'ye eşit olmayan 2 tane word_id getirmesini sağladım
    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM meyveler WHERE word_id!=$word_id AND word_type='$aramaKelimesi' ORDER BY RANDOM() LIMIT 2");
    return List.generate(maps.length, (i) {
      var row = maps[i];
      return Words(row["word_id"], row["word_name"], row["word_image"], row["word_url"], row["word_type"], row["word_description"]);
    });
  }
}