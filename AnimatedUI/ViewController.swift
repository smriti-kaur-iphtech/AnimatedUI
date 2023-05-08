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
    @IBOutlet weak var circularImageView: UIImageView!
    
    
    let animator = UIViewPropertyAnimator(duration: 1.0, curve: .linear)
    let size = ["6","7","8","9"]
    private let dashHeight: CGFloat = 1.0//2.0
    private let dashWidth: CGFloat = 99.0//95.0//80.0//50.0
   // private let numberFont = UIFont.systemFont(ofSize: 40)
    private let numberFont = UIFont.boldSystemFont(ofSize: 38)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        sizePickerView.dataSource = self
        sizePickerView.delegate = self
        let screenSize: CGRect = UIScreen.main.bounds
        print(screenSize)
        print(detailView.bounds.width)
        print(detailView.bounds.height)
        

    }
    
    @IBAction func detailButtonAction(_ sender: UIButton) {
        detailView.isHidden = false
        //animate(from: 393, to: 300)
        circleAnim(detailView, duration: 1.0)
        
        
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
        
        
        circularImageView.layer.cornerRadius = circularImageView.layer.bounds.width / 2
        
        
        
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
        cartButton.layer.cornerRadius = 20.0 //Ht/2
        cartButton.layer.borderWidth = 2
        cartButton.layer.borderColor = UIColor.white.cgColor
        cartButton.titleLabel?.font = .systemFont(ofSize: 15)
        self.cartButton.frame.size.height = 100
        
        closeButton.layer.shadowColor = UIColor.black.cgColor
        closeButton.layer.shadowOpacity = 0.2
        closeButton.layer.shadowOffset = CGSize(width: 2, height: 2)
        closeButton.layer.shadowRadius = 4.0
        closeButton.layer.masksToBounds = false
  
        cartButton.addTarget(self, action: #selector(heldDown), for: .touchDown)
    
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
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        view.addGestureRecognizer(tapGesture)
    }
    
    func animate(from: Any, to: Any){
        UIView.animate(withDuration: 0.2, animations: {
            let animation = CABasicAnimation()
            animation.keyPath = "position.x"
            animation.fromValue = from//393
            animation.toValue = to//300
            animation.duration = 1
            self.detailView.layer.add(animation, forKey: "basic")
            //self.detailButton.layer.add(animation, forKey: "basic")
        },completion: { done in
            if done{
                let animate = CAKeyframeAnimation()
                animate.keyPath = "position.x"
                animate.values = [0,2,-2,2,0]
                animate.keyTimes = [0,0.16,0.5,0.83,1]
                animate.duration = 2
                animate.isAdditive = true
                self.detailView.layer.add(animate, forKey: "shake")
                //self.detailButton.layer.add(animate, forKey: "shake")
                
            }
        })
    }
    
    func animateButton(){
        UIView.animate(withDuration: 0.2, animations: {
            let animation = CABasicAnimation()
            animation.keyPath = "position.x"
            animation.fromValue = 393
            animation.toValue = 300
            animation.duration = 1
            self.detailButton.layer.add(animation, forKey: "basic")
            
        })
    }
    
                       

    func animateImageSize(x: CGFloat, y: CGFloat, image: UIImageView){
        UIView.animate(withDuration: 1.0, animations: {() -> Void in
            image.transform = CGAffineTransform(scaleX: x, y: y)
        })
    }
    
    
    //MARK: Functions for changing the color of specific part of image.
    @objc func changeColorToRed(_ sender:UITapGestureRecognizer){
        UIView.transition(with: layerImageView,
                          duration: 1.0,
                          options: .transitionCrossDissolve,
                          animations: {
            let originalImage = self.layerImageView?.image
       let tintedImage = originalImage?.withRenderingMode(.alwaysTemplate)
            self.layerImageView.image = tintedImage
           // self.layerImageView.tintColor = UIColor(red: 1, green: 0, blue: 0, alpha: 0.5)
            let myImage2 = UIImage(named: "layer")
            self.layerImageView.image = myImage2!.maskWithGradientColor(color: UIColor.red, value1:1 , value2: 0, value3: 0, value4: 1, value5: 1, value6: 1, alphaValueTop: 0, alphaValueBottom: 1)
        },
                          completion: nil)
        
    }
    
    @objc func changeColorToBlue(_ sender:UITapGestureRecognizer){
       
       /* UIView.transition(with: productImageView,
                          duration: 1.0,
                          options: .transitionCrossDissolve,
                          animations: { self.productImageView.image = UIImage(named: "blueNikeShoes") },
                          completion: nil)*/
        
        UIView.transition(with: layerImageView,
                          duration: 1.0,
                          options: .transitionCrossDissolve,
                          animations: {
            //let originalImage = self.layerImageView?.image
            //let tintedImage = originalImage?.withRenderingMode(.alwaysTemplate)
            //self.layerImageView.image = tintedImage
            let myImage2 = UIImage(named: "layer")
            self.layerImageView.image = myImage2!.maskWithGradientColor(color: UIColor.blue, value1: 0, value2: 0, value3: 1, value4: 0, value5: 0, value6: 1, alphaValueTop: 1, alphaValueBottom: 0)},
                          completion: nil)
    }
    
    @objc func changeColorToGreen(_ sender:UITapGestureRecognizer){
        
        /*UIView.transition(with: productImageView,
                          duration: 1.0,
                          options: .transitionCrossDissolve,
                          animations: { self.productImageView.image = UIImage(named: "orangeNikeShoes") },
                          completion: nil)*/
        UIView.transition(with: layerImageView,
                          duration: 1.0,
                          options: .transitionCrossDissolve,
                          animations: {
            let originalImage = self.layerImageView?.image
       let tintedImage = originalImage?.withRenderingMode(.alwaysTemplate)
            self.layerImageView.image = tintedImage
       //self.layerImageView.tintColor = UIColor(red: 225, green: 165, blue: 0, alpha: 0.5)
            let myImage2 = UIImage(named: "layer")
            self.layerImageView.image = myImage2!.maskWithGradientColor(color: UIColor.orange, value1: 0, value2: 1, value3: 0, value4: 1, value5: 0, value6: 0, alphaValueTop: 0, alphaValueBottom: 1)
        },
                          completion: nil)
    }
    
    @objc func changeColorToBlack(_ sender:UITapGestureRecognizer){
        
        /*UIView.transition(with: productImageView,
                          duration: 1.0,
                          options: .transitionCrossDissolve,
                          animations: { self.productImageView.image = UIImage(named: "blackNike") },
                          completion: nil)*/
        UIView.transition(with: layerImageView,
                          duration: 1.0,
                          options: .transitionCrossDissolve,
                          animations: {
            let originalImage = self.layerImageView?.image
       let tintedImage = originalImage?.withRenderingMode(.alwaysTemplate)
            self.layerImageView.image = tintedImage
            //self.layerImageView.tintColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
            let myImage2 = UIImage(named: "layer")
            self.layerImageView.image = myImage2!.maskWithGradientColor(color: UIColor.black, value1: 0, value2: 0, value3: 0, value4: 0, value5: 0, value6: 0, alphaValueTop: 0, alphaValueBottom: 1)
        },
                          completion: nil)
    }
    
    @objc func changeColorToWhite(_ sender:UITapGestureRecognizer){
       
       /* UIView.transition(with: productImageView,
                          duration: 1.0,
                          options: .transitionCrossDissolve,
                          animations: { self.productImageView.image = UIImage(named: "whiteNike") },
                          completion: nil)*/
        UIView.transition(with: layerImageView,
                          duration: 1.0,
                          options: .transitionCrossDissolve,
                          animations: {
            let originalImage = self.layerImageView?.image
       let tintedImage = originalImage?.withRenderingMode(.alwaysTemplate)
            self.layerImageView.image = tintedImage
       self.layerImageView.tintColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.5) },
                          completion: nil)
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
    //added
    func circleAnim(_ view: UIView, duration: CFTimeInterval) {
        let maskDiameter = CGFloat(sqrtf(powf(Float(view.bounds.width), 2) + powf(Float(view.bounds.height), 2)))
        print(maskDiameter) //893
        let mask = CAShapeLayer()
        let animationId = "path"

        // Make a circular shape.
        mask.path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: maskDiameter, height: maskDiameter), cornerRadius: maskDiameter / 2).cgPath

        mask.position = CGPoint(x: (view.bounds.width - maskDiameter) / 2, y: (view.bounds.height - maskDiameter) / 2)
        //MARK: 2ND OPTION
        //mask.position = CGPoint(x: -300, y: -25)
        
        //CGPoint(x: (view.bounds.width)/maskDiameter-170, y: (view.bounds.height)/maskDiameter+80)
        // Add as a mask to the parent layer.
        view.layer.mask = mask
        

        // Animate.
        let animation = CABasicAnimation(keyPath: animationId)
        animation.duration = duration
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = true

        // Create a new path.
        let newPath = UIBezierPath(roundedRect: CGRect(x: maskDiameter / 2, y: maskDiameter / 2, width: 0, height: 0), cornerRadius: 0).cgPath

        // Set start and end values.
        animation.fromValue = newPath //mask.path
        animation.toValue = mask.path //newPath


        // Start the animation.
        mask.add(animation, forKey: animationId)
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
        
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 210, height: 30)) //200//120 //30
        
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
        
        let numberLabel = UILabel(frame: CGRect(x: dashWidth + 10, y: 0, width: 70, height: containerView.frame.height)) //x: dashWidth + 10//80
        numberLabel.textAlignment = .center
        numberLabel.textColor = .white
        numberLabel.font = numberFont
        //numberLabel.font = UIFont.boldSystemFont(ofSize: 40)
        numberLabel.text = "\(size[row])"
        
        //added
        if(sizePickerView.selectedRow(inComponent: 0) == row){
            numberLabel.font = UIFont.systemFont(ofSize: 40)
                    }
        containerView.addSubview(numberLabel)
        
        return containerView
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(size[row])
        let sizeSelected = size[row]
        switch sizeSelected{
            
        case "6":
            animateImageSize(x: 1.1, y: 1.1, image: layerImageView)
            animateImageSize(x: 1.1, y: 1.1, image: productImageView)
           
        case "7":
            animateImageSize(x: 1.13, y: 1.13, image: layerImageView)
            animateImageSize(x: 1.13, y: 1.13, image: productImageView)
        case "8":
            animateImageSize(x: 1.16, y: 1.16, image: layerImageView)
            animateImageSize(x: 1.16, y: 1.16, image: productImageView)
        case "9":
            animateImageSize(x: 1.19, y: 1.19, image: layerImageView)
            animateImageSize(x: 1.19, y: 1.19, image: productImageView)
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
        //let colors = [top, bottom] as CFArray
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
