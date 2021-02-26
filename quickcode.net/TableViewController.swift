//
//  TableViewController.swift
//  quickcode.net
//
//  Created by Uzeyir APAYDIN on 26.02.2021.
//

import UIKit
import Utils
import NVActivityIndicatorView
import SCLAlertView
import QuickCodeNetClient

class TableViewController: UITableViewController , NVActivityIndicatorViewable{

    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    override func viewDidLoad() {
        super.viewDidLoad()
        let size = CGSize(width: 60, height: 60)
        startAnimating(size, message: "Please wait...", type: NVActivityIndicatorType.ballClipRotatePulse, fadeInAnimation: nil)
        inputTableView.isUserInteractionEnabled=true
        RegisterTableViewCells()
        //SwaggerClientAPI.basePath

    }
    

    var tableViewDataSource : [Gtables]? = nil

    @IBOutlet weak var inputTableView: UITableView!

    func RegisterTableViewCells(){

        FormGeneratorAPI.formGeneratorGetTables { [self] (response, error) in
            tableViewDataSource = response!
                self.inputTableView.reloadData()
                self.stopAnimating()
        }

    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewDataSource?.count ?? 0
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        print("Row: \(indexPath.row)")

        let v  = self.storyboard?.instantiateViewController(withIdentifier: "form_generator") as! FormViewController
        v.tableName = tableViewDataSource![indexPath.row].tableName
        self.navigationController?.pushViewController(v, animated: true)
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt
        indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableNameCell", for: indexPath)

        cell.textLabel?.text = self.tableViewDataSource![indexPath.row].tableName
              
          return cell
    }

    
}
