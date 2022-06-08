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
