//
//  IntroductionViewModel.swift
//  SekretulkaApp
//
//  Created by Yurii Derzhylo on 28.10.2025.
//

import UIKit

final class IntroductionViewModel {
    
    var introductionSkipText: String { AppTexts.Launch.skipInfo }
    var introductionMoveNextText: String { AppTexts.Launch.moveNextStep }
    var introductionStartText: String { AppTexts.Launch.startAction }
    
    var introductionTitleOneText: String { AppTexts.Launch.introductionTitle1 }
    var introductionTitleTwoText: String { AppTexts.Launch.introductionTitle2 }
    var introductionTitleThreeText: String { AppTexts.Launch.introductionTitle3 }
    
    var introductionDescriptionOneText: String { AppTexts.Launch.introductionDescription1 }
    var introductionDescriptionTwoText: String { AppTexts.Launch.introductionDescription2 }
    var introductionDescriptionThreeText: String { AppTexts.Launch.introductionDescription3 }
    
    var introductionOneImage: UIImage { AppImages.Launch.introductionPreview1Image ?? UIImage() }
    var introductionTwoImage: UIImage { AppImages.Launch.introductionPreview2Image ?? UIImage() }
    var introductionThreeImage: UIImage { AppImages.Launch.introductionPreview3Image ?? UIImage() }
}
