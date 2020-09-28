//
//  ViewController.swift
//  Pryaniky.com
//
//  Created by Vladislav Fefelov on 28.09.2020.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var Label: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    
    var imageURL = String()
    var text = String()
    var variants = [Int:String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        hideOrShow()
    }
    
    func hideOrShow() {
        
        if imageURL == "" {
            imageView.isHidden = true
        } else {
            let data = try? Data(contentsOf: URL(string: imageURL)!)
            imageView.image = UIImage(data: data!)
        }
        
        if text == "" {
            Label.isHidden = true
        } else {
            Label.text = text
        }
        
        if variants == [:] {
            pickerView.isHidden = true
        }
    }
    
}


extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return variants.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return variants[row]
    }
    
}
