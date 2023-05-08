//
//  Extension.swift
//  SET
//
//  Created by Kaushik Movaliya on 08/05/23.
//

import Foundation
import UIKit


extension UIApplication {
    
    public class func topViewController(_ base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        
        if let nav = base as? UINavigationController {
            return topViewController(nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(selected)
            }
        }
        if let presented = base?.presentedViewController {
            return topViewController(presented)
        }
        return base
    }
}


//MARK:- UIAlert View Methods -
extension UIViewController
{
    func displayAlert(title: String?, message: String?, buttonName: String = AlertTitleMessage.ok, completion: (()->())?)
    {
        let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let actionButton = UIAlertAction(title: buttonName, style: .cancel) { (action) in
            CommonMethods.stopProgressBar()
            completion?()
        }
        controller.addAction(actionButton)
        DispatchQueue.main.async {
            UIApplication.topViewController()?.present(controller, animated: true, completion: nil)
        }
    }
    
    func displayAlertWithAction(title: String?, message: String?, alertActions action: [UIAlertAction])
    {
        let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        action.forEach({ controller.addAction($0) })
        DispatchQueue.main.async {
            UIApplication.topViewController()?.present(controller, animated: true, completion: nil)
        }
    }
    
    func displayAlertWithActionWithColorTitle(title: String?, message: String?, alertActions action: [UIAlertAction], color : UIColor?)
    {
        let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        controller.setValue(NSAttributedString(string: title ?? "", attributes: [NSAttributedString.Key.foregroundColor : color!]), forKey: "attributedTitle")
        
        action.forEach({ controller.addAction($0) })
        DispatchQueue.main.async {
            UIApplication.topViewController()?.present(controller, animated: true, completion: nil)
        }
    }
}

extension UIView
{
    func roundedBottomCorners(radius: CGFloat)
    {
        DispatchQueue.main.async {
            let maskPath1 = UIBezierPath(roundedRect: self.bounds,
                                         byRoundingCorners: [.bottomRight , .bottomLeft],
                                         cornerRadii: CGSize(width: radius, height: radius))
            let maskLayer1 = CAShapeLayer()
            maskLayer1.frame = self.bounds
            maskLayer1.path = maskPath1.cgPath
            self.layer.mask = maskLayer1
        }
    }
    
    func roundedTopCorners(radius: CGFloat)
    {
        DispatchQueue.main.async {
            let maskPath1 = UIBezierPath(roundedRect: self.bounds,
                                         byRoundingCorners: [.topRight , .topLeft],
                                         cornerRadii: CGSize(width: radius, height: radius))
            let maskLayer1 = CAShapeLayer()
            maskLayer1.frame = self.bounds
            maskLayer1.path = maskPath1.cgPath
            self.layer.mask = maskLayer1
        }
    }
    
    func roundedAllCornerCorners(radius: CGFloat)
    {
        DispatchQueue.main.async {
            let maskPath1 = UIBezierPath(roundedRect: self.bounds,
                                         byRoundingCorners: [.topRight , .bottomRight , .topLeft , .bottomLeft],
                                         cornerRadii: CGSize(width: radius, height: radius))
            let maskLayer1 = CAShapeLayer()
            maskLayer1.frame = self.bounds
            maskLayer1.path = maskPath1.cgPath
            self.layer.mask = maskLayer1
        }
    }
    
    func shakeAnimation()
    {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.05
        animation.repeatCount = 4
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 10, y: self.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 10, y: self.center.y))

        self.layer.add(animation, forKey: "position")
    }
    
    
}

extension UITextField
{
    func setLeftRightPadding()
    {
        let width = 15
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: 0))
        self.leftView = paddingView
        self.leftViewMode = .always
        
        self.rightView = paddingView
        self.rightViewMode = .always
    }
    
    func setLeftPaddingOnly()
    {
        let width = 15
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: 0))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
    
    func setRightImage(imgName : String)
    {
        let paddingView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: Double(self.frame.size.height), height: Double(self.frame.size.height)))
        
        let imgView = UIImageView(frame: CGRect(x: 15, y: 15, width: 20, height: 20))
        imgView.center = paddingView.convert(paddingView.center, to: paddingView)
        imgView.image = UIImage(named: imgName)
        imgView.contentMode = .scaleAspectFit
        paddingView.addSubview(imgView)
        
        self.rightView = paddingView
        self.rightViewMode = .always
    }
    
    func setRightButton(btnRightView : UIButton)
    {
        let paddingView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: Double(self.frame.size.height), height: Double(self.frame.size.height)))
        
        btnRightView.frame = paddingView.bounds
        paddingView.addSubview(btnRightView)
        
        self.rightView = paddingView
        self.rightViewMode = .always
    }
    
    func textfieldAnimation()
    {
        let flash = CABasicAnimation(keyPath: "transform.scale")
        flash.duration = 0.0
        flash.fromValue = 1
        flash.toValue = 0.0
        flash.autoreverses = true
        flash.repeatCount = 0

        layer.add(flash, forKey: "animateOpacity")
    }
    
    func shakeTextFieldAnimation()
    {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.05
        animation.repeatCount = 4
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 10, y: self.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 10, y: self.center.y))

        self.layer.add(animation, forKey: "position")
    }
    
    func addPlaceholderWithAsterisk(strPlaceHolder : String)
    {
        let passwordAttriburedString = NSMutableAttributedString(string: strPlaceHolder)
        let asterix = NSAttributedString(string: "*", attributes: [.foregroundColor: UIColor.red])
        passwordAttriburedString.append(asterix)

        self.attributedPlaceholder = passwordAttriburedString
    }
}

extension String {
    func trim() -> String {
        return trimmingCharacters(in: CharacterSet.whitespaces)
    }

    func digitsOnly() -> String {
        let stringArray = self.components(separatedBy:CharacterSet.decimalDigits.inverted)
        .joined()
        return stringArray
    }

    func replaceMinutesToMin() -> String{
        return replacingOccurrences(of: "Minutes", with: "mins")
    }
    
    func removePercentageDollar() -> String
    {
        var strModified = self
        
        if strModified.contains("%")
        {
            strModified = strModified.replacingOccurrences(of: "%", with: "")
        }
        
        if strModified.contains("$")
        {
            strModified = strModified.replacingOccurrences(of: "$", with: "")
        }
        
        return strModified
    }
}

enum AlertTitleMessage
{
    static let appName = "AppName"
    static let success = "Success"
    static let ok = "OK"
    static let yes = "YES"
    static let no = "NO"
    static let cancel = "CANCEL"
    static let alert = "Alert!!"
    
}

// MARK:- StoryBoard Ids
enum Storyboard : String {
    
    case main = "Main"
    
    
    var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: nil)
    }
}


// MARK:- Messages
enum MessageConst
{
    static let serverError = "Sorry! Something went wrong. Please try again later."
    static let noInternetConnection = "The internet connection appears to be offline."
    
}
