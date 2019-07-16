//
//  FriendViewController.swift
//  locative
//
//  Created by 大塚嶺 on 2019/07/09.
//  Copyright © 2019 大塚嶺. All rights reserved.
//

import UIKit

class FriendViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet var table: UITableView!
    var cellCount:Int = 101
    var friendCount:Int = 100
    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
        table.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellCount
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath : IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cellF = tableView.dequeueReusableCell(withIdentifier: "CellFirst")
            cellF?.textLabel?.text = "友達 " + String(friendCount) + "人"
            
            return cellF!
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
            cell?.textLabel?.text = "test"
            return cell!
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var randomheight:CGFloat!
        if indexPath.row == 0 {
            randomheight = 40.0
        }else{
            randomheight = 100.0
        }
        print(randomheight)
        return randomheight
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
