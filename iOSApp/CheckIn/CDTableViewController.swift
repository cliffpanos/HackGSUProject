//
//  CDTableViewController.swift
//  True Pass
//
//  Created by Cliff Panos on 6/20/17.
//  Copyright © 2017 Clifford Panos. All rights reserved.
//

import UIKit


enum CDTableViewLayoutType {
    case fixed(Int)
    case percentage(Double, Int) //Percentage of portrait and then minimum for landscape
    case calculated(() -> Int)
    
}

enum CDOrientationType {
    case portrait
    case landscape
}

class CDTableViewController: UITableViewController {

    var autoDetectControllerBars: Bool = true
    var tableViewHeightSpace: CGFloat {
        return CGFloat(orientation == .portrait ? UIScreen.main.bounds.size.height : UIScreen.main.bounds.size.width)
    }
    var orientation: CDOrientationType {
        return UIDevice.current.orientation.isPortrait || (UIDevice.current.orientation.isFlat && UIScreen.main.bounds.size.height > UIScreen.main.bounds.size.width) ? .portrait : .landscape
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let layout = self.tableView(self.tableView, heightLayoutForIndexPath: indexPath)
        
        //TODO this is in progress and must be modified so that percentage heights are calculated at the very end
        
        switch layout {
        case let .calculated(heightCalculator):
            return CGFloat(heightCalculator())
        
        case let .fixed(fixedHeight):
            return CGFloat(fixedHeight)
            
        case let .percentage(percentage, minimumHeight):
            let proportionalHeight = tableViewHeightSpace * CGFloat(percentage)
            let maximumHeight = max(minimumHeight, Int(proportionalHeight))
            return CGFloat(maximumHeight)
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, heightLayoutForIndexPath indexPath: IndexPath) -> CDTableViewLayoutType {
        
        let defaultHeight = Int(self.tableView.rowHeight)
        
        return CDTableViewLayoutType.fixed(defaultHeight)
    }
    
    
    
    
    
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    

}
