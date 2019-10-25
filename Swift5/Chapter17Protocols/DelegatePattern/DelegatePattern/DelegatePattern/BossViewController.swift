//
//  BossViewController.swift
//  DelegatePattern
//
//  Created by Arsalan Wahid Asghar on 8/2/18.
//  Copyright © 2018 asghar. All rights reserved.
//

import UIKit


//This is the boss screen that does all the good stuff and normally passes data
protocol Represhments: AnyObject {
    func orderCofee(name:String)
    func orderTea(name:String)
}


class BossViewController: UIViewController {
    
   
    //Protocol used as a type which contains two functions
    var delegate: Represhments?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func orderCoffee(_ sender: UIButton) {
        //here function is being called
        //means the class is calling this function
        delegate?.orderCofee(name: "coffee")
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func orderTea(_ sender: UIButton) {
        //works as an accociated type
        delegate?.orderTea(name: "tea")
        dismiss(animated: true, completion: nil)
    }
    

}
