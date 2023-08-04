import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:novasocial_admin/data/constants/app_key_names.dart';
import 'package:novasocial_admin/data/constants/app_strings.dart';
import 'package:novasocial_admin/data/models/misc/interfaces/interfaces.dart';
import 'package:novasocial_admin/data/models/misc/responser.dart';
import 'package:novasocial_admin/utils/errors/http_errors.dart';

class GlobalRepository {
  final firestore = FirebaseFirestore.instance;

  Future<Responser<List?>> fetchGlobal<T extends GlobalDocHelperInterface>(
      String docName) async {
    try {
      final doc =
          await firestore.collection(AppKeyNames.global).doc(docName).get();
      return Responser(
        message: AppStrings.success,
        isSuccess: true,
        data: doc.data()?[AppKeyNames.items],
      );
    } catch (e) {
      return ErrorHandler.error(e);
    }
  }

  Future<Responser> addToGlobal<T extends GlobalDocHelperInterface>(
    T item,
  ) async {
    try {
      await firestore.collection(AppKeyNames.global).doc(item.docName).update({
        AppKeyNames.ids: {item.id: true},
        AppKeyNames.items: FieldValue.arrayUnion([item.toJson()]),
      });
      return Responser(
        message: AppStrings.success,
        isSuccess: true,
      );
    } catch (e) {
      return ErrorHandler.error(e);
    }
  }
}
