//
//  ViewController.swift
//  fizzBuzzReal
//
//  Created by Suprita Ashok on 10/9/19.
//  Copyright © 2019 Suprita Ashok. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //TODO: Change background color
    
    //MARK: Variables
    var fizzVal = 0
    var buzzVal = 0
    var bangVal = 0
    
    @IBOutlet weak var enterNum: UITextField!
    @IBOutlet weak var pressEnter: UIButton!
    @IBOutlet weak var fizzBuzzOutput: UITextView!
    @IBOutlet weak var resetButton: UIButton!
    
    //MARK: Boilerplate
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    
    
    //MARK: Actions
    @IBAction func buttonPress(_ sender: UIButton) {
        pressEnter.setTitleColor(.black, for: .normal)
        resetButton.setTitleColor(.orange, for: .normal)
        
        fizzBuzzOutput.text = ""
        let num = Int(enterNum.text!)
        fizzBuzzOutput.text = fizzBuzz(num: num!)
        
        if num! < 100 {
            fizzBuzzOutput.text = "Please enter a number above 100"
        }
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // get the current text, or use an empty string if that failed
        let currentText = textField.text ?? ""
        
        // attempt to read the range they are trying to change, or exit if we can't
        guard let stringRange = Range(range, in: currentText) else { return false }
        
        // add their new text to the existing text
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        
        // make sure the result is under 16 characters
        return updatedText.count <= 16
    }
    
    @IBAction func Reset(_ sender: UIButton) {
        fizzBuzzOutput.text = ""
    }
    
    
    func fizzBuzz (num: Int)-> String{
        var output = ""
        for num in 1...num {
        
            fizzVal = num % 3
            buzzVal = num % 5
            bangVal = num % 7
            
            
            if bangVal == 0 && fizzVal == 0 && buzzVal == 0 {
                output += ("FizzBuzzang ")
            } else if fizzVal == 0 && buzzVal == 0 && bangVal != 0{
                output += ("FizzBuzz ")
            } else if bangVal == 0 && fizzVal == 0 {
                output += ("FizzBang")
            }  else if bangVal == 0 && buzzVal == 0 {
                output += ("BuzzBang")
            } else if bangVal == 0 && fizzVal != 0 && buzzVal != 0{ // multiples of 7
                output += ("Bang ")
            } else if fizzVal == 0{
                output += ("Fizz ")
            } else if buzzVal == 0 {
                output += ("Buzz ")
            } else {
                output += String(num) + " "
            }
        }
        
    return output
    
    }

}

