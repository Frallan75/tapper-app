//
//  ViewController.swift
//  tapper-extreme
//
//  Created by Francisco Claret on 16/01/16.
//  Copyright © 2016 Francisco Claret. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var tapButton: UIButton!
    @IBOutlet weak var tapLabel: UILabel!
    
    var numberOfTapsToWin = 0
    var tappedTimes = 0
    
    @IBAction func playButtonPressed(sender: UIButton!) {
        
        guard let numberOfTapsToWinText = textField.text where textField.text != "" && Int(textField.text!) != nil else {
            alert()
            return}
        print(numberOfTapsToWinText)
        
        numberOfTapsToWin = Int(numberOfTapsToWinText)!
        
        logo.hidden = true
        playButton.hidden = true
        textField.hidden = true
        tapButton.hidden = false
        tapLabel.hidden = false
        
        tapLabel.text = "Number of taps to win = \(numberOfTapsToWin)"
    
    }
    
    @IBAction func tapButtonTapped(sender: UIButton!) {
        
        if tappedTimes < numberOfTapsToWin - 1 {
            ++tappedTimes
            tapLabel.text = String(tappedTimes)
        }
        else {
        
        logo.hidden = false
        playButton.hidden = false
        textField.hidden = false
        tapButton.hidden = true
        tapLabel.hidden = true
        
        textField.text = ""
        
        tappedTimes = 0
        numberOfTapsToWin = 0
        }
        
        
        
        
    }
    
    
    
    func alert() {
        let theAlert = UIAlertController(title: "ALERT", message: "Please add a correct number!", preferredStyle: UIAlertControllerStyle.Alert)
        let dismissAlert = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
        theAlert.addAction(dismissAlert)
        presentViewController(theAlert, animated: true, completion: nil)
        
    }
    
    
    

    


}

