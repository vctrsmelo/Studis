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
    
    // MARK: -
    
    var viewModel: MainViewViewModel!
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = MainViewViewModel()
        
        areaPickerView.dataSource = self
        areaPickerView.delegate = self
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.sync()
        areaPickerView.reloadComponent(0)
    }
    
    // MARK: -

    private func addArea() {
        performSegue(withIdentifier: "addArea", sender: nil)
    }
    
    private func addTopic() {
        performSegue(withIdentifier: "addTopic", sender: nil)
    }
    
    // MARK: -
    
    @IBAction func didTouchAddButton(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add New", message: "Select what you want to add", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Area", style: .default, handler: { (_) in
            self.addArea()
        }))
        alert.addAction(UIAlertAction(title: "Topic", style: .default, handler: { (_) in
            self.addTopic()
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (_) in }))
        
        present(alert, animated: true)
    }
    
    @IBAction func didTouchGetNextTopicButton(_ sender: UIButton) {
        guard let nextTopicName = viewModel.getNextTopicName() else { return }
        selectedTopicNameLabel.text = nextTopicName
    }
}

extension MainViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
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
