//
//  EditViewController.swift
//  LoverApp
//
//  Created by sky on 2016/7/27.
//  Copyright © 2016年 sky. All rights reserved.
//

import UIKit

class EditViewController: UIViewController, UITextFieldDelegate {
    var saveData:String!

    @IBAction func DoneButton(_ sender: AnyObject) {
        let notificationName = Notification.Name("GetUpdateNoti")
        NotificationCenter.default.post(name: notificationName, object: nil, userInfo: ["name": self.nameEditLabel.text!, "sign": self.signLabel.text!])
        
        self.dismiss(animated: true, completion: nil)
        
        //傳送通知的語法
        //self.present(controller, animated: true, completion: nil)
        
    }
    
    
    @IBOutlet weak var nameEditLabel: UITextField!
    @IBOutlet weak var signLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameEditLabel.returnKeyType = .next
        self.nameEditLabel.text = saveData
        self.signLabel.text = saveData //將所編輯的資料存在變數saveData裡
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameEditLabel {
            signLabel.becomeFirstResponder()
            return false
        }else{
            signLabel.resignFirstResponder()
            return true
        }
    }

    
}
