import Foundation
import ObjectMapper

class TOUser: Mappable {
    
    var user: User?
    var error: ErrorDetail?
    
    required init?(_ map: Map){
    }
    
    init(){
    }
    
    func mapping(map: Map) {
        user   <- map["user"]
        error  <- map["errors"]
    }
    
}
