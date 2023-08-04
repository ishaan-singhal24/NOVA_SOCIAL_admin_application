import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:novasocial_admin/data/constants/app_key_names.dart';
import 'package:novasocial_admin/data/models/misc/interfaces/global_doc_helper_interface.dart';
part 'nova_interests.freezed.dart';
part 'nova_interests.g.dart';

@freezed
class NovaInterests with _$NovaInterests implements GlobalDocHelperInterface {
  @Implements<GlobalDocHelperInterface>()
  const factory NovaInterests({
    String? id,
    String? name,
    String? iconUrl,
    @Default(AppKeyNames.interests) @JsonKey(ignore: true) String? docName,
  }) = _NovaInterests;

  factory NovaInterests.fromJson(Map<String, dynamic> json) =>
      _$NovaInterestsFromJson(json);
}

// class NovaInterests implements ToFromJson {
//   @override
//   String? id;
//   String? name;
//   String? iconUrl;

//   @override
//   @JsonKey(ignore: true)
//   String? docName;

//   NovaInterests({
//     this.id,
//     this.name,
//     this.iconUrl,
//     this.docName = AppKeyNames.interests,
//   });

//   factory NovaInterests.fromJson(Map<String, dynamic> json) =>
//       _$NovaInterestsFromJson(json);

//   @override
//   Map<String, dynamic> toJson() => _$NovaInterestsToJson(this);
// }

final List<Map<String, String>> interestIconLists = [
  {
    "name": "Entrepreneur",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671112537/Entrepreneur_interest.png"
  },
  {
    "name": "Founder",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671118315/icons8-rocket-96_usqnvz.png"
  },
  {
    "name": "Guitarist",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671115588/icons8-rock-music-100_ydcqiw.png"
  },
  {
    "name": "Singer",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671115994/icons8-micro-100_pyqhmw.png"
  },
  {
    "name": "Music",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1670694155/Icons%20for%20Nova/music_interest_wcspu6.png"
  },
  {
    "name": "Dance",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671115994/icons8-dancing-100_iagehe.png"
  },
  {
    "name": "Blockchain",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671113486/Blockchain_interest.png"
  },
  {
    "name": "Open Source",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671113611/open-source-fill_sesfca.png"
  },
  {
    "name": "Cybersecurity",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671113721/cybersecurity_interest.png"
  },
  {
    "name": "UI/UX Design",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1670694160/Icons%20for%20Nova/UI_UX_design_interest_xvzbqw.png"
  },
  {
    "name": "Speaker",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671113827/speaker_interest.png"
  },
  {
    "name": "Investor",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1670694154/Icons%20for%20Nova/Investor_interest_vgwezb.png"
  },
  {
    "name": "Mentor",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671113904/mentor_interest.png"
  },
  {
    "name": "Volunteer",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671113973/volunteer_interest.png"
  },
  {
    "name": "Writer",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671114405/writer_interest.png"
  },
  {
    "name": "Intern",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671114809/internship_interest.png"
  },
  {
    "name": "Reader",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671115995/icons8-reading-100_b808az.png"
  },
  {
    "name": "Politics",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1670695768/Icons%20for%20Nova/activist_interest_O_-_Activism_cuskdl.png"
  },
  {
    "name": "Teacher",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671115994/icons8-training-100_mgjccz.png"
  },
  {
    "name": "Podcaster",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671115994/icons8-microphone-100_mjtlue.png"
  },
  {
    "name": "Gamer",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671115994/icons8-game-controller-100_h9mq4z.png"
  },
  {
    "name": "Influencer",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671116376/icons8-expand-influence-100_btycsa.png"
  },
  {
    "name": "Traveler",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671115698/earth-fill_tfno5u.png"
  },
  {
    "name": "Young Achiever",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671115751/trophy-fill_lt9ald.png"
  },
  {
    "name": "Content Creator",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1670694151/Icons%20for%20Nova/content_creator_interest_O_-_content_creation_gzcnu5.png"
  },
  {
    "name": "Actor",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671117751/icons8-drama-96_k7qhhv.png"
  },
  {
    "name": "Photography",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1670694156/Icons%20for%20Nova/photography_interest_cww9g2.png"
  },
  {
    "name": "Graphic Design",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1670694152/Icons%20for%20Nova/graphic_design_interest_tbcun7.png"
  },
  {
    "name": "Blogger",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671117751/icons8-blogger-96_aqdioy.png"
  },
  {
    "name": "Marketer",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671118035/icons8-marketing-96_sr4dxk.png"
  },
  {
    "name": "Artist",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1670694150/Icons%20for%20Nova/artist_interest_btvdb1.png"
  },
  {
    "name": "Finance",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1670694152/Icons%20for%20Nova/finance_interest_zpfuie.png"
  },
  {
    "name": "Mental Health",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671117751/icons8-creativity-100_fackhr.png"
  },
  {
    "name": "Climate Change",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671117751/icons8-climate-change-100_tl1rcp.png"
  },
  {
    "name": "Environmentalist",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671117752/icons8-environment-care-100_om7j7j.png"
  },
  {
    "name": "Human Resources",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1670694153/Icons%20for%20Nova/human-resources_interest_sabw0e.png"
  },
  {
    "name": "Non Profit Founder",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1670694154/Icons%20for%20Nova/non_profit_founder_interest_yriz4z.png"
  },
  {
    "name": "Figma Wizard",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671117752/icons8-figma-100_pfxgjd.png"
  },
  {
    "name": "Fashion Stylist",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1670694152/Icons%20for%20Nova/fashion_stylist_interest_yyvwfn.png"
  },
  {
    "name": "Journalist",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671117940/icons8-journalist-100_ldrwv1.png"
  },
  {
    "name": "Pet Owner",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671117751/icons8-dog-training-100_h2s0zs.png"
  },
  {
    "name": "YouTube",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1670694159/Icons%20for%20Nova/youtube_interest_fbblhj.png"
  },
  {
    "name": "Film Making",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671117753/icons8-cinema-90_zkhmsf.png"
  },
  {
    "name": "Inventor",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671117948/icons8-innovation-100_wd3w2y.png"
  },
  {
    "name": "Chess",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671117751/icons8-chess-96_mulber.png"
  },
  {
    "name": "Social service",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671115477/global-fill_phjhqc.png"
  },
  {
    "name": "Science",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671118184/icons8-test-tube-100_uqo3q1.png"
  },
  {
    "name": "Mathematics",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671118189/icons8-pi-100_eksp87.png"
  },
  {
    "name": "Psychology",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671118238/icons8-mental-health-100_1_fhgeap.png"
  },
  {
    "name": "Astronomy",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671118155/icons8-astronomy-100_uvwxdi.png"
  },
  {
    "name": "Sports",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671116064/icons8-exercise-100_koeazh.png"
  },
  {
    "name": "Researching",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671115590/microscope-fill_qyduui.png"
  },
  {
    "name": "Foreign language",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671118070/icons8-language-100_uiguh0.png"
  },
  {
    "name": "Biology",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671118016/icons8-biology-book-100_vddzeb.png"
  },
  {
    "name": "Culinary arts and Bakery",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671117964/icons8-chef-hat-100_1_hxtcae.png"
  },
  {
    "name": "Business and Economics",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671115373/bar-chart-box-fill_aaqwzm.png"
  },
  {
    "name": "Drama",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671117916/icons8-theatre-mask-100_aszvgf.png"
  },
  {
    "name": "Computer Science",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671115251/computer-fill_mzi8t0.png"
  },
  {
    "name": "STEM",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1670694159/Icons%20for%20Nova/STEM_interest_lmkme4.png"
  },
  {
    "name": "Pop culture",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671117756/icons8-us-music-100_ukluum.png"
  }
];
