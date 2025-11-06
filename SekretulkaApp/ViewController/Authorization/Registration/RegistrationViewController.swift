//
//  RegistrationViewController.swift
//  SekretulkaApp
//
//  Created by Yurii Derzhylo on 06.11.2025.
//

import UIKit

final class RegistrationViewController: BaseViewController {
    
    private let viewModel: RegistrationViewModel
    
    private var stepIndex: Int = 0
    
    init(viewModel: RegistrationViewModel) {
        self.viewModel = viewModel
        super.init(nibName: type(of: self).nibName, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
