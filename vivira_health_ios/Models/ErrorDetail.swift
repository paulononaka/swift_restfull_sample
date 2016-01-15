import Foundation
import ObjectMapper

class ErrorDetail: Mappable {
    
    var detail: [String] = []
    var name: [String] = []
    var email: [String] = []
    var description: [String] = []
    
    required init?(_ map: Map){
    }
    
    init(){
    }
    
    func mapping(map: Map) {
        detail      <- map["detail"]
        name        <- map["name"]
        email       <- map["email"]
        description <- map["description"]
    }
    
    func errorMessage() -> String {
        
        for i in 0..<detail.count {
            detail[i] = "Detail \(detail[i])"
        }
        for i in 0..<name.count {
            name[i] = "Name \(name[i])"
        }
        for i in 0..<email.count {
            email[i] = "Email \(email[i])"
        }
        for i in 0..<description.count {
            description[i] = "Description \(description[i])"
        }
        
        var errors = Set(detail)
        errors = errors.union(name).union(email).union(description)
        let msg = errors.joinWithSeparator(", ")
        
        return msg.isEmpty ? "An error occurred. Please try again :(" : msg
    }
}