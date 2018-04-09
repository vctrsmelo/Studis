//
//  TopicViewController.swift
//  Studis
//
//  Created by Victor Melo on 03/03/18.
//  Copyright © 2018 Victor S Melo. All rights reserved.
//

import UIKit

class TopicViewController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var topicNameTextField: UITextField!
    @IBOutlet weak var areaPickerView: UIPickerView!
    @IBOutlet weak var addSessionButton: UIButton!
    
    // MARK: -
    
    var viewModel: TopicViewViewModel!
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if viewModel == nil {
            viewModel = TopicViewViewModel()
            addSessionButton.isHidden = true
        }
        
        topicNameTextField.text = viewModel.topicName
        
        areaPickerView.dataSource = self
        areaPickerView.delegate = self
    }

    // MARK: -

    @IBAction func didTouchSaveButton(_ sender: UIBarButtonItem) {
        guard let topicName = topicNameTextField.text, !topicName.isEmpty else { return }
        viewModel.topicName = topicName
        viewModel.saveTopic()
        _ = navigationController?.popViewController(animated: true)
    }

    @IBAction func didTouchAddReviewSession(_ sender: UIButton) {
        viewModel.addTopicReview()
    }
    
}

extension TopicViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return viewModel.areasName.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        viewModel.selectedAreaIndex = row
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return viewModel.areasName[row]
    }
}
