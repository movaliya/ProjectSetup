//
//  CommonMethods.swift
//  SET
//
//

import Foundation
import UIKit
import MBProgressHUD

class CommonMethods
{
    // MARK:- Validation
    class func isValidEmail(string: String) -> Bool
    {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: string)
    }
    
    
    class func isPasswordValid(string: String) -> Bool
    {
        let passwordRegEx = "(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z]).{8,}"
        let passwordTest = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
        return passwordTest.evaluate(with: string)
    }
    
    // MARK:- JSON read
    class func jsonToString(json:Any) -> String?
    {
        do {
            let data1 =  try JSONSerialization.data(withJSONObject: json, options: JSONSerialization.WritingOptions.prettyPrinted) // first of all convert json to the data
            let convertedString = String(data: data1, encoding: String.Encoding.utf8) // the data will be converted to the string
            return convertedString
            
        } catch let myJSONError {
            print(myJSONError)
            return nil
        }
    }
    
    class func StringToJson(string:String) -> [String:Any]?
    {
        do {
            if let json = string.data(using: .utf8)
            {
                if let jsonData = try JSONSerialization.jsonObject(with: json, options: .allowFragments) as? [String:Any]
                {
                    return jsonData
                }
            }
            return nil
        }
        catch let error as NSError {
            print(error)
            return nil
        }
    }
    
    // MARK:- HEX to UIColor
    class func hexStringToUIColor(hex:String) -> UIColor
    {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#"))
        {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6)
        {
            return .white
        }
        
        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    // MARK:- Start Stop Pregress
    
    class func startProgressBarOnWindow()
    {
        DispatchQueue.main.async {
            
            if #available(iOS 13.0, *)
            {
                if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
                {
                    if let sceneDelegate = windowScene.delegate as? SceneDelegate
                    {
                        let hud = MBProgressHUD.showAdded(to: sceneDelegate.window!, animated: true)
                        //hud.isSquare = false
                        hud.mode = MBProgressHUDMode.customView
                        hud.contentColor = UIColor.lightGray
                        hud.backgroundColor = UIColor.init(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 0.4)
                        hud.bezelView.color = UIColor.lightGray
                        hud.animationType = MBProgressHUDAnimation.zoomOut
                        
                        hud.label.text = "Loading"
                        hud.label.textColor = UIColor.white
                        hud.label.font = UIFont(name: "Arena Condensed Bold", size: 18)

                    }
                }
            } else {
                // Fallback on earlier versions
            }
        }
    }
    
    class func stopProgressBarOnWindow()
    {
        DispatchQueue.main.async {
            
            if #available(iOS 13.0, *) {
                if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
                {
                    if let sceneDelegate = windowScene.delegate as? SceneDelegate
                    {
                        MBProgressHUD.hide(for: sceneDelegate.window!, animated: true)
                    }
                }
            } else {
                // Fallback on earlier versions
            }
        }
    }
    
    class func startProgressBar(message : String? = "Loading...")
    {
        DispatchQueue.main.async {
            
            guard let view = UIApplication.topViewController()?.view else
            {
                return
            }
                    
            let hud = MBProgressHUD.showAdded(to: view, animated: true)
            //hud.isSquare = false
            hud.mode = MBProgressHUDMode.customView
            hud.contentColor = UIColor.lightGray
            hud.backgroundColor = UIColor.init(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 0.4)
            hud.bezelView.color = UIColor.lightGray
            hud.animationType = MBProgressHUDAnimation.zoomOut
            
            hud.label.text = message
            hud.label.textColor = UIColor.black
            hud.label.font = UIFont(name: "Arena Condensed Bold", size: 18)
        }
    }
    
    class func stopProgressBar()
    {
        DispatchQueue.main.async {
            
            guard let view = UIApplication.topViewController()?.view else {
                return
            }
            MBProgressHUD.hide(for: view, animated: true)
        }
    }
    
    // MARK:- show tost
    class func showToast(message : String, view : UIView)
    {

        let toastLabel = UILabel(frame: CGRect(x: view.frame.size.width/2 - 100, y: 150, width: 200, height: 35))
        toastLabel.backgroundColor = UIColor.white.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.black
        toastLabel.font = UIFont(name: "ArenaCondensed-Bold", size: 15)!
        toastLabel.textAlignment = .center;
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        view.addSubview(toastLabel)
        UIView.animate(withDuration: 5.0, delay: 0.1, options: .curveEaseOut, animations: {
             toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
    
    // MARK:- Set Border
    class func setBorderRadius(view : UIView, radius : Int, borderColor : UIColor, borderWidth : CGFloat)
    {
        view.layer.borderColor = borderColor.cgColor
        view.layer.borderWidth = borderWidth
        view.layer.cornerRadius = CGFloat(radius)
    }
    // MARK:- Set Border
    class func setBorderRadiusWithBackground(view : UIView, radius : Int, borderColor : UIColor, borderWidth : CGFloat,backgroundColor:UIColor)
    {
        view.layer.borderColor = borderColor.cgColor
        view.layer.borderWidth = borderWidth
        view.layer.cornerRadius = CGFloat(radius)
        view.backgroundColor = backgroundColor
        if radius == 0 {
            view.layer.cornerRadius = view.frame.size.width/2
        }
    }
    // MARK:- Set Shadow
    class func setDropShadow(view : UIView, radius : Int)
    {
        view.layer.shadowColor = UIColor.lightGray.cgColor
        view.layer.shadowOffset = CGSize.zero
        view.layer.shadowOpacity = 0.6
        view.layer.masksToBounds = false
        view.layer.cornerRadius = CGFloat(radius)
    }
    
    class func setDropShadowWithRadius(view : UIView, radius : Int)
    {
        view.layer.cornerRadius = CGFloat(radius)
        view.layer.shadowRadius = 7
        view.layer.shadowOpacity = 1.0
        view.layer.shadowOffset = CGSize.zero
        view.layer.shadowColor = UIColor.lightGray.cgColor
        view.layer.masksToBounds =  false
      //  view.clipsToBounds = true
    }
    
    class func imageWithColor(color : UIColor) -> UIImage
    {
        UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
        UIGraphicsGetCurrentContext()!.setFillColor(color.cgColor)
        UIGraphicsGetCurrentContext()!.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
        let colorImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return colorImage!;
    }
    
    // MARK: - get current timestamp
    class func getCurrentTimeStamp() -> String? {
        let timeStamp = Date().timeIntervalSince1970
        // NSTimeInterval is defined as double
        let timeStampObj = NSNumber(value: timeStamp)
        return "\(timeStampObj)"
    }
    
    class func getCurrentTimeStampInt() -> Int {
        let timeStamp = Date().timeIntervalSince1970
        // NSTimeInterval is defined as double
        let timeStampObj = NSNumber(value: timeStamp)
        return timeStampObj.intValue
    }
    
    class func getTimeStampofDate(format: String, dateStr: String) -> String?
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat=format
        let dateString = dateFormatter.date(from: dateStr)
        let dateTimeStamp  = dateString!.timeIntervalSince1970
        return "\(dateTimeStamp)"
    }
    
    class func getTimeStamptoDate(format: String, dateStr: Double) -> String?
    {
        let date = Date(timeIntervalSince1970: dateStr)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat=format
        let localDate = dateFormatter.string(from: date)
        return "\(localDate)"
        
    }
   
}

