import 'package:novasocial_admin/data/models/misc/interfaces/to_from_json_interface.dart';

abstract class GlobalDocHelperInterface extends ToFromJsonInterface {
  String? get id;

  String? get docName;
}
