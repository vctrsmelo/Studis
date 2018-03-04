//
//  AreaViewController.swift
//  Studis
//
//  Created by Victor Melo on 03/03/18.
//  Copyright © 2018 Victor S Melo. All rights reserved.
//

import UIKit

class AreaViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var areaNameTextField: UITextField!
    
    // MARK: -
    
    var viewModel: AreaViewViewModel!
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if viewModel == nil {
            self.viewModel = AreaViewViewModel()
        }
        
    }
    
    @IBAction func didTouchSaveButton(_ sender: UIBarButtonItem) {
        guard let areaName = areaNameTextField.text, !areaName.isEmpty else { return }
        viewModel.areaName = areaName
        _ = navigationController?.popViewController(animated: true)
    }
    
}
