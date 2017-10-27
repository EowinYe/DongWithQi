//
//  ViewController.swift
//  DongWithQi
//
//  Created by 叶东强子 on 2017/7/17.
//  Copyright © 2017年 叶东强子. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var HappyBirthday: UIButton!
    var audioPlayer: AVAudioPlayer!
    func playBgMusic(){
        let musicPath = Bundle.main.path(forResource: "Happy Birthday", ofType: "mp3")
        let url = NSURL(fileURLWithPath: musicPath!)
        do{
            try audioPlayer = AVAudioPlayer(contentsOf: url as URL)
        } catch{
            print("error")
        }
        audioPlayer.numberOfLoops = -1
        audioPlayer.volume = 1
        audioPlayer.prepareToPlay()
        audioPlayer.play()
    }

    @IBOutlet weak var birthdayCake: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        let a:BmobObject = BmobObject(className: "Data")
        
        a.setObject("hello", forKey: "Content")
        //a.saveInBackground()
        //let b:BmobObjectResultBlock = BmobObjectResultBlock()
        //a.saveInBackground(resultBlock: b)
        //print(b)
        print(a)
        print("hello")
        playBgMusic()
        self.view.layer.contents = UIImage(named:"lovebg.jpg")!.cgImage
        birthdayCake.backgroundColor = UIColor.clear
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

