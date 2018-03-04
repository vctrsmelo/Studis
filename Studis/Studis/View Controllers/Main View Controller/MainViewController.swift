//
//  ViewController.swift
//  Studis
//
//  Created by Victor S Melo on 01/03/18.
//  Copyright © 2018 Victor S Melo. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var selectedTopicNameLabel: UILabel!
    @IBOutlet weak var areaPickerView: UIPickerView!
    @IBOutlet weak var getNextTopicButton: UIButton!
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: -

    @IBAction func getNextTopicButtonTouched(_ sender: UIButton) {
    }
}
