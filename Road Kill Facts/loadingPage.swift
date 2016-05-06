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
    override func viewDidLoad()
    {
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
        var size = imageView.frame.size;
        var rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContext(imageView.frame.size)
        currentImage?.drawInRect(rect)
        rotate(CGFloat(i), size: size,image: foregroundImage!).drawInRect(rect)
        imageView.image  = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        i+=5
    }
    
    func next()
    {
        timerBack.invalidate()
        timerFront.invalidate()
        performSegueWithIdentifier("show", sender: self)
    }
    
    func rotate(deg: CGFloat, size: CGSize, image: UIImage) -> UIImage
    {
        let radiansToDegrees: (CGFloat) -> CGFloat = {
            return $0 * (180.0 / CGFloat(M_PI))
        }
        let degreesToRadians: (CGFloat) -> CGFloat = {
            return $0 / 180.0 * CGFloat(M_PI)
        }
        
        // Create the bitmap context
        UIGraphicsBeginImageContext(size)
        //image.drawInRect(CGRect(x: 0, y: 0, width: size.width, height: size.height))
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
