//
//  ViewController.swift
//  locative
//
//  Created by 大塚嶺 on 2019/05/30.
//  Copyright © 2019 大塚嶺. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    @IBOutlet weak var signInMailadress: UITextField!
    @IBOutlet weak var signInPassword: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signInMailadress.attributedPlaceholder = NSAttributedString(string: "メールアドレス",
                                                              attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]);
        signInPassword.attributedPlaceholder = NSAttributedString(string: "パスワード",
                                                            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]);
    }
    
    // 文字列保存用の変数
    var userMailadress = ""
    var userPassword = ""
    // ボタン押下時のアクション
    @IBAction func signin_account(_ sender: UIButton) {
        // TextFieldから文字を取得
        userMailadress = signInMailadress.text!
        userPassword = signInPassword.text!
        Auth.auth().signIn(withEmail: userMailadress, password: userPassword) { (user, error) in
            if error == nil {
                UserDefaults.standard.set(self.userMailadress, forKey: "userMailadress")
                UserDefaults.standard.set(self.userPassword, forKey: "userPassword")
                self.performSegue(withIdentifier: "loginsuccessfull", sender: nil)
            }else{
                self.errorLabel.text = "パスワードが間違っています。"
            }
        }
        // TextFieldの中身をクリア
        signInMailadress.text = ""
        signInPassword.text = ""
    }
    
    @IBAction func return_button () {
        self.dismiss(animated: false)
    }
    
}

