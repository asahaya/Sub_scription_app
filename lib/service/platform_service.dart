import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PlatformService {
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  final createdAt = Timestamp.fromDate(DateTime.now());
  // 新規登録でプラットフォーム名を登録するメソッド
  Future<void> addPlatFormName(String pf_name) async {
    // uidを使用する
    final uid = auth.currentUser?.uid;
    await db.collection('platform').doc(uid).set({
      'pf_name': pf_name,
    });
  }
}
