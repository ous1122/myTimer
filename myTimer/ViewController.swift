//
//  ViewController.swift
//  myTimer
//
//  Created by D7703_13 on 2018. 4. 4..
//  Copyright © 2018년 ous. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    var myTimer = Timer()
    var counter = 1
    var direction = 1;
    var a = true;
    @IBOutlet weak var count: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        image.image = UIImage(named : "frame1.png")
        count.text = "1"
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func start(_ sender: Any) {
        if a == true{
            myTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(doit),
                                 userInfo: nil, repeats: true)
            a = false
        } else if a == false {
            myTimer.invalidate();
            a = true
        }
    }
    
    
    @objc func doit() {
        if counter == 5 {
            direction = 0
        }
            //count가 1이면 증가시키기 위해 direction을 1(증가)으로 변경
        else if counter == 1 {
            direction = 1
        }
        
        //direction이 1(증가)이면 count를 1씩 증가
        if direction == 1 {
            counter += 1
        }
            //direction이 0(감소)이면 count를 1씩 감소
        else if direction == 0 {
            counter = counter - 1
        }
        
        image.image = UIImage(named : "frame\(counter).png")
        count.text = String(counter)
    }
}

