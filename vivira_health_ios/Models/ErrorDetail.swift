import Foundation
import ObjectMapper

class ErrorDetail: Mappable {
    
    var detail: String! = ""
    var name: String! = ""
    var email: String! = ""
    var description: String! = ""
    
    required init?(_ map: Map){
    }
    
    init(){
    }
    
    func mapping(map: Map) {
        detail <- map["detail"]
    }
}