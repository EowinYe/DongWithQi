//
//  PlanTableView.swift
//  DongWithQi
//
//  Created by 叶东强子 on 2017/10/25.
//  Copyright © 2017年 叶东强子. All rights reserved.
//

import UIKit

class PlanTableView: UITableViewController {

    var PlanArr : [PlanItem] = [PlanItem(title:"Happy Birthday Qi", data:"10/27/2017", id:1),
                                PlanItem(title:"Dong love Qi", data:"10/27/2017", id:2),
                                PlanItem(title:"", data:"", id:0)]
    
    @IBOutlet weak var newBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        let data = defaults.object(forKey: "totalNum") as? Int
        if data == nil{
            defaults.set(PlanArr.count, forKey: "totalNum")
            defaults.synchronize()
        }else{
            for i in PlanArr.count-1 ... data!-1{
                if i==data!-1{
                    break;
                }
                let title = defaults.object(forKey: "\(i)"+"title") as? String
                let date = defaults.object(forKey: "\(i)"+"data") as? String
                let id = defaults.object(forKey: "\(i)"+"id") as? Int
                let newPlanIt = PlanItem(title:title!, data:date!, id:id!)
                PlanArr.insert(newPlanIt, at: i)
            }
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return PlanArr.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlanCell", for: indexPath)
            as UITableViewCell
        
        let PlanI = PlanArr[indexPath.row] as PlanItem
        cell.textLabel?.text = PlanI.title_
        cell.detailTextLabel?.text = PlanI.data_

        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == PlanArr.count-1{
            let alert = UIAlertView()
            alert.title = "QAQ"
            alert.message = "别点出bug呀"
            alert.addButton(withTitle: "知道啦")
            alert.show()
            return
        }
        let sb = UIStoryboard(name:"Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "NoteViewController") as! NoteViewController
        vc.planIt = PlanArr[indexPath.row]
        vc.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func newPlan(_ sender: UIButton) {
        self.setEditing(true, animated: true)
        /*let date = NSDate()
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "dd/MM/yyy"
        let strNowTime = timeFormatter.string(from: date as Date) as String
        let newPlanIt = PlanItem(title:"", data:strNowTime, id:self.cnt)
        PlanArr.append(newPlanIt)
        print(PlanArr.count)
        self.cnt += 1
        let sb = UIStoryboard(name:"Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "NoteViewController") as! NoteViewController
        vc.planIt = newPlanIt
        vc.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal
        self.present(vc, animated: true, completion: nil)*/
    }
    
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle.insert
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
            let date = NSDate()
            let timeFormatter = DateFormatter()
            timeFormatter.dateFormat = "MM/dd/yyyy"
            let strNowTime = timeFormatter.string(from: date as Date) as String
            let rowNum = indexPath.row
            let newPlanIt = PlanItem(title:"", data:strNowTime, id:rowNum)
            let defaults = UserDefaults.standard
            defaults.set("", forKey: "\(rowNum)"+"title")
            defaults.set(strNowTime, forKey: "\(rowNum)"+"data")
            defaults.set(rowNum, forKey: "\(rowNum)"+"id")
            
            PlanArr.insert(newPlanIt, at: rowNum)
            let indexPaths = [indexPath]
            self.tableView.insertRows(at: indexPaths, with: UITableViewRowAnimation.right)
            defaults.set(PlanArr.count, forKey: "totalNum")
            defaults.synchronize()
            self.setEditing(false, animated: false)
            let sb = UIStoryboard(name:"Main", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "NoteViewController") as! NoteViewController
            vc.planIt = newPlanIt
            vc.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal
            self.present(vc, animated: true, completion: nil)
        }    
    }
    

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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        print(tableView.indexPathForSelectedRow)
    }
    

}
