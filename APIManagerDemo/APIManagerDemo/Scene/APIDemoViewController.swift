//
//  APIDemoViewController.swift
//  APIManagerDemo
//
//  Created by Pavle Pesic on 4/11/19.
//  Copyright (c) 2019 Pavle Pesic. All rights reserved.
//

import UIKit

protocol APIDemoViewControllerProtocol: class {
    
}

class APIDemoViewController: UIViewController, APIDemoViewControllerProtocol {
    
    // MARK: - Vars & Lets
    
    var viewModel: APIDemoViewModelProtocol?
    
    // MARK: - Outlets
    
    @IBOutlet weak var helloUserLabel: UILabel!
    
    // MARK: - Controller lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = APIDemoViewModel()
        self.bindUI()
        self.viewModel!.getUser()
    }
    
    // MARK: - Private methods
    
    private func bindUI() {
        self.viewModel?.isLoaderHidden.bind({ [weak self] in
            self?.shouldHideLoader(isHidden: $0)
        })
        self.viewModel?.alertMessage.bind({ [weak self] in
            self?.showAlertWith(message: $0)
        })
        self.viewModel?.user.bind({ [weak self] in
            if let user = $0 {
                self?.helloUserLabel.text = "Hello \(user.fullName)!"
            }
        })
    }
    
    // MARK: - Actions
    
    @IBAction private func failTest() {
        self.viewModel!.failTest()
    }
    
}
