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
    var timerBack = NSTimer()
    var timerFront = NSTimer()
    var currentImage = UIImage(named: "0")
    var foregroundImage = UIImage(named: "tire")
    var i = 0;
    var size = CGSize()
    var rect = CGRect()
    override func viewDidLoad()
    {
        size = imageView.frame.size;
        rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        var min = rect.width;
        if(rect.height<rect.width){min = rect.height}
        size = CGSize(width: min, height: min)
        
        timerBack = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: "updateBack", userInfo: nil, repeats: true)
        timerFront = NSTimer.scheduledTimerWithTimeInterval(0.025, target: self, selector: "updateFront", userInfo: nil, repeats: true)
        NSTimer.scheduledTimerWithTimeInterval(5, target: self, selector: "next", userInfo: nil, repeats: false)
    }
    
    func updateBack()
    {
        currentImage = UIImage(named: String(int))
        int+=1
        if(int>10){timerBack.invalidate()}
    }
    
    func updateFront()
    {
        UIGraphicsBeginImageContext(imageView.frame.size)
        currentImage?.drawInRect(rect)
        rotate(CGFloat(i),image: foregroundImage!).drawInRect(rect)
        imageView.image  = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        //speed
        i+=3
    }
    
    func next()
    {
        timerBack.invalidate()
        timerFront.invalidate()
        performSegueWithIdentifier("show", sender: self)
    }
    
    func rotate(deg: CGFloat, image: UIImage) -> UIImage
    {
        let degreesToRadians:(CGFloat) -> CGFloat =
        {
            return $0/180.0 * CGFloat(M_PI)
        }
        
        // Create the bitmap context
        UIGraphicsBeginImageContext(size)
        let bitmap = UIGraphicsGetCurrentContext()
        
        // Move the origin to the middle of the image so we will rotate and scale around the center.
        CGContextTranslateCTM(bitmap, size.width / 2.0, size.height / 2.0);
        
        //   // Rotate the image context
        CGContextRotateCTM(bitmap, degreesToRadians(deg));
        CGContextDrawImage(bitmap, CGRectMake(-size.width / 2, -size.height / 2, size.width, size.height), image.CGImage)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
}
