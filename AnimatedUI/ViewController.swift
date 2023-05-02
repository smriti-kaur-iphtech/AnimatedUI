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
    @IBOutlet weak var cartButton: UIButton!
    @IBOutlet weak var closeButton: UIButton!
    
    
    let animator = UIViewPropertyAnimator(duration: 1.0, curve: .linear)
    let size = ["6","7","8","9"]
    private let dashHeight: CGFloat = 2.0
    private let dashWidth: CGFloat = 50.0
    private let numberFont = UIFont.systemFont(ofSize: 28)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        sizePickerView.dataSource = self
        sizePickerView.delegate = self
        let screenSize: CGRect = UIScreen.main.bounds
        print(screenSize)
        

    }
    
    
    
  /*  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            var touch: UITouch? = touches.first
            if touch?.view != detailView {
                detailView.isHidden = true
                productImageView.isHidden = false
            }
        }*/

    
    @IBAction func detailButtonAction(_ sender: UIButton) {
        detailView.isHidden = false
        animate(from: 393, to: 300)
    }
    
    @IBAction func addToCartAction(_ sender: UIButton) {
        detailView.isHidden = true
    }
    
    @IBAction func closeButtonAction(_ sender: UIButton) {
        detailView.isHidden = true
    }
    
    func setupUI(){
        closeButton.layer.cornerRadius = closeButton.layer.bounds.width / 2
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
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        view.addGestureRecognizer(tapGesture)
    }
    
    func animate(from: Any, to: Any){
        UIView.animate(withDuration: 1, animations: {
            let animation = CABasicAnimation()
            animation.keyPath = "position.x"
            animation.fromValue = from//393
            animation.toValue = to//300
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
    
    
    func animateBackward(){
        UIView.animate(withDuration: 1, animations: {
            let animation = CABasicAnimation()
            animation.keyPath = "position.x"
            animation.fromValue = 300
            animation.toValue = 500
            animation.duration = 1
            self.detailView.layer.add(animation, forKey: "basic")
        })
        
    }
    
    func animateImageSize(x: CGFloat, y: CGFloat){
        UIView.animate(withDuration: 2.0, animations: {() -> Void in
            self.productImageView?.transform = CGAffineTransform(scaleX: x, y: y)
        })
    }
    
    @objc func changeColorToRed(_ sender:UITapGestureRecognizer){
        UIView.transition(with: productImageView,
                          duration: 1.0,
                          options: .transitionCrossDissolve,
                          animations: { self.productImageView.image = UIImage(named: "redNikeshoes") },
                          completion: nil)
    }
    
    @objc func changeColorToBlue(_ sender:UITapGestureRecognizer){
       
        UIView.transition(with: productImageView,
                          duration: 1.0,
                          options: .transitionCrossDissolve,
                          animations: { self.productImageView.image = UIImage(named: "blueNikeShoes") },
                          completion: nil)
    }
    
    @objc func changeColorToOrange(_ sender:UITapGestureRecognizer){
        
        UIView.transition(with: productImageView,
                          duration: 1.0,
                          options: .transitionCrossDissolve,
                          animations: { self.productImageView.image = UIImage(named: "orangeNikeShoes") },
                          completion: nil)
    }
    
    @objc func changeColorToBlack(_ sender:UITapGestureRecognizer){
        
        UIView.transition(with: productImageView,
                          duration: 1.0,
                          options: .transitionCrossDissolve,
                          animations: { self.productImageView.image = UIImage(named: "blackNikeShoes") },
                          completion: nil)
    }
    
    @objc func changeColorToWhite(_ sender:UITapGestureRecognizer){
       
        UIView.transition(with: productImageView,
                          duration: 1.0,
                          options: .transitionCrossDissolve,
                          animations: { self.productImageView.image = UIImage(named: "shoes") },
                          completion: nil)
    }
    
    @objc func handleTap(_ gestureRecognizer: UITapGestureRecognizer) {
        // Check if the tap was outside of the detailView
        let location = gestureRecognizer.location(in: detailView)
        if !detailView.point(inside: location, with: nil) {
            detailView.isHidden = true
    
        }
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
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 120, height: 30))
        
        let dashView = UIView(frame: CGRect(x: 0, y: (containerView.frame.height - dashHeight) / 2, width: dashWidth, height: dashHeight))
        dashView.backgroundColor = UIColor.white
        containerView.addSubview(dashView)
        
        let height =  (containerView.frame.height - dashHeight) / 2
        if row != (size.count - 1) {
            for i in 1...5 {
                
                let dashView = UIView(frame: CGRect(x: 0, y: (CGFloat(10 * i) + height), width: dashWidth - 20, height: dashHeight))
                dashView.backgroundColor = UIColor.white
                containerView.addSubview(dashView)
            }
        }
        
        let numberLabel = UILabel(frame: CGRect(x: dashWidth + 20, y: 0, width: 80, height: containerView.frame.height))
        numberLabel.textAlignment = .center
        numberLabel.textColor = .white
        numberLabel.font = numberFont
        numberLabel.text = "\(size[row])"
        containerView.addSubview(numberLabel)
        
        return containerView
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(size[row])
        let sizeSelected = size[row]
        switch sizeSelected{
            
        case "6":
            animateImageSize(x: 1.1, y: 1.1)
        case "7":
            animateImageSize(x: 1.15, y: 1.15)
        case "8":
            animateImageSize(x: 1.2, y: 1.2)
        case "9":
            animateImageSize(x: 1.25, y: 1.25)
        default:
            print("invalid")
        }
    }
}
