import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:novasocial_admin/data/constants/app_key_names.dart';
import 'package:novasocial_admin/data/models/misc/interfaces/global_doc_helper_interface.dart';
part 'nova_opportunities.freezed.dart';
part 'nova_opportunities.g.dart';

@freezed
class NovaOpportunities
    with _$NovaOpportunities
    implements GlobalDocHelperInterface {
  @Implements<GlobalDocHelperInterface>()
  const factory NovaOpportunities({
    String? id,
    String? name,
    String? description,
    String? iconUrl,
    @Default(AppKeyNames.interests) @JsonKey(ignore: true) String? docName,
  }) = _NovaOpportunities;

  factory NovaOpportunities.fromJson(Map<String, dynamic> json) =>
      _$NovaOpportunitiesFromJson(json);
}

// @CopyWith()
// @JsonSerializable()
// class NovaOpportunities implements ToFromJsonInterface, GlobalDocHelperInterface {
//   @override
//   String? id;
//   String? name;
//   String? description;
//   String? iconUrl;

//   @override
//   @JsonKey(ignore: true)
//   String? docName;

//   NovaOpportunities({
//     this.id,
//     this.name,
//     this.description,
//     this.iconUrl,
//     this.docName = AppKeyNames.opportunities,
//   });

//   factory NovaOpportunities.fromJson(Map<String, dynamic> json) =>
//       _$NovaOpportunitiesFromJson(json);

//   Map<String, dynamic> toJson() => _$NovaOpportunitiesToJson(this);
// }

final List<Map<String, String>> opportunitiesList = [
  {
    "name": "Volunteering",
    "description":
        "Paying it forward by giving up your time to help organizations in need",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671119779/icons8-volunteering-100_jc1dzf.png"
  },
  {
    "name": "Writing",
    "description": "Contributing articles or blogs on certain topics",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671119780/icons8-pen-100_rok92q.png"
  },
  {
    "name": "Speaking on podcasts",
    "description": "Speaking on podcast episodes on certain topics",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671115994/icons8-microphone-100_mjtlue.png"
  },
  {
    "name": "Speaking at Events",
    "description":
        "Speaking on topics you are passionate about at all kinds of events",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671113827/speaker_interest.png"
  },
  {
    "name": "Raising funding",
    "description": "Fundraising for your company",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671118315/icons8-rocket-96_usqnvz.png"
  },
  {
    "name": "Starting a podcast",
    "description": "Collaborate to start a podcast ",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671115994/icons8-microphone-100_mjtlue.png"
  },
  {
    "name": "Collaborating on Side Projects",
    "description": "Partnering with people to build side projects part time",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671118821/icons8-collaborating-in-circle-100_i5nt7l.png"
  },
  {
    "name": "Part time roles",
    "description": "Freelancing, consulting, or part time employment",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1670694156/Icons%20for%20Nova/O_-_part_time_roles_xkeouo.png"
  },
  {
    "name": "Open Source Contributions",
    "description": "Contributing to open source projects",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671113611/open-source-fill_sesfca.png"
  },
  {
    "name": "Mentoring",
    "description": "Mentoring people in similar fields to you",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671113904/mentor_interest.png"
  },
  {
    "name": "Meeting new people",
    "description":
        "Chatting and networking with new people. Feel free to reach out!",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671119834/icons8-communication-100_ybdpep.png"
  },
  {
    "name": "Live Streaming",
    "description": "Live streaming with people",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671119755/icons8-youtube-live-100_iskmnz.png"
  },
  {
    "name": "Internships",
    "description": "Joining companies or organizations as an intern",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671119477/icons8-resume-100_oirbzk.png"
  },
  {
    "name": "Hiring",
    "description": "Hiring for full time roles",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671119477/icons8-resume-100_oirbzk.png"
  },
  {
    "name": "Guest lecturing",
    "description":
        "Sharing your knowledge by guest lecturing at schools and universities",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671113827/speaker_interest.png"
  },
  {
    "name": "Giving portfolio feedback",
    "description": "Reviewing and giving feedback on someone's portfolio",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671119351/icons8-comments-100_zpto2t.png"
  },
  {
    "name": "Content Creation",
    "description": "Creating content for brands and companies",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1670694151/Icons%20for%20Nova/content_creator_interest_O_-_content_creation_gzcnu5.png"
  },
  {
    "name": "Co-founding a company",
    "description":
        "Building up a business from vision to reality with a co-founder",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671118315/icons8-rocket-96_usqnvz.png"
  },
  {
    "name": "Brainstorming",
    "description":
        "Joining video calls to brainstorm with like minded people on certain problems",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671118855/icons8-analyzing-skill-100_wkjpta.png"
  },
  {
    "name": "Beta testing new products",
    "description": "Checking out the newest consumer or business products",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1670694155/Icons%20for%20Nova/O_-_beta_testing_new_products_evbpgw.png"
  },
  {
    "name": "Co-founding a non-profit organisation",
    "description":
        "Building up an organisation from vision to reality with a co-founder",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671118315/icons8-rocket-96_usqnvz.png"
  },
  {
    "name": "Working on projects",
    "description": "Collaborating to start a project",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671118821/icons8-collaborating-in-circle-100_i5nt7l.png"
  },
  {
    "name": "Participating in competitions",
    "description":
        "Partnering with people to participate in various events and competitions",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671118821/icons8-collaborating-in-circle-100_i5nt7l.png"
  },
  {
    "name": "Research Roles",
    "description": "Working on research projects with people",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671118855/icons8-analyzing-skill-100_wkjpta.png"
  },
  {
    "name": "Co-founding a club",
    "description": "Building up a club with a co-founder",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671118315/icons8-rocket-96_usqnvz.png"
  }
];
