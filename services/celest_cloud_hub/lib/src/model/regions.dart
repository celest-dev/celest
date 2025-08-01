import 'package:celest_cloud/celest_cloud.dart' as pb show Region;

extension Regions on pb.Region {
  String get flyRegion => const {
    pb.Region.NORTH_AMERICA: 'ewr',
    pb.Region.ASIA_PACIFIC: 'sin',
    pb.Region.EUROPE: 'lhr',
  }[this]!;

  String get tursoGroup => const {
    pb.Region.NORTH_AMERICA: 'default',
    pb.Region.ASIA_PACIFIC: 'tenants-ap-south',
    pb.Region.EUROPE: 'tenants-eu-west',
  }[this]!;
}
