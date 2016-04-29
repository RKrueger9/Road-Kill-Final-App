//
//  informationPage.swift
//  Road Kill Facts
//
//  Created by Student on 4/8/16.
//  Copyright © 2016 RKrueger. All rights reserved.
//

import UIKit

class informationPage: UIViewController
{
    @IBOutlet weak var outputText: UITextView!
    
    override func viewDidLoad()
    {
        var stuff0 = [String]()
        stuff0.append("blah blah blah")
        stuff0.append("blah blah")
        var stuff1 = [String]()
        stuff1.append("blah blah blah")
        stuff1.append("blah blah")
        var stuff2 = [String]()
        stuff2.append("blah blah blah")
        stuff2.append("blah blah")
        outputText.text = ""+stuff0[rand(stuff0.count)]+"\n"+stuff1[rand(stuff1.count)]+"\n"+stuff2[rand(stuff2.count)];
    }
    
    func rand(i: Int) ->Int
    {
        return Int(arc4random_uniform(UInt32(i)))

    }
}
