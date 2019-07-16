//
//  ViewController.swift
//  locative
//
//  Created by 大塚嶺 on 2019/05/30.
//  Copyright © 2019 大塚嶺. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    @IBOutlet weak var mailadress: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirm_password: UITextField!
   @IBOutlet weak var errorLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
      mailadress.attributedPlaceholder = NSAttributedString(string: "メールアドレス",
                                                            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]);
      password.attributedPlaceholder = NSAttributedString(string: "パスワード",
                                                            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]);
      confirm_password.attributedPlaceholder = NSAttributedString(string: "パスワードを再入力",
                                                            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]);
    }
    
    // 文字列保存用の変数
    var userMailadress = ""
    var userPassword = ""
    // ボタン押下時のアクション
    @IBAction func create_account(_ sender: UIButton) {
        // TextFieldから文字を取得
        userMailadress = mailadress.text!
        userPassword = password.text!
      if userPassword == confirm_password.text! {
         Auth.auth().createUser(withEmail: userMailadress, password: userPassword) { (authResult, error) in
            
            guard let user = authResult?.user else { return }
            print("##")
            print(error)
            print("##")
            if error == nil {
               UserDefaults.standard.set(self.userMailadress, forKey: "userMailadress")
               UserDefaults.standard.set(self.userPassword, forKey: "userPassword")
               self.performSegue(withIdentifier: "loginsuccessfull2", sender: nil)
            }else{
               if let errCode = AuthErrorCode(rawValue: error!._code) {
                  switch errCode {
                  case .invalidEmail:
                     self.errorLabel.text = "メールアドレスの形式が違います。"
                  case .emailAlreadyInUse:
                     self.errorLabel.text = "このメールアドレスはすでに使われています。"
                  case .weakPassword:
                     self.errorLabel.text = "パスワードは６文字以上で入力してください。"
                  default:
                     self.errorLabel.text = "エラーが起きました。¥nしばらくしてから再度お試しください。"
                  }
               }
            }
         }
      }else{
         self.errorLabel.text = "入力したパスワードが一致していません。"
      }
        // TextFieldの中身をクリア
        mailadress.text = ""
        password.text = ""
        confirm_password.text = ""
    }
   @IBAction func tologin () {
      self.performSegue(withIdentifier: "tologin", sender: nil)
   }


}

