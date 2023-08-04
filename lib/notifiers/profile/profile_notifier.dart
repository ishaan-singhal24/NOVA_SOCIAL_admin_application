import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:novasocial_admin/data/constants/app_key_names.dart';
import 'package:novasocial_admin/data/enums/enums.dart';
import 'package:novasocial_admin/data/models/nova/interests/nova_interests.dart';
import 'package:novasocial_admin/data/models/nova/opportunities/nova_opportunities.dart';
import 'package:novasocial_admin/data/models/user/export.dart';
import 'package:novasocial_admin/repositories/profile/global_repository.dart';
import 'package:novasocial_admin/repositories/profile/profile_repository.dart';
part 'profile_notifier.g.dart';

@JsonSerializable(explicitToJson: true)
class ProfileNotifier with ChangeNotifier {
  ProfileNotifier();

  @JsonKey(includeFromJson: false, includeToJson: false)
  late ProfileRepository _profileRepo;
  @JsonKey(includeFromJson: false, includeToJson: false)
  late GlobalRepository _globalRepo;

  int? totalProfilesCounter;
  int? waitlistCounter;
  int? onboardedCounter;

  List<NovaInterests>? globalInterests;
  List<NovaOpportunities>? globalOpportunities;
  List<UserDreamCountry>? globalCountries;
  List<UserDreamCareer>? globalCareers;
  List<UserDreamCollege>? globalColleges;

  List<UserLocation>? globalCities;

  List<UserModel>? filterProfiles;
  List<UserModel>? allProfiles;
  List<UserModel>? waitlistedProfiles;

  UserModel? currentUserProfile;
  UserModel? profileByUsername;

  InitEnum? fetchFilterProfileStatus;

  static ProfileNotifier initialize(
    ProfileRepository profRepo, {
    required GlobalRepository globalRepo,
  }) {
    late ProfileNotifier instance;
    try {
      instance = ProfileNotifier();
    } catch (e) {
      instance = ProfileNotifier();
    }
    instance._profileRepo = profRepo;
    instance._globalRepo = globalRepo;
    return instance;
  }

  Future<void> fetchAllProfiles() async {
    final profileRes = await _profileRepo.fetchAllProfiles();
    if (profileRes.isSuccess) {
      allProfiles = profileRes.data;
    } else {}
    notifyListeners();
  }

  Future<void> fetchWaitlistedUsers() async {
    final profileRes = await _profileRepo.fetchWaitlistedProfiles();
    if (profileRes.isSuccess) {
      waitlistedProfiles = profileRes.data;
    } else {}
    notifyListeners();
  }

  Future<void> fetchProfileByUsername(String? username) async {
    if (username != null) {
      final profileRes = await _profileRepo.fetchProfileByUsername(username);
      if (profileRes.isSuccess) {
        profileByUsername = profileRes.data;
      } else {}
      notifyListeners();
    }
  }

  Future<void> countTotalProfiles() async {
    final res = await _profileRepo.countTotalProfiles();
    if (res.isSuccess) {
      totalProfilesCounter = res.data;
    }
    notifyListeners();
  }

  Future<void> countUsersInWaitlist() async {
    final res = await _profileRepo.countUsersInWaitlist();
    if (res.isSuccess) {
      waitlistCounter = res.data;
    }
    notifyListeners();
  }

  Future<void> countOnboardedUsers() async {
    final res = await _profileRepo.countOnboardedUsers();
    if (res.isSuccess) {
      onboardedCounter = res.data;
    }
    notifyListeners();
  }

  Future<void> saveProfile(UserModel profile) async {
    print('save called');
    final res = await _profileRepo.saveProfile(profile);
    if (res.isSuccess) {
      print('save called 1');

      currentUserProfile = res.data;
      currentUserProfile = _sortModelListsAsPerDate(currentUserProfile);
    }
    notifyListeners();
  }

  Future<void> fetchGlobalInterests() async {
    if (globalInterests?.isNotEmpty ?? false) {
      return;
    }
    final res =
        await _globalRepo.fetchGlobal<NovaInterests>(AppKeyNames.interests);
    if (res.isSuccess) {
      globalInterests = res.data
          ?.map(
            (e) => NovaInterests.fromJson(e),
          )
          .toList();
    }
    notifyListeners();
  }

  Future<void> fetchGlobalOpportunities() async {
    if (globalOpportunities?.isNotEmpty ?? false) {
      return;
    }
    final res = await _globalRepo
        .fetchGlobal<NovaOpportunities>(AppKeyNames.opportunities);
    if (res.isSuccess) {
      globalOpportunities = res.data
          ?.map(
            (e) => NovaOpportunities.fromJson(e),
          )
          .toList();
    }
    notifyListeners();
  }

  Future<void> fetchGlobalCountry() async {
    if (globalCountries?.isNotEmpty ?? false) {
      return;
    }
    final res =
        await _globalRepo.fetchGlobal<UserDreamCountry>(AppKeyNames.countries);
    if (res.isSuccess) {
      globalCountries = res.data
          ?.map(
            (e) => UserDreamCountry.fromJson(e),
          )
          .toList();
    }
    notifyListeners();
  }

  Future<void> fetchGlobalCareer() async {
    if (globalCareers?.isNotEmpty ?? false) {
      return;
    }
    final res =
        await _globalRepo.fetchGlobal<UserDreamCareer>(AppKeyNames.careers);
    if (res.isSuccess) {
      globalCareers = res.data
          ?.map(
            (e) => UserDreamCareer.fromJson(e),
          )
          .toList();
    }
    notifyListeners();
  }

  Future<void> fetchGlobalCollege() async {
    if (globalColleges?.isNotEmpty ?? false) {
      return;
    }
    final res =
        await _globalRepo.fetchGlobal<UserDreamCollege>(AppKeyNames.colleges);
    if (res.isSuccess) {
      globalColleges = res.data
          ?.map(
            (e) => UserDreamCollege.fromJson(e),
          )
          .toList();
    }
    notifyListeners();
  }

  Future<void> fetchGlobalCities() async {
    if (globalCities?.isNotEmpty ?? false) {
      return;
    }
    final res = await _globalRepo.fetchGlobal<UserLocation>(AppKeyNames.cities);
    if (res.isSuccess) {
      globalCities = res.data
          ?.map(
            (e) => UserLocation.fromJson(e),
          )
          .toList();
    }
    notifyListeners();
  }

  Future<void> addGlobalCity(UserLocation location) async {
    final res = await _globalRepo.addToGlobal<UserLocation>(location);
    if (res.isSuccess) {
      globalCities?.add(location);
      notifyListeners();
    }
  }

  void clearFilterUsers() {
    filterProfiles = null;
  }

  Future<void> fetchUserByFilter(String key, String value) async {
    fetchFilterProfileStatus == InitEnum.initializing;
    final res = await _profileRepo.fetchUserByFilter(key, value);
    if (res.isSuccess) {
      fetchFilterProfileStatus = InitEnum.initialized;
      filterProfiles ??= [];
      filterProfiles?.addAll(res.data?.map(
            (e) => UserModel.fromJson(e.data() as Map<String, dynamic>),
          ) ??
          []);
    } else {
      fetchFilterProfileStatus = InitEnum.uninitialized;
    }
    notifyListeners();
  }

  Future<void> fetchUserByFilterDate(
      String key, DateTime? selectedDate1, DateTime? selectedDate2) async {
    fetchFilterProfileStatus == InitEnum.initializing;
    final res = await _profileRepo.fetchUserByFilterDate(
        key, selectedDate1, selectedDate2);
    if (res.isSuccess) {
      fetchFilterProfileStatus = InitEnum.initialized;
      filterProfiles ??= [];
      filterProfiles?.addAll(res.data?.map(
            (e) => UserModel.fromJson(e.data() as Map<String, dynamic>),
          ) ??
          []);
    } else {
      fetchFilterProfileStatus = InitEnum.uninitialized;
    }
    notifyListeners();
  }

  UserModel _addIdsToProfileIfNewChange(UserModel newModel) {
    Function deepEq = const DeepCollectionEquality.unordered().equals;
    if (deepEq(newModel.userInterests, currentUserProfile?.userInterests) ==
        false) {
      print("_add true 1");
      newModel = newModel.copyWith(userInterestsIds: {
        for (NovaInterests v in newModel.userInterests ?? [])
          v.id.toString(): true
      });
      print("_add true 2");
    }
    if (deepEq(newModel.userOpportunities,
            currentUserProfile?.userOpportunities) ==
        false) {
      newModel = newModel.copyWith(userOpportunitiesIds: {
        for (NovaOpportunities v in newModel.userOpportunities ?? [])
          v.id.toString(): true
      });
    }
    return newModel;
  }

  _sortModelListsAsPerDate(UserModel? userModel) {
    List<Education>? educations = userModel?.educations?.toList();
    List<Experience>? experiences = userModel?.experiences?.toList();
    List<Volunteer>? volunteered = userModel?.volunteered?.toList();
    List<Award>? awards = userModel?.awards?.toList();
    List<UserTestScores>? testScores = userModel?.testScores?.toList();
    List<AptitudeTest>? aptitudeTests = userModel?.aptitudeTests?.toList();

    educations?.sort(
      (a, b) {
        if (a.startDate == null) return -1;
        if (b.startDate == null) return 1;
        return b.startDate!.compareTo(a.startDate!);
      },
    );
    experiences?.sort(
      (a, b) {
        if (a.startDate == null) return -1;
        if (b.startDate == null) return 1;
        return b.startDate!.compareTo(a.startDate!);
      },
    );
    volunteered?.sort(
      (a, b) {
        if (a.startDate == null) return -1;
        if (b.startDate == null) return 1;
        return b.startDate!.compareTo(a.startDate!);
      },
    );
    awards?.sort(
      (a, b) {
        if (a.issueDate == null) return -1;
        if (b.issueDate == null) return 1;
        return b.issueDate!.compareTo(a.issueDate!);
      },
    );
    testScores?.sort(
      (a, b) {
        if (a.testDate == null) return -1;
        if (b.testDate == null) return 1;
        return b.testDate!.compareTo(a.testDate!);
      },
    );
    aptitudeTests?.sort(
      (a, b) {
        if (a.issueDate == null) return -1;
        if (b.issueDate == null) return 1;
        return b.issueDate!.compareTo(a.issueDate!);
      },
    );
    userModel = userModel?.copyWith(
      educations: educations,
      experiences: experiences,
      volunteered: volunteered,
      awards: awards,
      testScores: testScores,
      aptitudeTests: aptitudeTests,
    );
    return userModel;
  }

  // @override
  // ProfileNotifier fromJson(Map json) =>
  //     _$ProfileNotifierFromJson(json as Map<String, dynamic>);

  // @override
  // Map<String, dynamic> toJson(ProfileNotifier notifier) =>
  //     _$ProfileNotifierToJson(notifier);
}
