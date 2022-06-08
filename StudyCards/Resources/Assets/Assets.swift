// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "ColorAsset.Color", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetColorTypeAlias = ColorAsset.Color
@available(*, deprecated, renamed: "ImageAsset.Image", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetImageTypeAlias = ImageAsset.Image

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
internal enum Asset {
  internal static let accentColor = ColorAsset(name: "AccentColor")
  internal static let icCheck = ImageAsset(name: "ic_check")
  internal static let icEyeOff = ImageAsset(name: "ic_eye_off")
  internal static let icEyeOpen = ImageAsset(name: "ic_eye_open")
  internal static let icGuest = ImageAsset(name: "ic_guest")
  internal static let icMail = ImageAsset(name: "ic_mail")
  internal static let darkLight = ColorAsset(name: "darkLight")
  internal static let mainLightGray = ColorAsset(name: "mainLightGray")
  internal static let primaryBlue = ColorAsset(name: "primaryBlue")
  internal static let icWordChecked = ImageAsset(name: "ic_word_checked")
  internal static let icWordUnchecked = ImageAsset(name: "ic_word_unchecked")
  internal static let eng = ImageAsset(name: "eng")
  internal static let kaz = ImageAsset(name: "kaz")
  internal static let rus = ImageAsset(name: "rus")
  internal static let tur = ImageAsset(name: "tur")
  internal static let icFolder = ImageAsset(name: "ic_folder")
  internal static let icLink = ImageAsset(name: "ic_link")
  internal static let icTranslate = ImageAsset(name: "ic_translate")
  internal static let icVoicePlay = ImageAsset(name: "ic_voice_play")
  internal static let icChevronDown = ImageAsset(name: "ic_chevron_down")
  internal static let icCirclePlay = ImageAsset(name: "ic_circle_play")
  internal static let icSwap = ImageAsset(name: "ic_swap")
  internal static let icLangChecked = ImageAsset(name: "ic_lang_checked")
  internal static let icLangUnchecked = ImageAsset(name: "ic_lang_unchecked")
  internal static let icLearnPlay = ImageAsset(name: "ic_learn_play")
  internal static let icOneRepeat = ImageAsset(name: "ic_one_repeat")
  internal static let icRepeat = ImageAsset(name: "ic_repeat")
  internal static let icReviewWords = ImageAsset(name: "ic_review_words")
  internal static let icCheckSquare = ImageAsset(name: "ic_check_square")
  internal static let icChevronRight = ImageAsset(name: "ic_chevron_right")
  internal static let user = ImageAsset(name: "user")
  internal static let icCardsDeselected = ImageAsset(name: "ic_cards_deselected")
  internal static let icCardsSelected = ImageAsset(name: "ic_cards_selected")
  internal static let icExploreDeselected = ImageAsset(name: "ic_explore_deselected")
  internal static let icExploreSelected = ImageAsset(name: "ic_explore_selected")
  internal static let icHomeDeselected = ImageAsset(name: "ic_home_deselected")
  internal static let icHomeSelected = ImageAsset(name: "ic_home_selected")
  internal static let icProfileDeselected = ImageAsset(name: "ic_profile_deselected")
  internal static let icProfileSelected = ImageAsset(name: "ic_profile_selected")
  internal static let folderFab = ImageAsset(name: "folder_fab")
  internal static let wordFab = ImageAsset(name: "word_fab")
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

internal final class ColorAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Color = NSColor
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Color = UIColor
  #endif

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  internal private(set) lazy var color: Color = {
    guard let color = Color(asset: self) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }()

  #if os(iOS) || os(tvOS)
  @available(iOS 11.0, tvOS 11.0, *)
  internal func color(compatibleWith traitCollection: UITraitCollection) -> Color {
    let bundle = BundleToken.bundle
    guard let color = Color(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }
  #endif

  fileprivate init(name: String) {
    self.name = name
  }
}

internal extension ColorAsset.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  convenience init?(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

internal struct ImageAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Image = UIImage
  #endif

  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, macOS 10.7, *)
  internal var image: Image {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let name = NSImage.Name(self.name)
    let image = (bundle == .main) ? NSImage(named: name) : bundle.image(forResource: name)
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }

  #if os(iOS) || os(tvOS)
  @available(iOS 8.0, tvOS 9.0, *)
  internal func image(compatibleWith traitCollection: UITraitCollection) -> Image {
    let bundle = BundleToken.bundle
    guard let result = Image(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }
  #endif
}

internal extension ImageAsset.Image {
  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, *)
  @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
  convenience init?(asset: ImageAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = BundleToken.bundle
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
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
