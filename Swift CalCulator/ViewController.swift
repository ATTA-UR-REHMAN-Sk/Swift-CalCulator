//
//  ViewController.swift
//  Swift CalCulator
//
//  Created by ATTA SK on 22/08/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ActiveIndicator: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        ActiveIndicator.startAnimating()
    
    Timer.scheduledTimer(withTimeInterval: 4.0, repeats: false) {
        (t) in
        print("done")
        
        self.ActiveIndicator.stopAnimating()
        
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "CalCulator") as? CalCulator
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }

    }
}
