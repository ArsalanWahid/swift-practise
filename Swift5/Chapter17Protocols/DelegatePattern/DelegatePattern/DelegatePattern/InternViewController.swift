//
//  InternViewController.swift
//  DelegatePattern
//
//  Created by Arsalan Wahid Asghar on 8/3/18.
//  Copyright © 2018 asghar. All rights reserved.
//

import UIKit

class InternViewController: UIViewController {

    enum ViewControllers:String{
        case bossViewController
    }
    // MARK:- Outlets
    
    @IBOutlet weak var taskLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    
    @IBAction func askForTask(_ sender: UIButton) {
        //This is how to goto a viewcontroller by code ,without any links
        //Called VC needs a storyboard ID
        let selectionVC = storyboard?.instantiateViewController(withIdentifier: ViewControllers.bossViewController.rawValue) as! BossViewController
       
        //This is because self also conforms to the same type hence is of type
        //Represehment as well
        selectionVC.delegate = self
        
        present(selectionVC, animated: true, completion: nil)
    }
}


extension InternViewController: Represhments{
    
    //These are the responsibilties ?
    func orderCofee(name: String) {
        taskLabel.text = name
        print("I'm Bringing the coffee")
    }
    
    func orderTea(name: String) {
        taskLabel.text = name
    }
    
    
}


