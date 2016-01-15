import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper

class RestClient {
    
    static let URL = Constants.WS.URL
    
    class func getUsers(completionHandler: (result: Response<TOUsersList, NSError>) -> Void ){
        Alamofire.request(.GET, URL+Constants.WS.END_POINT.GET_USERS, parameters: nil)
            .responseObject() { (response: Response<TOUsersList, NSError>) in
                completionHandler(result: response)
        }
    }
    
    class func getUserDetail(idUser: Int, completionHandler: (result: Response<TOUser, NSError>) -> Void ){
        Alamofire.request(.GET, URL+Constants.WS.END_POINT.GET_USER+String(idUser), parameters: nil)
            .responseObject() { (response: Response<TOUser, NSError>) in
                completionHandler(result: response)
        }
    }
    
    class func putEditUser(userEdit: User, completionHandler: (result: Response<TOUser, NSError>) -> Void ){
        let parameters = [
            Constants.WS.FORM.USER_NAME: userEdit.name,
            Constants.WS.FORM.USER_EMAIL: userEdit.email,
            Constants.WS.FORM.USER_DESCRIPTION: userEdit.description
        ]
        Alamofire.request(.PUT, URL+Constants.WS.END_POINT.EDIT_USER+String(userEdit.id), parameters: parameters)
            .responseObject() { (response: Response<TOUser, NSError>) in
                completionHandler(result: response)
        }
    }
    
    class func deleteUser(idUser: Int, completionHandler: (result: Response<TOUser, NSError>) -> Void ){
        Alamofire.request(.DELETE, URL+Constants.WS.END_POINT.DEL_USER+String(idUser), parameters: nil)
            .responseObject() { (response: Response<TOUser, NSError>) in
                completionHandler(result: response)
        }
    }
}