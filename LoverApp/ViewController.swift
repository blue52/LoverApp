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
    @IBOutlet weak var secgirlButton: UIButton!
    @IBOutlet weak var thirdgirlButton: UIButton!
    
        
    var girlA = lover(loverNumber:0, name: "林志玲", sign: "射手座", girlImage: "lin.jpg")
    var girlB = lover(loverNumber:1, name: "Gal Gadot", sign: "金牛座", girlImage: "gal.jpg")
    var girlC = lover(loverNumber:2, name: "lily collins", sign: "雙魚座", girlImage: "lily.jpg")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let NotiName = Notification.Name("update")
        NotificationCenter.default.addObserver(self, selector: #selector(upload(noti:)), name: NotiName, object: nil)

        nextPage.setTitle(girlA.name, for: [])
        secgirlButton.setTitle(girlB.name, for: [])
        thirdgirlButton.setTitle(girlC.name, for: [])
        //將button的名稱傳入自訂的愛人名字
        
    }
    
    func upload(noti:Notification){
        let NewloverNumber = noti.userInfo!["number"] as! Int
        let newName = noti.userInfo!["name"] as! String
        let newSign = noti.userInfo!["sign"] as! String
        //let NewImage = noti.userInfo!["showimage"] as! String
        
        if NewloverNumber == 0 {
            girlA.loverNumber = NewloverNumber
            girlA.name = newName
            girlA.sign = newSign
            //girlA.girlImage = NewImage
            nextPage.setTitle(girlA.name, for: [])//After edit updates button title.
        }else if NewloverNumber == 1{
            girlB.loverNumber = NewloverNumber
            girlB.name = newName
            girlB.sign = newSign
            //girlB.girlImage = NewImage
            secgirlButton.setTitle(girlB.name, for: [])
        }else{
            girlC.loverNumber = NewloverNumber
            girlC.name = newName
            girlC.sign = newSign
            //girlC.girlImage = NewImage
            thirdgirlButton.setTitle(girlC.name, for: [])
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //傳送至下一頁的資訊
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        let controller = segue.destination as! SecViewController
       if segue.identifier == "lineA"{
            controller.loverNumber = girlA.loverNumber
            controller.name = girlA.name
            controller.sign = girlA.sign
            controller.girlImage = girlA.girlImage
        
        }else if segue.identifier == "lineB"{
            controller.loverNumber = girlB.loverNumber
            controller.name = girlB.name
            controller.sign = girlB.sign
            controller.girlImage = girlB.girlImage
        }else{
            controller.loverNumber = girlC.loverNumber
            controller.name = girlC.name
            controller.sign = girlC.sign
            controller.girlImage = girlC.girlImage
        }
    }


}

