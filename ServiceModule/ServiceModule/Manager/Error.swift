

import Foundation

class ServiceError {
    var httpStatusCode: Int?
    var message: String?
    var _json: JSON?
    init() {
    
    }
    
    init(json: JSON?, httpStatusCode: Int?) {
        if let jsonObj = json {
            _json = jsonObj
            self.message = jsonObj["error_message"].exists() ? jsonObj["error_message"].stringValue :
                (jsonObj["message"].exists() ? jsonObj["message"].stringValue : "UNKNOWN_ERROR")
        }
        self.httpStatusCode = httpStatusCode
    }
    
    init(messageStr: String, httpStatusCode: Int?) {
        self.message = messageStr
        self.httpStatusCode = httpStatusCode
    }
    
    func getPrameters_fieldName() -> String {
        if let subjs = _json?["parameters"] {
            if let  fieldName = subjs["fieldName"].string {
                return fieldName
            }
        }
        return ""
    }
}
