import 'package:_common/src/utils/map_deserialization_extension.dart';

enum ScreenChoice {
  signup,
  configuration,
  portfolioAndCashBalance;
}

class Ui {
  const Ui({
    required this.isDarkMode,
    this.screenChoice = ScreenChoice.portfolioAndCashBalance,
  });
  final bool isDarkMode;
  final ScreenChoice screenChoice;

  static const DEFAULT = Ui(isDarkMode: false);

  Ui toggleLightAndDarkMode() => copy(isDarkMode: !isDarkMode);

  Ui copy({
    bool? isDarkMode,
    ScreenChoice? screenChoice,
  }) =>
      Ui(
        isDarkMode: isDarkMode ?? this.isDarkMode,
        screenChoice: screenChoice ?? this.screenChoice,
      );

  @override
  String toString() =>
      'Ui{isDarkMode: $isDarkMode, screenChoice: $screenChoice}';

  /// Don't include [screenChoice].
  Json toJson() => {
        'isDarkMode': isDarkMode,
      };

  /// Don't include [screenChoice].
  static Ui fromJson(Json? json) {
    if (json == null) {
      return Ui.DEFAULT;
    } else {
      final isDarkMode = json.asBool('isDarkMode') ?? false;
      return Ui(isDarkMode: isDarkMode);
    }
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Ui &&
          runtimeType == other.runtimeType &&
          isDarkMode == other.isDarkMode &&
          screenChoice == other.screenChoice;

  @override
  int get hashCode => isDarkMode.hashCode ^ screenChoice.hashCode;
}
