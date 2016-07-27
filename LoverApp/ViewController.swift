//
//  ViewController.swift
//  LoverApp
//
//  Created by sky on 2016/7/26.
//  Copyright © 2016年 sky. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nextPage: UIButton!
    @IBAction func goNextPage(_ sender: AnyObject) {

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        let controller = segue.destinationViewController as! SecViewController
        if segue.identifier == "girlA"{
            controller.name = "Chi ling"
            controller.sign = "Sagittarius"
            controller.newImage = UIImage(named: "lin.jpg")
        }else if segue.identifier == "girlB"{
            controller.name = "Gal Gadot"
            controller.sign = "Taurus"
            controller.newImage = UIImage(named: "gal.jpg")
        }else{
            controller.name = "Lily Collins"
            controller.sign = "Aries"
            controller.newImage = UIImage(named: "lily.jpg")
        }
    }


    
}

