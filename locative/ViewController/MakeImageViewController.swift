//
//  MakeImageViewController.swift
//  locative
//
//  Created by 大塚嶺 on 2019/07/16.
//  Copyright © 2019 大塚嶺. All rights reserved.
//

import UIKit

class MakeImageViewController: UIViewController, UIImagePickerControllerDelegate {
    var picker:UIImagePickerController! = UIImagePickerController()
    @IBOutlet var button:UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    @IBAction func imagePickUpButtonClicked() {
        //PhotoLibraryから画像を選択
        picker.sourceType = UIImagePickerController.SourceType.photoLibrary
        
        //デリゲートを設定する
        picker.delegate = self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
        
        //現れるピッカーNavigationBarの文字色を設定する
        picker.navigationBar.tintColor = UIColor.white
        
        //現れるピッカーNavigationBarの背景色を設定する
        picker.navigationBar.barTintColor = UIColor.gray
        
        //ピッカーを表示する
        present(picker, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            button.setBackgroundImage(editedImage, for: .normal)
        } else if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            button.setBackgroundImage(originalImage, for: .normal)
        }
        dismiss(animated: true, completion: nil)
    }
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
//        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
//            button.setBackgroundImage(editedImage, for: .normal)
//        } else if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
//            button.setBackgroundImage(originalImage, for: .normal)
//        }
//        dismiss(animated: true, completion: nil)
//    }
    
    //画像選択がキャンセルされた時に呼ばれる.
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        // モーダルビューを閉じる
        self.dismiss(animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
