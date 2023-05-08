//
//  ViewController.swift
//  SET
//
//  Created by Kaushik Movaliya on 08/05/23.
//

import UIKit
import Alamofire

class ViewController: UIViewController
{

    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}

extension ViewController
{
    func APICall()
    {
        CommonMethods.startProgressBar()
        
        let params: Parameters =
        [
            "param1": "data1",
            "param2": "data2"
            
        ]
     
        AlamoFireCommon.callWebServiceWithParameterToUploadMedia(methodName: "", withParameter: params,httpMethod: .post) { (response, success) in
              
              CommonMethods.stopProgressBar()
              if success
              {
                  var status = ""
                  if let code = response["status"] as? String
                  {
                      status = code
                  }
                  
                  if status == "true"
                  {
                    if let Documents = response["data"] as? [[String : Any]]
                    {
                       
                    }
                  }
                  else
                  {
                      if let str = response["message"] as? String
                      {
                          UIApplication.topViewController()?.displayAlert(title: "", message: str, completion: nil)
                      }
                      else
                      {
                          //UIApplication.topViewController()?.displayAlert(title: "", message: MessageConst.serverError, completion: nil)
                      }
                  }
              }
              else
              {
                  if let str = response["message"] as? String
                  {
                      UIApplication.topViewController()?.displayAlert(title: "", message: str, completion: nil)
                  }
                  else
                  {
                      //UIApplication.topViewController()?.displayAlert(title: "", message: MessageConst.serverError, completion: nil)
                  }
              }
          }
    
    }
}

