import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class PlatformUpload {
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  final storage = FirebaseStorage.instance;

  // 画像をアップロードするメソッド
  Future<void> imageUpload() async {
    // imagePickerで画像を選択する
    final pickerFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickerFile == null) {
      return;
    }
    File file = File(pickerFile.path);
    try {
      final uid = auth.currentUser?.uid;
      const uploadName = "image.png";
      final snapshot = storage.ref().child("pf_image/$uid/$uploadName");
      // 画像をStorageにuploadする処理.
      final task = await snapshot.putFile(file);
      final imageUrl = await snapshot.storage
          .ref()
          .child("pf_image/$uid/$uploadName")
          .getDownloadURL();
    } catch (e) {
      throw e.toString();
    }
  }

  // Firestoreに入力フォームの情報を登録するメソッド
  Future<void> addPlatFormData(
      DateTime _selectedDate,
      String name,
      String pf_name,
      String price,
      String isSelection,
      int _startSelectedOption,
      int _paceSelectedOption) async {
    final uid = auth.currentUser?.uid;
    const uploadName = "image.png";
    final imageRef = storage.ref().child("pf_image/$uid/$uploadName");
    String imageUrl = await imageRef.getDownloadURL();

    // int -> bool
    bool intToBool(int a) => a == 1 ? true : false;
    // bool value
    bool firstValue = intToBool(_startSelectedOption);
    bool monthlyValue = intToBool(_paceSelectedOption);

    Map<String, dynamic> data = {
      'pf_name': pf_name,
      'image': imageUrl,
      'start_date': Timestamp.fromDate(_selectedDate),
      'genre': [
        isSelection,
      ],
      'plan': [
        {
          'first_payment': firstValue,
          'monthly_payment': monthlyValue,
          'name': name,
          'price': price,
        }
      ]
    };

    final _reference = db.collection("platform").doc(uid);
    _reference.set(data);
  }
}
