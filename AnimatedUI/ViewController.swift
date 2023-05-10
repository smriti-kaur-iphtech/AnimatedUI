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
    @IBOutlet weak var imageBackgroundView: UIView!
    @IBOutlet weak var layerImageView: UIImageView!
    @IBOutlet weak var outerCircularView: UIView!
    @IBOutlet weak var middleCircularView: UIView!
    @IBOutlet weak var innerCircularView: UIView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    let animator = UIViewPropertyAnimator(duration: 1.0, curve: .linear)
    let size = ["6","7","8","9"]
    private let dashHeight: CGFloat = 1.0
    private let dashWidth: CGFloat = 99.0
    private let numberFont = UIFont.boldSystemFont(ofSize: 40)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        sizePickerView.dataSource = self
        sizePickerView.delegate = self
        let screenSize: CGRect = UIScreen.main.bounds
        descriptionLabel.minimumScaleFactor = 0.5;
        descriptionLabel.adjustsFontSizeToFitWidth = true;
    }
    
    @IBAction func detailButtonAction(_ sender: UIButton) {
        detailView.isHidden = false
        Animation.shared.circleAnim(detailView, duration: 0.5)
    }
    
    @IBAction func addToCartAction(_ sender: UIButton) {
        detailView.isHidden = true
    }
    
    @IBAction func closeButtonAction(_ sender: UIButton) {
        detailView.isHidden = true
    }
    
    func setupUI(){
        //button UI design
        closeButton.layer.cornerRadius = closeButton.layer.bounds.width / 2
        detailView.isHidden = true
        detailButton.layer.cornerRadius = detailButton.layer.bounds.width / 2
        
        //for making colorviews circular
        colorView.layer.cornerRadius = colorView.layer.bounds.width / 2
        secondColorView.layer.cornerRadius = colorView.layer.bounds.width / 2
        thirdColorView.layer.cornerRadius = colorView.layer.bounds.width / 2
        fourthColorView.layer.cornerRadius = colorView.layer.bounds.width / 2
        fifthColorView.layer.cornerRadius = colorView.layer.bounds.width / 2
 
        //white border around color views
        colorView.layer.borderWidth = 2
        colorView.layer.borderColor = UIColor.white.cgColor
        
        secondColorView.layer.borderWidth = 2
        secondColorView.layer.borderColor = UIColor.white.cgColor
        
        thirdColorView.layer.borderWidth = 2
        thirdColorView.layer.borderColor = UIColor.white.cgColor
        
        fourthColorView.layer.borderWidth = 2
        fourthColorView.layer.borderColor = UIColor.white.cgColor
        
        fifthColorView.layer.borderWidth = 2
        fifthColorView.layer.borderColor = UIColor.white.cgColor
        
        cartButton.layer.masksToBounds = false
        cartButton.layer.cornerRadius = cartButton.frame.size.height/2 //Ht/2
        cartButton.layer.borderWidth = 2
        cartButton.layer.borderColor = UIColor.white.cgColor
        cartButton.titleLabel?.font = .systemFont(ofSize: 15)
        self.cartButton.frame.size.height = 100
        
        closeButton.layer.shadowColor = UIColor.black.cgColor
        closeButton.layer.shadowOpacity = 0.2
        closeButton.layer.shadowOffset = CGSize(width: 2, height: 2)
        closeButton.layer.shadowRadius = 4.0
        closeButton.layer.masksToBounds = false
  
        cartButton.addTarget(self, action: #selector(self.heldDown), for: .touchDown)
        
        outerCircularView.layer.cornerRadius = outerCircularView.layer.bounds.width / 2
        middleCircularView.layer.cornerRadius = middleCircularView.layer.bounds.width / 2
        innerCircularView.layer.cornerRadius = innerCircularView.layer.bounds.width / 2
    
        //for recognizing the user tap on colorviews
        let gesture = UITapGestureRecognizer(target: self, action:  #selector (self.changeColorToRed (_:)))
        self.colorView.addGestureRecognizer(gesture)
        
        let gestureTwo = UITapGestureRecognizer(target: self, action:  #selector (self.changeColorToBlue (_:)))
        self.secondColorView.addGestureRecognizer(gestureTwo)
        
        let gestureThree = UITapGestureRecognizer(target: self, action:  #selector (self.changeColorToGreen(_:)))
        self.thirdColorView.addGestureRecognizer(gestureThree)
        
        let gestureFour = UITapGestureRecognizer(target: self, action:  #selector (self.changeColorToBlack (_:)))
        self.fourthColorView.addGestureRecognizer(gestureFour)
        
        let gestureFive = UITapGestureRecognizer(target: self, action:  #selector (self.changeColorToWhite (_:)))
        self.fifthColorView.addGestureRecognizer(gestureFive)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        view.addGestureRecognizer(tapGesture)
    }
  
    //MARK: Functions for changing the color of specific part of image.
    @objc func changeColorToRed(_ sender:UITapGestureRecognizer){
        Animation.shared.changeRed(imageView: layerImageView)
    }
    
    @objc func changeColorToBlue(_ sender:UITapGestureRecognizer){
        Animation.shared.changeBlue(imageView: layerImageView)
    }
    
    @objc func changeColorToGreen(_ sender:UITapGestureRecognizer){
        Animation.shared.changeGreen(imageView: layerImageView)
    }
    
    @objc func changeColorToBlack(_ sender:UITapGestureRecognizer){
        Animation.shared.changeBlack(imageView: layerImageView)
    }
    
    @objc func changeColorToWhite(_ sender:UITapGestureRecognizer){
        Animation.shared.changeWhite(imageView: layerImageView)
    }
    
    @objc func handleTap(_ gestureRecognizer: UITapGestureRecognizer) {
        // Check if the tap was outside of the detailView
        let location = gestureRecognizer.location(in: detailView)
        if !detailView.point(inside: location, with: nil) {
            detailView.isHidden = true
        }
    }
    
    //target functions
    @objc func heldDown()
    {
        cartButton.backgroundColor = UIColor(red: 107, green: 132, blue: 241, alpha: 0)
        cartButton.tintColor = .white
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
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 40
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 210, height: 30))
        
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
        
        let numberLabel = UILabel(frame: CGRect(x: dashWidth + 10, y: 0, width: 70, height: containerView.frame.height))
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
            Animation.shared.animateImageSize(x: 1.05, y: 1.05, image: layerImageView)
            Animation.shared.animateImageSize(x: 1.05, y: 1.05, image: productImageView)
           
        case "7":
            Animation.shared.animateImageSize(x: 1.08, y: 1.08, image: layerImageView)
            Animation.shared.animateImageSize(x: 1.08, y: 1.08, image: productImageView)
        case "8":
            Animation.shared.animateImageSize(x: 1.11, y: 1.11, image: layerImageView)
            Animation.shared.animateImageSize(x: 1.11, y: 1.11, image: productImageView)
        case "9":
            Animation.shared.animateImageSize(x: 1.14, y: 1.14, image: layerImageView)
            Animation.shared.animateImageSize(x: 1.14, y: 1.14, image: productImageView)
        default:
            print("invalid")
        }
    }
}

//MARK: gradient
extension UIImage {
    func maskWithGradientColor(color: UIColor, value1: CGFloat, value2: CGFloat, value3: CGFloat, value4: CGFloat, value5: CGFloat, value6: CGFloat, alphaValueTop: CGFloat, alphaValueBottom: CGFloat) -> UIImage? {
        
        let maskImage = self.cgImage
        let width = self.size.width
        let height = self.size.height
        let bounds = CGRect(x: 0, y: 0, width: width, height: height)
        
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedLast.rawValue)
        let bitmapContext = CGContext(data: nil,
                                      width: Int(width),
                                      height: Int(height),
                                      bitsPerComponent: 8,
                                      bytesPerRow: 0,
                                      space: colorSpace,
                                      bitmapInfo: bitmapInfo.rawValue)
        
        let locations:[CGFloat] = [0.0, 1.0]
        let bottom = UIColor(red: value1, green: value2, blue: value3, alpha: 1).cgColor
        let top = UIColor(red: value4, green: value5, blue: value6, alpha: 0).cgColor
        let colors = [bottom, top] as CFArray
        let gradient = CGGradient(colorsSpace: colorSpace, colors: colors, locations: locations)
        let startPoint = CGPoint(x: width/2, y: 0)
        let endPoint = CGPoint(x: width/2, y: height)
        
        bitmapContext!.clip(to: bounds, mask: maskImage!)
        bitmapContext!.drawLinearGradient(gradient!, start: startPoint, end: endPoint, options: CGGradientDrawingOptions(rawValue: UInt32(0)))
        
        if let cImage = bitmapContext!.makeImage() {
            let coloredImage = UIImage(cgImage: cImage)
            return coloredImage
        }
        else  {
            return nil
        }
    }
}
