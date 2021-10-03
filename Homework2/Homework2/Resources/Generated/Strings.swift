// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum Text {

  internal enum Chat {
    /// Type your message here...
    internal static let textFiledPlaceholder = Text.tr("Localizable", "Chat.textFiledPlaceholder")
  }

  internal enum Common {
    /// Messages
    internal static let messages = Text.tr("Localizable", "Common.messages")
  }

  internal enum Messages {
    /// PINNED
    internal static let pinned = Text.tr("Localizable", "Messages.pinned")
    /// Who do you want to chat with?
    internal static let searchBarPlaceholder = Text.tr("Localizable", "Messages.searchBarPlaceholder")
  }

  internal enum Profile {
    /// Logout
    internal static let logout = Text.tr("Localizable", "Profile.logout")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension Text {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
