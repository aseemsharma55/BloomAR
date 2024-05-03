//
//  secondViewController.swift
//  blooM
//
//  Created by Ameya Chorghade on 30/04/24.
//

import UIKit

class secondViewController: UIViewController , UITextViewDelegate{

    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var mytextView: UITextView!
    
    @IBOutlet weak var nextBtnOutlet: UIButton!
    
    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var lbl2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        let topColor = UIColor(red: 255/255, green: 247/255, blue: 239/255, alpha: 1.0) // Red
        let bottomColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0) // Blue

        // Create a gradient layer and add it to the view's layer
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        view.layer.insertSublayer(gradientLayer, at: 0)
        
        mainView.layer.borderColor =  UIColor(named: "gray")?.cgColor
        mainView.layer.borderWidth = 0.2
        mainView.layer.cornerRadius = 10
        
        
        mytextView.delegate = self
        updateButtonImage()
        
    }
    
    @IBAction func backBtnTapped(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    func updateButtonImage() {
           // Check if the text view is empty
           if mytextView.text.isEmpty {
               // Set button image when text view is empty
               nextBtnOutlet.setImage(UIImage(named: "nextdisabled"), for: .normal)
           } else {
               // Set button image for other cases
               nextBtnOutlet.setImage(UIImage(named: "nextenabled"), for: .normal)
           }
       }
    
 
    

    @IBAction func nextBtnTapped(_ sender: Any) {

        let destinationViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "thirdViewController")
               
               // Push or present the destination view controller based on your navigation requirement
               navigationController?.pushViewController(destinationViewController, animated: true)
    }
    
    func textViewDidChange(_ textView: UITextView) {
           // Hide label1 and label2 when the text view is not empty
           lbl1.isHidden = !textView.text.isEmpty
           lbl2.isHidden = !textView.text.isEmpty
        
        updateButtonImage()
       }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            // If the return key is pressed, dismiss the keyboard
            mytextView.resignFirstResponder()
            return false // Do not insert a new line character
        }
        return true // Allow other text changes
    }

    
}
