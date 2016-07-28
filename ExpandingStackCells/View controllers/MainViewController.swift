//
//  MainViewController.swift
//  ExpandingStackCells
//
//  Created by József Vesza on 27/06/15.
//  Copyright © 2015 Jozsef Vesza. All rights reserved.
//

import UIKit

let expandingCellId = "expandingCell"
let estimatedHeight: CGFloat = 150
let topInset: CGFloat = 20

class MainViewController: UITableViewController {

    let viewModel = MainViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.contentInset.top = topInset
        tableView.estimatedRowHeight = estimatedHeight
        tableView.rowHeight = UITableViewAutomaticDimension
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count()
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("expandingCell", forIndexPath: indexPath) as! ExpandingCell

        cell.title = viewModel.titleForRow(indexPath.row)
        cell.detail = viewModel.detailForRow(indexPath.row)

        return cell
    }
    
    // MARK: Table view delegate
    
    override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        
        if let selectedIndex = tableView.indexPathForSelectedRow where selectedIndex == indexPath {
            let cell = tableView.cellForRowAtIndexPath(selectedIndex) as! ExpandingCell
            tableView.beginUpdates()
            tableView.deselectRowAtIndexPath(indexPath, animated: true)
            cell.changeCellStatus(false)
            tableView.endUpdates()
            
            return nil
        }
        
        return indexPath
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath) as! ExpandingCell
        cell.changeCellStatus(true)
        tableView.beginUpdates()
        tableView.endUpdates()
    }
}
