//
//  CommentViewController.swift
//  Instagram
//
//  Created by 日向亮博 on 2019/07/17.
//  Copyright © 2019 Hinata10. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class CommentViewController: UIViewController {
    
    var postData: PostData!
    //インスタンス変数
//    var ref:DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //インスタンスを生成
//        ref = Database.database().reference()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var commentTextField: UITextField!
    @IBAction func handleCommentButton(_ sender: AnyObject) {
        //テキストを取得
//        let commentData = ["comment":commentTextField.text!]
//        self.ref.childByAutoId().child("comment").setValue(commentData)
        
        // postDataに必要な情報を取得しておく
        let comment = ("\(Auth.auth().currentUser!.displayName!) : \(commentTextField.text!)")
//        self.ref.childByAutoId().child("commentName").setValue(commentName)
//        // 辞書を作成してFirebaseに保存する
//        let postRef = Database.database().reference().child(Const.PostPath)
//        let postDic = ["comment": commentTextField.text!, "commentName": commentName!]
//        postRef.childByAutoId().setValue(postDic)
        //追加
        postData.comments.append(comment)
        let postRef = Database.database().reference().child(Const.PostPath).child(postData.id!)
        let comments = ["comments": postData.comments]
        postRef.updateChildValues(comments)
//        // HUDで入力完了を表示する
        SVProgressHUD.showSuccess(withStatus: "コメントしました")
        // 全てのモーダルを閉じる
        UIApplication.shared.keyWindow?.rootViewController?.dismiss(animated: true, completion: nil)
        
    }
    @IBAction func handleCancelButton(_ sender: Any) {
        // 画面を閉じる
        dismiss(animated: true, completion: nil)
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
