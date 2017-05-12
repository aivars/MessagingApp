//
//  InputViewController.swift
//  MessagingApp
//
//  Created by Aivars Meijers on 12.05.17.
//  Copyright © 2017. g. Aivars Meijers. All rights reserved.
//

import UIKit
import FirebaseDatabase

class InputViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    var ref : FIRDatabaseReference?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        ref = FIRDatabase.database().reference()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func onAddButton(_ sender: UIBarButtonItem) {
        
        // Firebase
        ref?.child("Posts").childByAutoId().setValue(textView.text)
        
        
        //Dismiss compose popup
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onTrashButton(_ sender: UIBarButtonItem) {
        
        // Firebase
        
        
        //Dismiss compose popup
        presentingViewController?.dismiss(animated: true, completion: nil)
        
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
