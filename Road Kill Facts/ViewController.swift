//
//  ViewController.swift
//  Road Kill Facts
//
//  Created by RKrueger on 4/5/16.
//  Copyright © 2016 RKrueger. All rights reserved.
// 

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate
{

    @IBOutlet weak var imageView: UIImageView!
    let imagePicker = UIImagePickerController();
    
    override func viewDidLoad()
    {
        super.viewDidLoad();
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject])
    {
        imagePicker.dismissViewControllerAnimated(true)
            {
                () -> Void in
                let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage;
                self.imageView.image = selectedImage;
            }
    }
    
    @IBAction func onCameraButtonTap(sender: AnyObject)
    {
        
    }
    
    @IBAction func onLibraryButtonTap(sender: AnyObject)
    {
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary;
        presentViewController(imagePicker, animated: true, completion: nil);
    }
    
}

