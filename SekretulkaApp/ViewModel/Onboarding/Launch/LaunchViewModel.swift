//
//  LaunchViewModel.swift
//  SekretulkaApp
//
//  Created by Yurii Derzhylo on 28.10.2025.
//

import UIKit

final class LaunchViewModel {
    
    var prepareIntroduction: (() -> Void)?
    
    private let model: LaunchModel
    
    init(model: LaunchModel) {
        self.model = model
    }
    
    var launchTitleText: String { model.title }
    var launchLogoImage: UIImage? { model.logo }
    
    func nextPressed() {
        prepareIntroduction?()
    }
}
