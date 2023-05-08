
//
//

import Foundation
import SwiftyJSON
import Alamofire
class AlamoFireCommon:  NSObject
{
    class func callWebServiceWithParameterPostPut(methodName: String, withParameter parameters: Parameters, httpMethod: HTTPMethod, completion: @escaping ((_ respose: [String: AnyObject],_ success: Bool) -> Void ))
    {
        let headers: HTTPHeaders = ["Content-Type" : "application/json; charset=utf-8"]
        
        var strURL = ""
        strURL = APIURL.MAINHOSTURL + methodName
        strURL = strURL.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!

        print("API: \(strURL)")
        print("Parameters: \(parameters)")
        
       
        AF.request(strURL, method: httpMethod, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
           
            switch response.result {
                
            case .success( _):
                //to get JSON return value
                if let result = response.value {
                    if let JSON = result as? NSDictionary {
                        print("\(methodName) = \(JSON)")
                        completion(JSON as! [String : AnyObject], true)
                    }
                }
                break
                
            case .failure(let encodingError ):
                
                print("Error = \(encodingError)")
                let temp = NSDictionary.init(object: encodingError.localizedDescription, forKey: "message" as NSCopying)
                completion(temp as! [String : AnyObject], false)
                break
            }
        }
    }
    
    class func callWebServiceWithoutParameterGet(methodName: String, completion: @escaping ((_ respose: [String: AnyObject],_ success: Bool) -> Void ))
    {
        let headers: HTTPHeaders = ["Content-Type" : "application/json"]
        
        var strURL = ""
        strURL = APIURL.MAINHOSTURL + methodName

        strURL = strURL.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!

        
        print("API: \(strURL)")
        
        AF.request(strURL, method: .get, encoding: URLEncoding.httpBody, headers: headers).responseJSON { response in
            
            switch response.result {
                
            case .success( _):
                //to get JSON return value
                if let result = response.value {
                    let JSON = result as! NSDictionary
                    print("\(methodName) = \(JSON)")
                    completion(JSON as! [String : AnyObject], true)
                }
                break
                    
            case .failure(let encodingError ):
                
                print("Error = \(encodingError)")
                let temp = NSDictionary.init(object: encodingError.localizedDescription, forKey: "message" as NSCopying)
                completion(temp as! [String : AnyObject], false)
                break
            }
        }
    }
    
    class func callWebServiceWithParameterGet(methodName: String, withParameter parameters: Parameters, completion: @escaping ((_ respose: [String: AnyObject],_ success: Bool) -> Void ))
    {
        let headers: HTTPHeaders = ["Content-Type" : "application/json"]
        
        var strURL = ""
        strURL = APIURL.MAINHOSTURL + methodName

        
        for (index,value) in parameters.enumerated()
        {
            if index == 0
            {
                strURL = "\(strURL)?\(value.key)=\(value.value)"
            }
            else
            {
                strURL = "\(strURL)&\(value.key)=\(value.value)"
            }
        }
        strURL = strURL.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!


        print("API: \(strURL)")
        print("Parameters: \(parameters)")
        
        AF.request(strURL, method: .get, encoding: URLEncoding.httpBody, headers: headers).responseJSON { (response) in
            
            switch response.result {
            
            case .success( _):
                //to get JSON return value
                if let result = response.value {
                    let JSON = result as! NSDictionary
                    print("\(methodName) = \(JSON)")
                    completion(JSON as! [String : AnyObject], true)
                }
                break
                
            case .failure(let encodingError ):
                
                print("Error = \(encodingError)")
                let temp = NSDictionary.init(object: encodingError.localizedDescription, forKey: "message" as NSCopying)
                completion(temp as! [String : AnyObject], false)
                break
            }
        }
    }
    
    class func callWebServiceWithoutParameterDelete(methodName: String, completion: @escaping ((_ respose: [String: AnyObject],_ success: Bool) -> Void ))
    {
        let headers: HTTPHeaders = ["Content-Type" : "application/json"]
        
        var strURL = ""
        strURL = APIURL.MAINHOSTURL + methodName

        strURL = strURL.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!

        
        print("API: \(strURL)")
        
        AF.request(strURL, method: .delete, encoding: URLEncoding.httpBody, headers: headers).responseJSON { response in
            
            switch response.result {
                
            case .success( _):
                //to get JSON return value
                if let result = response.value {
                    let JSON = result as! NSDictionary
                    print("\(methodName) = \(JSON)")
                    completion(JSON as! [String : AnyObject], true)
                }
                break
                    
            case .failure(let encodingError ):
                
                print("Error = \(encodingError)")
                let temp = NSDictionary.init(object: encodingError.localizedDescription, forKey: "message" as NSCopying)
                completion(temp as! [String : AnyObject], false)
                break
            }
        }
    }
    
    class func callWebServiceWithParameterDelete(methodName: String, withParameter parameters: Parameters, completion: @escaping ((_ respose: [String: AnyObject],_ success: Bool) -> Void ))
    {
        let headers: HTTPHeaders = ["Content-Type" : "application/json"]
        
        var strURL = ""
        strURL = APIURL.MAINHOSTURL + methodName

        strURL = strURL.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!

        print("API: \(strURL)")
        print("Parameters: \(parameters)")
        
        AF.request(strURL, method: .delete, parameters: parameters, encoding: JSONEncoding.prettyPrinted, headers: headers).responseJSON { (response) in
            
            switch response.result {
                
            case .success( _):
                //to get JSON return value
                if let result = response.value {
                    let JSON = result as! NSDictionary
                    print("\(methodName) = \(JSON)")
                    completion(JSON as! [String : AnyObject], true)
                }
                break
                
            case .failure(let encodingError ):
                
                print("Error = \(encodingError)")
                let temp = NSDictionary.init(object: encodingError.localizedDescription, forKey: "message" as NSCopying)
                completion(temp as! [String : AnyObject], false)
                break
            }
        }
    }
    
    class func callWebServiceWithParameterToUploadMedia(methodName: String, withParameter parameters: Parameters, httpMethod: HTTPMethod, completion: @escaping ((_ respose: [String: AnyObject],_ success: Bool) -> Void ))
    {
        let headers: HTTPHeaders = ["Content-Type" : "application/json"]
        
        var strURL = ""
        
        strURL = APIURL.MAINHOSTURL + methodName

        strURL = strURL.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!

        print("API: \(strURL)")
        print("Parameters: \(parameters)")
        
        AF.upload(multipartFormData: { multipartFormData in
            //multipartFormData.append(mediaData, withName: mediaName , fileName: "file.jpeg", mimeType: "image/jpeg")
            if parameters.count > 0
            {
                for (key, value) in parameters
                {
                    if let data = ((value as AnyObject) as? [[String:Any]])
                    {
                        let arrData =  try! JSONSerialization.data(withJSONObject: data, options: .prettyPrinted)
                        multipartFormData.append(arrData, withName: key as String)
                    }
                    else if let data = ((value as AnyObject) as? [Any])
                    {
                        //multipartFormData.append(data.description.data(using: String.Encoding.utf8)!, withName: key)

                        let arrData =  try! JSONSerialization.data(withJSONObject: data, options: .prettyPrinted)
                        multipartFormData.append(arrData, withName: key as String)

                        //multipartFormData.append(arrData.description.data(using: String.Encoding.utf8)!, withName: key as String)

                    }
                    else
                    {
                        multipartFormData.append("\(value)".data(using: String.Encoding.utf8)!, withName: key as String)
                    }
                }
            }
        }, to: strURL, method: httpMethod , headers: headers) .response { (response) in
            
            switch response.result {
               
            case .success( _):
                //to get JSON return value
                if let data = response.value {
                    if data != nil {
                        do {
                            let dicFromData = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                            
                            if let JSON = dicFromData as? [String: AnyObject] {
                                print("\(methodName) = \(JSON)")
                                completion(JSON, true)
                            }
                        } catch{
                            print(error)
                            let temp = NSDictionary.init(object: error.localizedDescription, forKey: "message" as NSCopying)
                            completion(temp as! [String : AnyObject], false)
                        }
                    }
                }
                break
                
            case .failure(let encodingError ):
                
                print("Error = \(encodingError)")
                let temp = NSDictionary.init(object: encodingError.localizedDescription, forKey: "message" as NSCopying)
                completion(temp as! [String : AnyObject], false)
                break
            }
        }
    }
}


