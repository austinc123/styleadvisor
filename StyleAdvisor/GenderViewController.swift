//
//  GenderViewController.swift
//  StyleAdvisor
//
//  Created by Stephanie Lee on 12/11/15.
//  Copyright © 2015 Team4. All rights reserved.
//

import Foundation
import UIKit

class GenderViewController : UIViewController {
    
    let preferredLanguages: [String] = NSLocale.preferredLanguages() as [String]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let systemLanguage = preferredLanguages[0]
        var languageArrary = systemLanguage.componentsSeparatedByString("-")
        let languageCode = languageArrary[0]
        
        if (languageCode == "es") {
            MaleButton.setTitle("Chico", forState: UIControlState.Normal)
            FemaleButton.setTitle("Chica", forState: UIControlState.Normal)
        }
        
        let filePath = NSBundle.mainBundle().pathForResource("background2", ofType: "gif")
        	let gif = NSData(contentsOfFile: filePath!)
        
        let webViewBG = UIWebView(frame:self.view.frame)
        webViewBG.loadData(gif!, MIMEType: "image/gif", textEncodingName: String(), baseURL: NSURL())
            webViewBG.userInteractionEnabled = false;
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBOutlet weak var MaleButton: UIButton!
    @IBOutlet weak var FemaleButton: UIButton!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destViewController : ViewController = segue.destinationViewController as! ViewController
        
        if (segue.identifier == "Male") {
            destViewController.gender = Gender.Male
        }
        
        else if (segue.identifier == "Female") {
            destViewController.gender = Gender.Female
        }
    }
    
}