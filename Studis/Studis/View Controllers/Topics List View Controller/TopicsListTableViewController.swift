//
//  TopicsListTableViewController.swift
//  Studis
//
//  Created by Victor Melo on 03/03/18.
//  Copyright © 2018 Victor S Melo. All rights reserved.
//

import UIKit

class TopicsListTableViewController: UITableViewController {

    var viewModel: TopicsListViewViewModel!
    
    @IBOutlet weak var topicsOrAreasSegmentedControl: UISegmentedControl!
    
    var isShowingTopics = true
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = self.editButtonItem

        viewModel = TopicsListViewViewModel()
    }

    override func viewWillAppear(_ animated: Bool) {
        viewModel.sync()
    }
    
    // MARK: - Segmented Control
    
    @IBAction func didChangeSegmentedControl(_ sender: UISegmentedControl) {
        isShowingTopics = (sender.selectedSegmentIndex == 0)
        self.tableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        let returnValue = (isShowingTopics) ? viewModel.numberOfAreas() : 1
        return returnValue
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let returnValue = (isShowingTopics) ? viewModel.numberOfTopics(section: section) : viewModel.numberOfAreas()
        return returnValue
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "topicCell", for: indexPath)

        if isShowingTopics {
            cell.textLabel?.text = viewModel.getTopicName(section: indexPath.section, row: indexPath.row)
        } else {
            cell.textLabel?.text = viewModel.getAreaName(at: indexPath.row)
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if isShowingTopics {
            return viewModel.getAreaName(at: section)
        }
        
        return nil
    }

    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            
            if isShowingTopics {
                viewModel.deleteTopic(section: indexPath.section, row: indexPath.row)
            } else {
                viewModel.deleteArea(at: indexPath.row)
            }
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
}
