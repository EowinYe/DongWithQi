//
//  NoteViewController.swift
//  DongWithQi
//
//  Created by 叶东强子 on 2017/10/26.
//  Copyright © 2017年 叶东强子. All rights reserved.
//

import UIKit

class NoteViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var doneBtn: UIButton!
    @IBOutlet weak var Text: UITextView!
    var planIt: PlanItem!
    @IBOutlet weak var bottomlayout: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let defaults = UserDefaults.standard
        let data = defaults.object(forKey: "\(planIt.id_)") as? NSString
        if data != nil{
            Text.text = data! as String
        }
        Text.delegate = self
        //bottomlayout.constant = 300
        //Text.becomeFirstResponder()
        self.view.addSubview(Text)
        self.view.layer.contents = UIImage(named:"NoteBackground.png")!.cgImage
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillShow(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        //NotificationCenter.default.addObserver(self, selector:"keyBoardWillShow", name:NSNotification.Name.UIKeyboardWillShow, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backAct(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneAct(_ sender: UIButton) {
        let noteText = Text.text
        let defaults = UserDefaults.standard
        defaults.set(noteText, forKey: "\(planIt.id_)")
        let title = defaults.object(forKey: "\(planIt.id_)"+"title") as? String
        if title == ""{
            defaults.set(noteText?.components(separatedBy: "\n")[0], forKey: "\(planIt.id_)"+"title")
        }
        defaults.synchronize()
        
        let alert = UIAlertView()
        alert.title = "OwO"
        alert.message = "计划已经保存啦~"
        alert.addButton(withTitle: "知道啦")
        alert.show()
        
        self.dismiss(animated: true, completion: nil)
    }
    
    func keyBoardWillShow(_ note:NSNotification)
    {
        bottomlayout.constant = 300
    }
    
    func getKeyboardHeight(notification: NSNotification) -> CGFloat {
        let userInfo = notification.userInfo
        
        let keyboardSize = userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue
        
        return keyboardSize.cgRectValue.height
        
    }
    
    
    //点击return 收回键盘
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        Text.resignFirstResponder()
        return true
    }
    //点击其他地方  收回键盘
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        bottomlayout.constant = 60
        Text.resignFirstResponder()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
