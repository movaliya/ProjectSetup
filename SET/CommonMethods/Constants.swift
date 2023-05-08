//
//  Constants.swift
//  iPOS
//
//  Created by Devang Bhatt on 24/03/20.
//  Copyright © 2020 Devang Bhatt. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

// MARK:- Const variables
let sharedAppDelegate = UIApplication.shared.delegate as! AppDelegate
let sceneAppDelegate = UIApplication.shared.delegate as! AppDelegate
let DocumentPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
var navigationControllerForMagTekPayment : UINavigationController!


// MARK:- ScreenSize
struct ScreenSize
{
    static let SCREEN_WIDTH = UIScreen.main.bounds.size.width
    static let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
    static let SCREEN_MAX_LENGTH = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    static let SCREEN_MIN_LENGTH = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
}

// MARK:- DeviceType
struct DeviceType
{
    static let IS_IPHONE = UIDevice.current.userInterfaceIdiom == .phone
    static let IS_IPHONE_4_OR_LESS = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH < 568.0
    static let IS_IPHONE_5 = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 568.0
    static let IS_IPHONE_6_7_8 = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 667.0
    static let IS_IPHONE_6P_7P_8P = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 736.0
    static let IS_IPADSMALL = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.SCREEN_MAX_LENGTH < 1024.0

    static let IS_IPAD = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.SCREEN_MAX_LENGTH == 1024.0
    static let IS_IPAD_PRO_9_7 = IS_IPAD
    static let IS_IPAD_PRO_12_9 = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.SCREEN_MAX_LENGTH == 1366.0
    static let IS_TV = UIDevice.current.userInterfaceIdiom == .tv
    static let IS_CAR_PLAY = UIDevice.current.userInterfaceIdiom == .carPlay
}



// MARK:- API URL
struct APIURL
{
    static let MAINHOSTURL : String = "https://www"
   
    
    static let apiCategories : String = "lastpath.php"
    
}



