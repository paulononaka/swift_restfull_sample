import UIKit

struct Constants {
    struct WS {
        static let HOST = "vivira-paulo-nonaka.herokuapp.com"
        static let URL = "https://"+HOST
        struct END_POINT {
            static let GET_USERS   = "/api/users"
            static let GET_USER    = "/api/users/"
            static let EDIT_USER   = "/api/users/"
            static let CREATE_USER = "/api/users/"
            static let DEL_USER    = "/api/users/"
        }
    }
    struct ColorsHex {
        static let NAVIGATOR = "#485BBD"
    }
}