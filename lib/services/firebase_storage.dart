import '../firebase_ref/references.dart';

Future<String?> getImg(String? imgName) async {
  if (imgName == null) {
    return null;
  } else {
    try {
      var urlRef = firebaseStorage
          .child('question_paper_images')
          .child('${imgName.toLowerCase()}.png');
      var imgUrl = await urlRef.getDownloadURL();
      return imgUrl;
    } catch (err) {
      print(err);
      return null;
    }
  }
}
