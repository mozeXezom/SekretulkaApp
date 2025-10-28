//
//  LaunchViewModel.swift
//  SekretulkaApp
//
//  Created by Yurii Derzhylo on 28.10.2025.
//

final class LaunchViewModel {
    var prepareIntroduction: (() -> Void)?

    func nextPressed() {
        prepareIntroduction?()
    }
}
