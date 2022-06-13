//
//  Enums.swift
//  StudyCards
//
//  Created by Bakdaulet Berdikul on 06.06.2022.
//

import UIKit

enum ProfileTVBtnType {
    case buyWords
    case resetPassword
    case appLanguage
    case signOut
    
    var titleValue: String {
        switch self {
        case .buyWords: return L10n.buyWords
        case .resetPassword: return L10n.resetPassword
        case .appLanguage: return L10n.applicationLanguage
        case .signOut: return L10n.signOut
        }
    }
}

struct ProfileTVBtn {
    var type : ProfileTVBtnType
    var icon : UIImage?
}

enum TabBarPage {
    case home
    case cards
    case explore
    case profile

    init?(index: Int) {
        switch index {
        case 0:
            self = .home
        case 1:
            self = .cards
        case 2:
            self = .explore
        case 3:
            self = .profile
        default:
            return nil
        }
    }
    
    func pageIconValue() -> UIImage {
        switch self {
        case .home:
            return Asset.icHomeDeselected.image
        case .cards:
            return Asset.icCardsDeselected.image
        case .explore:
            return Asset.icExploreDeselected.image
        case .profile:
            return Asset.icProfileDeselected.image
        }
    }

    func pageOrderNumber() -> Int {
        switch self {
        case .home:
            return 0
        case .cards:
            return 1
        case .explore:
            return 2
        case .profile:
            return 3
        }
    }

    // Add tab icon value
    
    // Add tab icon selected / deselected color
    
    // etc
}
