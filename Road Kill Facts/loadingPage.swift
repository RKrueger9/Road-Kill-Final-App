//
//  loadingPage.swift
//  Road Kill Facts
//
//  Created by Student on 4/8/16.
//  Copyright © 2016 RKrueger. All rights reserved.
//

import UIKit

class loadingPage: UIViewController
{
    @IBOutlet var imageView: UIImageView!
    var int = 0;
    var timer = NSTimer()
    
    override func viewDidLoad()
    {
        timer = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: "update", userInfo: nil, repeats: true)
        var nextTimer =  NSTimer.scheduledTimerWithTimeInterval(5, target: self, selector: "next", userInfo: nil, repeats: false)
    }
    
    func update()
    {
        imageView.image = UIImage(named: String(int))
        int++
        if(int>10){timer.invalidate()}
    }
    
    func next()
    {
        performSegueWithIdentifier("show", sender: self)
    }
}
