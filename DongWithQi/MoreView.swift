//
//  MoreView.swift
//  DongWithQi
//
//  Created by 叶东强子 on 2017/10/27.
//  Copyright © 2017年 叶东强子. All rights reserved.
//

import UIKit

class MoreView: UIViewController {

    @IBOutlet weak var Text: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.layer.contents = UIImage(named:"爱是一道光_2.jpg")!.cgImage
        Text.backgroundColor = UIColor.clear
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
