//
//  ProfileViewModel.swift
//  StudyCards
//
//  Created by Bakdaulet Berdikul on 06.06.2022.
//

import Foundation


class ProfileViewModel {
    
    var profileFields = [CellConfigurator]()
    
    func fetchAllDatas() {
        profileFields.append(ProfileImageCellConfigurator(
            item: User(userImage: "user", userName: "Bakdaulet", userSurname: "Berdikul", userEmail: "bbbakdaulet@mail.ru"))
        )
        
        profileFields.append(ProfileTableCellConfigurator(
            item: ProfileTVBtn(type: .buyWords, icon: nil))
        )
        
        profileFields.append(ProfileTableCellConfigurator(
            item: ProfileTVBtn(type: .resetPassword, icon: nil))
        )
        
        profileFields.append(ProfileTableCellConfigurator(
            item: ProfileTVBtn(type: .appLanguage, icon: nil))
        )
        
        profileFields.append(ProfileTableCellConfigurator(
            item: ProfileTVBtn(type: .signOut, icon: Asset.icChevronRight.image))
        )
        
    }
    
}
