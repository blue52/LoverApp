//
//  SecViewController.swift
//  LoverApp
//
//  Created by sky on 2016/7/27.
//  Copyright © 2016年 sky. All rights reserved.
//

import UIKit

class SecViewController: UIViewController {
    var name:String!
    var sign:String!
    var newImage:UIImage?
    var updateData:String?
    //var girlImage = ["one": "lin.jpg", "two": "gal.jpg"]
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var signLabel: UILabel!
    
    @IBOutlet weak var imageforgirl: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nameLabel.text = name
        self.signLabel.text = sign
        self.imageforgirl.image = newImage
        //self.imageforgirl.image = UIImage(named: girlImage["one"]!) ditionary實作上有問題
        let notificationName = Notification.Name("GetUpdateNoti")
        NotificationCenter.default.addObserver(self, selector: #selector(SecViewController.getUpdateNoti(noti:)), name: notificationName, object: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        //self.nameLabel.text = updateData
//    }
    func getUpdateNoti(noti:Notification){
        let newname = noti.userInfo!["name"] as! String
        let signName = noti.userInfo!["sign"] as! String
        self.nameLabel.text = newname
        self.signLabel.text = signName
    }


}
