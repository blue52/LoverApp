//
//  EditViewController.swift
//  LoverApp
//
//  Created by sky on 2016/7/27.
//  Copyright © 2016年 sky. All rights reserved.
//

import UIKit


class EditViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    
    //var saveData:String!
    //var delegate:EditViewControllerDelegate? = nil
    
    var name:String!
    var sign:String!
    var loverNumber:Int!
    var girlImage:String!
    
    @IBOutlet weak var nameEditLabel: UITextField!
    @IBOutlet weak var signLabel: UITextField!
    @IBOutlet weak var changeImage: UIImageView!
    
    /*@IBAction func ImageButton(_ sender: AnyObject) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        self.present(imagePicker, animated: true, completion: nil)
    }*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameEditLabel.returnKeyType = .next
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(EditViewController.upload(_:)))

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /*func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        print("info \(info)")
        let image = info[UIImagePickerControllerOriginalImage]
        self.changeImage.image = image as? UIImage
        self.dismiss(animated:true, completion: nil)//回傳所選的照片到上一頁
        
        super.viewDidLoad()
        let size = CGSize(width: 640, height:
            (image?.size.height)! * 640 / (image?.size.height)!)
        UIGraphicsBeginImageContextWithOptions(size,false, 0)
        changeImage.draw(CGRect(origin: CGPoint.zero,size: size))
        //let resizeImage = UIGraphicsGetImageFromCurrentImageContext()
        //UIGraphicsEndImageContext()
        
    }*/

    
    func upload(_ sender:AnyObject){
        
        let NotiName = Notification.Name("update")
        NotificationCenter.default.post(name: NotiName, object: nil, userInfo: ["number": loverNumber, "name": nameEditLabel.text!, "sign": signLabel.text!])
        _ = self.navigationController?.popViewController(animated: true)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let Newname = name{
            nameEditLabel.text = Newname
            self.title = Newname
        }
        if let Newsign = sign{
            signLabel.text = Newsign
        }
        /*if let NewImage = girlImage{
        self.changeImage.image = UIImage(named: NewImage)
        }*/
    } //將文字框的值顯示出來的功能
    
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
