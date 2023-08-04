import 'package:novasocial_admin/data/models/misc/interfaces/to_from_json_interface.dart';

abstract class DreamInterface extends ToFromJsonInterface {
  String? get id;
  String? get name;
  String? get iconUrl;
}
