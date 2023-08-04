import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:novasocial_admin/data/constants/app_key_names.dart';
import 'package:novasocial_admin/data/constants/app_strings.dart';
import 'package:novasocial_admin/data/models/misc/responser.dart';
import 'package:novasocial_admin/data/models/user/export.dart';
import 'package:novasocial_admin/utils/errors/http_errors.dart';

class ProfileRepository {
  final firestore = FirebaseFirestore.instance;

  Future<Responser<UserModel?>> saveProfile(UserModel profile) async {
    try {
      await firestore
          .collection(AppKeyNames.user)
          .doc(profile.id)
          .set(profile.toJson());
      return Responser(
        message: AppStrings.success,
        isSuccess: true,
        data: profile,
      );
    } catch (e) {
      print(e.toString());
      return ErrorHandler.error<UserModel>(e);
    }
  }

  Future<Responser<List<UserModel>?>> fetchAllProfiles() async {
    try {
      final query = await firestore.collection(AppKeyNames.user).get();
      if (query.docs.isEmpty) {
        //failed to find user document
        return Responser(message: AppStrings.failure, isSuccess: false);
      }
      List<UserModel>? users;
      for (var element in query.docs) {
        users ??= [];
        users.add(UserModel.fromJson(element.data()));
      }
      return Responser(
        message: AppStrings.success,
        isSuccess: true,
        data: users,
      );
    } catch (e) {
      return ErrorHandler.error<List<UserModel>>(e);
    }
  }

  Future<Responser<UserModel?>> fetchProfileByUsername(String username) async {
    try {
      final query = await firestore
          .collection(AppKeyNames.user)
          .where(AppKeyNames.usernameField, isEqualTo: username)
          .get();
      if (query.docs.isEmpty) {
        //failed to find user document
        return Responser(message: AppStrings.failure, isSuccess: false);
      }
      final userModel = UserModel.fromJson(query.docs.first.data());
      return Responser(
        message: AppStrings.success,
        isSuccess: true,
        data: userModel,
      );
    } catch (e) {
      return ErrorHandler.error<UserModel>(e);
    }
  }

  Future<Responser<int?>> countTotalProfiles() async {
    try {
      final query =
          firestore.collection(AppKeyNames.user).where('email', isNull: false);
      final length = await query.count().get();
      return Responser(
        message: AppStrings.success,
        isSuccess: true,
        data: length.count,
      );
    } catch (e) {
      return ErrorHandler.error<int>(e);
    }
  }

  Future<Responser<int?>> countUsersInWaitlist() async {
    try {
      final query = firestore
          .collection(AppKeyNames.user)
          .where(AppKeyNames.inTheWaitlistField, isEqualTo: true);
      final length = await query.count().get();
      return Responser(
        message: AppStrings.success,
        isSuccess: true,
        data: length.count,
      );
    } catch (e) {
      return ErrorHandler.error<int>(e);
    }
  }

  Future<Responser<int?>> countOnboardedUsers() async {
    try {
      final query = firestore
          .collection(AppKeyNames.user)
          .where(AppKeyNames.inTheWaitlistField, isNull: false);
      final length = await query.count().get();
      return Responser(
        message: AppStrings.success,
        isSuccess: true,
        data: length.count,
      );
    } catch (e) {
      return ErrorHandler.error<int>(e);
    }
  }

  Future<Responser<List<QueryDocumentSnapshot>?>> fetchUserByFilter(
      String key, String value) async {
    try {
      var query =
          firestore.collection(AppKeyNames.user).where(key, isEqualTo: value);
      final snapshot = await query.get();
      if (snapshot.docs.isEmpty) {
        return Responser(
          message: AppStrings.failure,
          isSuccess: false,
        );
      }
      return Responser(
        message: AppStrings.success,
        isSuccess: true,
        data: snapshot.docs,
      );
    } catch (e) {
      return ErrorHandler.error<List<QueryDocumentSnapshot>?>(e);
    }
  }

  Future<Responser<List<QueryDocumentSnapshot>?>> fetchUserByFilterDate(
      String key, DateTime? selectedDate1, DateTime? selectedDate2) async {
    try {
      Query<Map<String, dynamic>> query;
      if (selectedDate2 == null) {
        query = firestore.collection(AppKeyNames.user).where(
              key,
              isGreaterThanOrEqualTo: Timestamp.fromDate(selectedDate1!),
              isLessThan:
                  Timestamp.fromDate(selectedDate1.add(Duration(days: 1))),
            );
      } else {
        query = firestore.collection(AppKeyNames.user).where(
              key,
              isGreaterThanOrEqualTo: Timestamp.fromDate(selectedDate1!),
              isLessThan: Timestamp.fromDate(selectedDate2),
            );
      }

      final snapshot = await query.get();
      if (snapshot.docs.isEmpty) {
        return Responser(
          message: AppStrings.failure,
          isSuccess: false,
        );
      }
      return Responser(
        message: AppStrings.success,
        isSuccess: true,
        data: snapshot.docs,
      );
    } catch (e) {
      return ErrorHandler.error<List<QueryDocumentSnapshot>?>(e);
    }
  }

  Future<Responser<List<UserModel>?>> fetchWaitlistedProfiles() async {
    try {
      final query = await firestore
          .collection(AppKeyNames.user)
          .where(AppKeyNames.inTheWaitlistField, isEqualTo: true)
          .get();
      if (query.docs.isEmpty) {
        //failed to find user document
        return Responser(message: AppStrings.failure, isSuccess: false);
      }
      List<UserModel>? users;
      for (var element in query.docs) {
        users ??= [];
        users.add(UserModel.fromJson(element.data()));
      }
      return Responser(
        message: AppStrings.success,
        isSuccess: true,
        data: users,
      );
    } catch (e) {
      return ErrorHandler.error<List<UserModel>>(e);
    }
  }
}
