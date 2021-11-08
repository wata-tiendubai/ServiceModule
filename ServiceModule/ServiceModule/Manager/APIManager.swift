

import Foundation
import Alamofire

struct APIManager {
    
    static var canLoadMore = false
    
    typealias CompletionHandler = (_ success:Bool) -> Void
    func buildCommonHeader() -> [String:String] {
        
        var  headers = [String:String]()
        
        headers["Content-Type"] = "application/json"
        headers["Authorization"] = ""
  
        
        return headers
    }
    
    static func callBasePost(url: String, parameter: [String:Any], method:HTTPMethod, completionHandler:@escaping(JSON,_ statusCode: Int)->Void){

        let headers:HTTPHeaders = [
            "Content-Type": "application/json",
            "access_token":  ""
        ]

        let url = String(format: url)
        Alamofire.Session.default.request(url, method: method ,parameters: parameter, encoding: JSONEncoding.default, headers:headers).responseJSON{ response in switch response.result {
        case .success(let json):
            let data = JSON(json)
            let statusCode = response.response?.statusCode
            if statusCode == 200 {
                let jsonData = data["data"]

                completionHandler(jsonData,statusCode!)
            }else if statusCode == 401{

                BaseToast.shareIntanse.showToast(message: "User not found")

            }else if statusCode ?? 0 >= 500{
                BaseToast.shareIntanse.showToast(message: "Server is maintain")
            }
        case .failure(let error):
            let statusCode = response.response?.statusCode
            if statusCode ?? 0 >= 500{

            }else if error._code == NSURLErrorTimedOut{
                BaseToast.shareIntanse.showToast(message: "Timeout")
            }else if error._code == NSURLErrorNetworkConnectionLost{

            }
            }
        }
        
        
        
        
    }
    
    
    
    
    
}
