import Foundation
import Moya

enum BelarusbankAPI {
    case getAllBank
    case getGems
}

extension BelarusbankAPI: TargetType {
    var baseURL: URL {
        switch self {
        case .getAllBank:
            return URL(string: "https://belarusbank.by/api/atm?")!
        case .getGems:
            return URL(string: "https://belarusbank.by/api/getgems")!
        }
       
    }
    
    var path: String {
        switch self {
        case .getAllBank:
            return ""
        case .getGems:
            return ""
        }
    
    }
    
    var sampleData: Data {
       return Data()
    }
    
    var method: Moya.Method {
        switch self {
        case .getAllBank:
            return .get
        case .getGems:
            return .get
        }
    }
    
    var task: Moya.Task {
        guard let parameters else { return .requestPlain }
        
        return .requestParameters(parameters: parameters, encoding: enocding)
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    var parameters: [String: Any]? {
        var parameters = [String : Any]()
        
        switch self {
            case .getAllBank:
                parameters["ATM_currency"] = "BYN,USD,EUR"
            case .getGems:
                return nil
        }
        return parameters
    }
    
    var enocding: ParameterEncoding {
        switch self {
        case .getAllBank, .getGems:
            return URLEncoding.queryString
        }
    }
    
    
}
