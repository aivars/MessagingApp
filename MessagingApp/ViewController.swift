//
//  ViewController.swift
//  MessagingApp
//
//  Created by Aivars Meijers on 12.05.17.
//  Copyright © 2017. g. Aivars Meijers. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    var postData = [String]()
    var ref: FIRDatabaseReference?
    var databaseHandle: FIRDatabaseHandle?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        ref = FIRDatabase.database().reference()
        
        //Fetch records from firebase DB
        databaseHandle = ref?.child("Posts").observe(.childAdded, with: { (snapshot) in
            // Code to execute when shild is added under "Post"
            // Take the value from the snapshot and post in  to the posts array
            let post = snapshot.value as? String
            
            if let actualPost = post{
            self.postData.append(actualPost)
                
            self.tableView.reloadData()
            }
            
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = postData[indexPath.row]
        
        return cell!
    }


}

