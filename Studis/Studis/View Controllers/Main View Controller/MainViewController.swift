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
        viewModel.areas = [Area(name: "College"), Area(name: "iOS Dev")]
        
        areaPickerView.dataSource = self
        areaPickerView.delegate = self
        
        //when moves to background, save data
        NotificationCenter.default.addObserver(self, selector: #selector(appMovedToBackground), name: Notification.Name.UIApplicationWillResignActive, object: nil)
    }
    
    @objc func appMovedToBackground() {
        PersistenceManager.shared.storeData()
    }
    
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
    }
}

extension MainViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
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
