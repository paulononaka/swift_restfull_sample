import Foundation
import ObjectMapper

class TOUsersList: Mappable {
    
    var users: [User] = []
    var error: ErrorDetail?
    
    required init?(_ map: Map){
    }
    
    init(){
    }
    
    func mapping(map: Map) {
        users <- map["users"]
        error <- map["errors"]
    }
}
