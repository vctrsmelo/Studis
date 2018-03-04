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
    
    // MARK: -
    
    var viewModel: TopicViewViewModel!
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if viewModel == nil {
            viewModel = TopicViewViewModel()
            viewModel.areas = [Area(name: "College"), Area(name: "iOS Dev")]
        }
        
        areaPickerView.dataSource = self
        areaPickerView.delegate = self
    }

    // MARK: -

    @IBAction func didTouchSaveButton(_ sender: UIBarButtonItem) {
        guard let topicName = topicNameTextField.text, !topicName.isEmpty else { return }
        viewModel.topicName = topicName
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension TopicViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return viewModel.areas?.count ?? 0
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        viewModel.areaSelected = viewModel.areas?[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return viewModel.areas?[row].name ?? "ERROR"
    }
    
}
