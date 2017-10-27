//
//  PhotoView.swift
//  DongWithQi
//
//  Created by 叶东强子 on 2017/10/27.
//  Copyright © 2017年 叶东强子. All rights reserved.
//

import UIKit

class PhotoView: UIViewController, UIImagePickerControllerDelegate,
UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    var cnt: Int = 0
    @IBOutlet weak var fixImageView: UIImageView!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.layer.contents = UIImage(named:"profile_bg.png")!.cgImage
        textView.backgroundColor = UIColor.clear
    }
    
    //选取相册
    @IBAction func fromAlbum(_ sender: AnyObject) {
        //判断设置是否支持图片库
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            //初始化图片控制器
            let picker = UIImagePickerController()
            //设置代理
            picker.delegate = self
            //指定图片控制器类型
            picker.sourceType = UIImagePickerControllerSourceType.photoLibrary
            //弹出控制器，显示界面
            self.present(picker, animated: true, completion: {
                () -> Void in
            })
        }else{
            print("读取相册错误")
        }
        
    }
    
    //选择图片成功后代理
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : Any]) {
        //查看info对象
        print(info)
        
        //显示的图片
        let image:UIImage!
        //获取选择的原图
        image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        imageView.image = image
        //图片控制器退出
        cnt += 1
        if (cnt>=7){
            fixImageView.image = UIImage(named:"IMG_4126.JPG")
            textView.text = "惊不喜惊喜！意不外意外！"
        }
        picker.dismiss(animated: true, completion: {
            () -> Void in
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
