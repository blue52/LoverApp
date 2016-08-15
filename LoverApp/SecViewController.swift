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
    var girlImage:String!
    var loverNumber:Int!
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var signLabel: UILabel!
    @IBOutlet weak var imageforgirl: UIImageView!
    
    @IBAction func pressedEditButton(_ sender: AnyObject) {
        
    }

    func upload(noti:Notification){
        let newname = noti.userInfo!["name"] as! String
        let newsign = noti.userInfo!["sign"] as! String
        
        self.name = newname //這二個name、sign屬性要建立，否則無法更新資料
        self.sign = newsign
        self.nameLabel.text = newname
        self.signLabel.text = newsign
        //self.imageforgirl.image = UIImage(named: NewImage)
    }
    
        override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let newname = name{
            
            nameLabel.text = newname
            //self.title = newname
        }
        if let newsign = sign{
            signLabel.text = newsign
        }
        if let newImage = girlImage{
            imageforgirl.image = UIImage(named: newImage)//少了這行，圖片不會出現。
        }
        let NotiName = Notification.Name("update")
        NotificationCenter.default.addObserver(self, selector: #selector(upload(noti:)), name: NotiName, object: nil)
    }
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
        let controller = segue.destination as! EditViewController
        controller.name = name
        controller.sign = sign
        controller.loverNumber = loverNumber
        //controller.girlImage = girlImage
        
    }//將值傳回下一頁文字框的連結
    

}
