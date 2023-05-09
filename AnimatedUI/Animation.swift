//
//  Animation.swift
//  AnimatedUI
//
//  Created by iPHTech 15 on 09/05/23.
//

import Foundation
import UIKit

class Animation{
    static let shared = Animation()
    
    func animateImageSize(x: CGFloat, y: CGFloat, image: UIImageView){
        UIView.animate(withDuration: 1.0, animations: {() -> Void in
            image.transform = CGAffineTransform(scaleX: x, y: y)
        })
    }
    
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
    
    func changeBlue(imageView: UIImageView){
        UIView.transition(with: imageView,
                          duration: 1.0,
                          options: .transitionCrossDissolve,
                          animations: {
            //let originalImage = self.layerImageView?.image
            //let tintedImage = originalImage?.withRenderingMode(.alwaysTemplate)
            //self.layerImageView.image = tintedImage
            let myImage2 = UIImage(named: "layer")
            imageView.image = myImage2!.maskWithGradientColor(color: UIColor.blue, value1: 0, value2: 0, value3: 1, value4: 0, value5: 0, value6: 1, alphaValueTop: 1, alphaValueBottom: 0)},
                          completion: nil)
    }
    
    func changeRed(imageView: UIImageView){
        UIView.transition(with: imageView,
                          duration: 1.0,
                          options: .transitionCrossDissolve,
                          animations: {
            let originalImage = imageView.image
       let tintedImage = originalImage?.withRenderingMode(.alwaysTemplate)
            imageView.image = tintedImage
           // self.layerImageView.tintColor = UIColor(red: 1, green: 0, blue: 0, alpha: 0.5)
            let myImage2 = UIImage(named: "layer")
            imageView.image = myImage2!.maskWithGradientColor(color: UIColor.red, value1:1 , value2: 0, value3: 0, value4: 1, value5: 1, value6: 1, alphaValueTop: 0, alphaValueBottom: 1)
        },
                          completion: nil)
        
    }
    
    func changeGreen(imageView: UIImageView){
        
        UIView.transition(with: imageView,
                          duration: 1.0,
                          options: .transitionCrossDissolve,
                          animations: {
            let originalImage = imageView.image
       let tintedImage = originalImage?.withRenderingMode(.alwaysTemplate)
            imageView.image = tintedImage
       //self.layerImageView.tintColor = UIColor(red: 225, green: 165, blue: 0, alpha: 0.5)
            let myImage2 = UIImage(named: "layer")
            imageView.image = myImage2!.maskWithGradientColor(color: UIColor.orange, value1: 0, value2: 1, value3: 0, value4: 1, value5: 0, value6: 0, alphaValueTop: 0, alphaValueBottom: 1)
        },
                          completion: nil)
    }
    func changeBlack(imageView: UIImageView){
        
        UIView.transition(with: imageView,
                          duration: 1.0,
                          options: .transitionCrossDissolve,
                          animations: {
            let originalImage = imageView.image
       let tintedImage = originalImage?.withRenderingMode(.alwaysTemplate)
            imageView.image = tintedImage
            //self.layerImageView.tintColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
            let myImage2 = UIImage(named: "layer")
            imageView.image = myImage2!.maskWithGradientColor(color: UIColor.black, value1: 0, value2: 0, value3: 0, value4: 0, value5: 0, value6: 0, alphaValueTop: 0, alphaValueBottom: 1)
        },
                          completion: nil)
        
    }
    
    func changeWhite(imageView: UIImageView){
       
        UIView.transition(with: imageView,
                          duration: 1.0,
                          options: .transitionCrossDissolve,
                          animations: {
            let originalImage = imageView.image
       let tintedImage = originalImage?.withRenderingMode(.alwaysTemplate)
            imageView.image = tintedImage
            imageView.tintColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.5) },
                          completion: nil)
    }
}



/*
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
              detailView.layer.add(animate, forKey: "shake")
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
          detailButton.layer.add(animation, forKey: "basic")
          
      })
  }*/
