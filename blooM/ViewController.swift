//
//  ViewController.swift
//  blooM
//
//  Created by Ameya Chorghade on 29/04/24.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var textMainView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let topColor = UIColor(red: 255/255, green: 247/255, blue: 239/255, alpha: 1.0) // Red
        let bottomColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0) // Blue

        // Create a gradient layer and add it to the view's layer
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        view.layer.insertSublayer(gradientLayer, at: 0)
        
        
        textMainView.layer.shadowColor = UIColor.black.cgColor // Shadow color
        textMainView.layer.shadowOpacity = 0.2 // Shadow opacity (0 to 1)
        textMainView.layer.shadowOffset = CGSize(width: 2, height: 3) // Shadow offset (x, y)
        textMainView.layer.shadowRadius = 10// Shadow radius (spread of the shadow)
             
             // Adjust shadow for performance
        textMainView.layer.shadowPath = UIBezierPath(rect: textMainView.bounds).cgPath
        textMainView.layer.shouldRasterize = true
        textMainView.layer.rasterizationScale = UIScreen.main.scale
        
        textMainView.layer.cornerRadius = 10
    }
    
    

    @IBAction func nextBtnTapped(_ sender: Any) {
        
        let destinationViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "secondVC")
               
               // Push or present the destination view controller based on your navigation requirement
               navigationController?.pushViewController(destinationViewController, animated: true)
    }
    
}

