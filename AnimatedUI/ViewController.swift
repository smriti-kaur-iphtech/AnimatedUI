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
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productDetailImageView: UIImageView!
    @IBOutlet weak var cartButton: UIButton!
    
    let animator = UIViewPropertyAnimator(duration: 1.0, curve: .linear)
    let size = ["6","7","8","9"]
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        sizePickerView.dataSource = self
        sizePickerView.delegate = self
        let screenSize: CGRect = UIScreen.main.bounds
        print(screenSize)

    }
    
    @IBAction func detailButtonAction(_ sender: UIButton) {
        detailView.isHidden = false
        productImageView.isHidden = true
        productDetailImageView.contentMode = .scaleAspectFit
        productDetailImageView.image = UIImage(named: "shoes")
        animate()
    }
    
    @IBAction func addToCartAction(_ sender: UIButton) {
        detailView.isHidden = true
        productImageView.isHidden = false
    }
    
    func setupUI(){
        detailView.isHidden = true
        detailButton.layer.cornerRadius = detailButton.layer.bounds.width / 2
        colorView.layer.cornerRadius = colorView.layer.bounds.width / 2
        secondColorView.layer.cornerRadius = colorView.layer.bounds.width / 2
        thirdColorView.layer.cornerRadius = colorView.layer.bounds.width / 2
        fourthColorView.layer.cornerRadius = colorView.layer.bounds.width / 2
        fifthColorView.layer.cornerRadius = colorView.layer.bounds.width / 2
        
        cartButton.layer.shadowColor = UIColor.black.cgColor
        cartButton.layer.shadowOpacity = 0.4
        cartButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        cartButton.layer.shadowRadius = 5.0
        cartButton.layer.masksToBounds = false
        cartButton.layer.cornerRadius = 15.0 //Ht/2
        
        let gesture = UITapGestureRecognizer(target: self, action:  #selector (self.changeColorToRed (_:)))
        self.colorView.addGestureRecognizer(gesture)
        
        let gestureTwo = UITapGestureRecognizer(target: self, action:  #selector (self.changeColorToBlue (_:)))
        self.secondColorView.addGestureRecognizer(gestureTwo)
        
        let gestureThree = UITapGestureRecognizer(target: self, action:  #selector (self.changeColorToOrange (_:)))
        self.thirdColorView.addGestureRecognizer(gestureThree)
        
        let gestureFour = UITapGestureRecognizer(target: self, action:  #selector (self.changeColorToBlack (_:)))
        self.fourthColorView.addGestureRecognizer(gestureFour)
        
        let gestureFive = UITapGestureRecognizer(target: self, action:  #selector (self.changeColorToWhite (_:)))
        self.fifthColorView.addGestureRecognizer(gestureFive)
    }
    
    func animate(){
        UIView.animate(withDuration: 1, animations: {
            let animation = CABasicAnimation()
            animation.keyPath = "position.x"
            animation.fromValue = 393
            animation.toValue = 300
            animation.duration = 1
            self.detailView.layer.add(animation, forKey: "basic")
        },completion: { done in
            if done{
                let animate = CAKeyframeAnimation()
                animate.keyPath = "position.x"
                animate.values = [0,2,-2,2,0]
                animate.keyTimes = [0,0.16,0.5,0.83,1]
                animate.duration = 2
                animate.isAdditive = true
                self.detailView.layer.add(animate, forKey: "shake")
            }
        })
    }
    
    func animateImageSize(x: CGFloat, y: CGFloat){
        UIView.animate(withDuration: 2.0, animations: {() -> Void in
            self.productDetailImageView?.transform = CGAffineTransform(scaleX: x, y: y)
        }, completion: {(_ finished: Bool) -> Void in
            UIView.animate(withDuration: 2.0, animations: {() -> Void in
            self.productDetailImageView?.transform = CGAffineTransform(scaleX: 1, y: 1)
            })
            
        })
    }
    
    @objc func changeColorToRed(_ sender:UITapGestureRecognizer){
        UIView.transition(with: productDetailImageView,
                          duration: 1.0,
                          options: .transitionCrossDissolve,
                          animations: { self.productDetailImageView.image = UIImage(named: "redNikeshoes") },
                          completion: nil)
    }
    
    @objc func changeColorToBlue(_ sender:UITapGestureRecognizer){
        //productDetailImageView.image = UIImage(named: "blueNikeShoes")
        UIView.transition(with: productDetailImageView,
                          duration: 1.0,
                          options: .transitionCrossDissolve,
                          animations: { self.productDetailImageView.image = UIImage(named: "blueNikeShoes") },
                          completion: nil)
    }
    
    @objc func changeColorToOrange(_ sender:UITapGestureRecognizer){
        //productDetailImageView.image = UIImage(named: "orangeNikeShoes")
        UIView.transition(with: productDetailImageView,
                          duration: 1.0,
                          options: .transitionCrossDissolve,
                          animations: { self.productDetailImageView.image = UIImage(named: "orangeNikeShoes") },
                          completion: nil)
    }
    
    @objc func changeColorToBlack(_ sender:UITapGestureRecognizer){
        //productDetailImageView.image = UIImage(named: "blackNikeShoes")
        UIView.transition(with: productDetailImageView,
                          duration: 1.0,
                          options: .transitionCrossDissolve,
                          animations: { self.productDetailImageView.image = UIImage(named: "blackNikeShoes") },
                          completion: nil)
    }
    
    @objc func changeColorToWhite(_ sender:UITapGestureRecognizer){
        //productDetailImageView.image = UIImage(named: "shoes")
        UIView.transition(with: productDetailImageView,
                          duration: 1.0,
                          options: .transitionCrossDissolve,
                          animations: { self.productDetailImageView.image = UIImage(named: "shoes") },
                          completion: nil)
    }
}
//MARK: UIPickerView
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
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(size[row])
        let sizeSelected = size[row]
        switch sizeSelected{
            
        case "6":
            animateImageSize(x: 1.1, y: 1.1)
        case "7":
            animateImageSize(x: 1.2, y: 1.2)
        case "8":
            animateImageSize(x: 1.3, y: 1.3)
        case "9":
            animateImageSize(x: 1.4, y: 1.4)
        default:
            print("invalid")
        }
    }
}
