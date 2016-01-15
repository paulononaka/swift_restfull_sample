import Foundation
import ObjectMapper

class User: Mappable {
    
    var id: Int! = 0
    var name: String! = ""
    var photo_url: String! = ""
    var email: String! = ""
    var description: String! = ""
    
    required init?(_ map: Map){
    }
    
    init(){
    }
    
    func mapping(map: Map) {
        id           <- map["id"]
        name         <- map["name"]
        photo_url    <- map["photo_url"]
        email        <- map["email"]
        description  <- map["description"]
    }
}
