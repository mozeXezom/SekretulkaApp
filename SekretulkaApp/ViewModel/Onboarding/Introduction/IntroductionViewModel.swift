//
//  IntroductionViewModel.swift
//  SekretulkaApp
//
//  Created by Yurii Derzhylo on 28.10.2025.
//

import UIKit

final class IntroductionViewModel {

    private(set) var introductionSteps: [IntroductionStepModel] = []
    private(set) var currentStepIndex = 0

    var prepareIntroductionStep: ((IntroductionStepModel, Int) -> Void)?
    var onFinish: (() -> Void)?

    init() {
        introductionSteps = [
            IntroductionStepModel(
                image: AppImages.Launch.introductionPreview1Image,
                title: AppTexts.Launch.introductionTitle1,
                description: AppTexts.Launch.introductionDescription1,
                buttonTitle: AppTexts.Launch.moveNextStep
            ),
            IntroductionStepModel(
                image: AppImages.Launch.introductionPreview2Image,
                title: AppTexts.Launch.introductionTitle2,
                description: AppTexts.Launch.introductionDescription2,
                buttonTitle: AppTexts.Launch.moveNextStep
            ),
            IntroductionStepModel(
                image: AppImages.Launch.introductionPreview3Image,
                title: AppTexts.Launch.introductionTitle3,
                description: AppTexts.Launch.introductionDescription3,
                buttonTitle: AppTexts.Launch.startAction
            )
        ]
    }

    func start() {
        prepareIntroductionStep?(introductionSteps[currentStepIndex], currentStepIndex)
    }

    func moveNext() {
        guard currentStepIndex < introductionSteps.count - 1 else {
            onFinish?()
            return
        }
        currentStepIndex += 1
        prepareIntroductionStep?(introductionSteps[currentStepIndex], currentStepIndex)
    }

    func prepareSkip() {
        onFinish?()
    }
}
