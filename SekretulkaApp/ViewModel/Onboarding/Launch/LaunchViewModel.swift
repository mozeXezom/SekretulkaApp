//
//  LaunchViewModel.swift
//  SekretulkaApp
//
//  Created by Yurii Derzhylo on 28.10.2025.
//

import UIKit

final class LaunchViewModel {
    var prepareIntroduction: (() -> Void)?
    
    var launchTitleText: String { AppTexts.Launch.appNameTitle }
    var launchLogoImage: UIImage { AppImages.Launch.appLogoImage ?? UIImage() }

    func nextPressed() {
        prepareIntroduction?()
    }
}
