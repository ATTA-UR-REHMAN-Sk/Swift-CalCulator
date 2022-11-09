//
//  CalCulator.swift
//  Swift CalCulator
//
//  Created by ATTA SK on 22/08/2022.
//

import UIKit

class CalCulator: UIViewController {
    
    @IBOutlet weak var Resultlbl: UILabel!
    @IBOutlet weak var Lbltxt: UILabel!
    @IBOutlet weak var BtnAc: UIButton!
    @IBOutlet weak var Btnpm: UIButton!
    @IBOutlet weak var Btnfct: UIButton!
    @IBOutlet weak var Btndiv: UIButton!
  
    @IBOutlet weak var Btn7: UIButton!
    
    @IBOutlet weak var Btn8: UIButton!
    
    @IBOutlet weak var Btn9: UIButton!
    
    @IBOutlet weak var BtnX: UIButton!
    @IBOutlet weak var Btn4: UIButton!
    
    @IBOutlet weak var Btn5: UIButton!
    @IBOutlet weak var Btn6: UIButton!
    
    @IBOutlet weak var BtnMins: UIButton!
    @IBOutlet weak var Btn1: UIButton!
    
    @IBOutlet weak var Btn2: UIButton!
    @IBOutlet weak var Btn3: UIButton!
    
    @IBOutlet weak var BtnPls: UIButton!
    @IBOutlet weak var Btn0: UIButton!
    
    @IBOutlet weak var BtnDot: UIButton!
    @IBOutlet weak var BtnEql: UIButton!
    
    
    var workings: String = ""
    var reslt = ""
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearAll()

        // Do any additional setup after loading the view.
        BtnAc.setRounded()
        Btnpm.setRounded()
        Btnfct.setRounded()
        Btndiv.setRounded()
        Btn7.setRounded()
        Btn8.setRounded()
        Btn9.setRounded()
        BtnX.setRounded()
        Btn4.setRounded()
        Btn5.setRounded()
        Btn6.setRounded()
        BtnMins.setRounded()
        Btn1.setRounded()
        Btn2.setRounded()
        Btn3.setRounded()
        BtnPls.setRounded()
        Btn0.setRounded()
        BtnDot.setRounded()
        BtnEql.setRounded()
       // BtnAc.layer.cornerRadius = 25
     
    }
    
    
    
    // Clear All Reserved resources
    func clearAll()  {
        workings = ""
        Lbltxt.text = ""
        reslt = ""
    }
    
    // Getting Values from User
    func addToWorkings(value: String) {
       //concatation of values on screen
        workings = workings + value
        Lbltxt.text = workings
    }
    
    
    @IBAction func percentTap(_ sender: Any) {
        addToWorkings(value: "%")
    }
    
    @IBAction func pressMultiply(sender: Any) {
        addToWorkings(value: "*")
        }
    
    @IBAction func pressDivide(sender: Any) {
        addToWorkings(value: "/")
        }
    
    @IBAction func pressMinus(sender: Any) {
        addToWorkings(value: "-")
        }
    
    
    @IBAction func pressPlus(sender: Any) {
        addToWorkings(value: "+")
        }
    
    @IBAction func pressZero(sender: Any) {
        addToWorkings(value: "0")
        }
    @IBAction func pressNine(sender: Any) {
        addToWorkings(value: "9")
        }
    @IBAction func pressEight(sender: Any) {
        addToWorkings(value: "8")
        }
    @IBAction func pressSeven(sender: Any) {
        addToWorkings(value: "7")
        }
    @IBAction func pressSix(sender: Any) {
        addToWorkings(value: "6")
        }
    @IBAction func pressFive(sender: Any) {
        addToWorkings(value: "5")
        }
    @IBAction func pressFour(sender: Any) {
        addToWorkings(value: "4")
        }
    @IBAction func pressThree(sender: Any) {
        addToWorkings(value: "3")
        }
    @IBAction func pressTwo(sender: Any) {
        addToWorkings(value: "2")
        }
    @IBAction func pressOne(sender: Any) {
        addToWorkings(value: "1")
        }
    
    
    // Clear all variables by assigning null value
    @IBAction func clearCalculations(sender: Any) {
          clearAll()
    }
    
   
    @IBAction func bAck(_ sender: Any) {
        if (!workings.isEmpty) {
            workings.removeLast()
            Lbltxt.text = workings
        }
    }
    
    
    
    
    // total the assign data and return result
    @IBAction func pressEquals(sender: Any) {
//        addToWorkings(value: "=")
       if (validInput())
       {
        let checkedWorkingsForPercent = workings.replacingOccurrences(of: "%", with: "*0.01")
        
        let expression = NSExpression(format: checkedWorkingsForPercent)
        let result = expression.expressionValue(with: nil, context: nil) as! Double
        let resultString = formatResult(result: result)
            reslt =  resultString
        
            Lbltxt.text = reslt
        
            //clearAll()
        }
        else
       {
        let alert = UIAlertController(
        title: "Invalid Input",
            message: "Calculator unable to do math based on input", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default))
        self.present(alert, animated: true, completion: nil)
       }
        
       }
    
    func validInput() -> Bool {
        
        var count = 0
        var funcCharIndexes = [Int]()
        
        for char in workings
        {
            if (specialCharacter(char: char))
            {
                funcCharIndexes.append(count)
            }
            count += 1
        }
        var previous: Int = -1
        
        for index in funcCharIndexes
        {
            if(index == 0)
            {
                return false
            }
            if (index == workings.count - 1) {
                return false
            }
            if (previous != -1) {
                if (index - previous == 1) {
                    return false
                }
                previous = index
            }
        }
            
        return true
    }
    
    
    func specialCharacter (char: Character) -> Bool
    {
        if(char == "+")
        {
            return true
        }
        if(char == "/")
        {
            return true
        }
        if(char == "*")
        {
            return true
        }
        return false
    }
    
     func formatResult(result: Double) -> String
       {
        if(result.truncatingRemainder(dividingBy: 1) == 0)
        {
            return String (format: "%.0f",result)
        }
        else
        {
            return String (format: "%.2f", result)
        }
    }
    
    
    
}

extension UIButton {
   func setRounded() {
    
    self.layer.borderWidth = 1
    self.layer.masksToBounds = false
    self.layer.borderColor = UIColor.black.cgColor
    self.layer.cornerRadius = self.frame.height/2
    self.clipsToBounds = true
  
    
//    let radius = self.frame.width / 2
//      self.layer.cornerRadius = radius
//      self.layer.masksToBounds = true
   }
    
    
}
