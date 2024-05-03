//
//  thirdViewController.swift
//  blooM
//
//  Created by Ameya Chorghade on 30/04/24.
//

import UIKit
import ARKit
import QuickLook

class thirdViewController: UIViewController , QLPreviewControllerDataSource {

    var selectedModel:String = ""
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
        
    }
    
    @IBAction func backBtnTapped(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func startDecoratingButtonPressed(_ sender: UIButton) {
        if sender.tag == 1 {
            selectedModel = "snake"
            
            
        } else if sender.tag == 2 {
            
            selectedModel = "snake"
        }
        let previewController = QLPreviewController()
        previewController.dataSource = self
        present(previewController, animated: true, completion: nil)
    }

    func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
        return 1
    }

    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
//        let fileUrl = Bundle.main.url(forResource: "plant", withExtension: "usdz")!
        let fileUrl = Bundle.main.url(forResource: selectedModel, withExtension: "usdz")!
        let previewItem = ARQuickLookPreviewItem(fileAt: fileUrl)
        previewItem.canonicalWebPageURL = URL(string: "https://developer.apple.com/augmented-reality/quick-look/models/drummertoy/")
        previewItem.allowsContentScaling = false
        return previewItem
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
