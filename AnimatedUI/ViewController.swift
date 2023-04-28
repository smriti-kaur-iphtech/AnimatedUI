//
//  ViewController.swift
//  AnimatedUI
//
//  Created by iPHTech 15 on 28/04/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var detailButton: UIButton!
    @IBOutlet weak var sizePickerView: UIPickerView!
    @IBOutlet weak var detailView: UIView!
    @IBOutlet weak var addToCartButton: UIButton!
    @IBOutlet weak var brandNameLabel: UILabel!
    @IBOutlet weak var shoeNameLabel: UILabel!
    
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var secondColorView: UIView!
    @IBOutlet weak var thirdColorView: UIView!
    @IBOutlet weak var fourthColorView: UIView!
    @IBOutlet weak var fifthColorView: UIView!
    
    
    
    
    let size = ["6","7","8","9"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        sizePickerView.dataSource = self
        sizePickerView.delegate = self
        
    }
    
    @IBAction func detailButtonAction(_ sender: UIButton) {
        detailView.isHidden = false
      
    }
    
    @IBAction func addToCartAction(_ sender: UIButton) {
        detailView.isHidden = true
    }
    
    func setupUI(){
        detailView.isHidden = true
        detailButton.layer.cornerRadius = 10.0
        colorView.layer.cornerRadius = colorView.layer.bounds.width / 2
        secondColorView.layer.cornerRadius = colorView.layer.bounds.width / 2
        thirdColorView.layer.cornerRadius = colorView.layer.bounds.width / 2
        fourthColorView.layer.cornerRadius = colorView.layer.bounds.width / 2
        fifthColorView.layer.cornerRadius = colorView.layer.bounds.width / 2

    }
}

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return size.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return size[row]
    }
    
}
