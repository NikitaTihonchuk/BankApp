import Foundation
import Moya

enum BelarusbankAPI {
    case getAllBank
    case getGems
    case getMetal
    case getNews
}

extension BelarusbankAPI: TargetType {
    var baseURL: URL {
        switch self {
        case .getAllBank:
            return URL(string: "https://belarusbank.by/api/atm?")!
        case .getGems:
            return URL(string: "https://belarusbank.by/api/getgems")!
        case .getMetal:
            return URL(string: "https://belarusbank.by/api/getinfodrall")!
        case .getNews:
            return URL(string: "https://belarusbank.by/api/news_info")!
        }
        
        
    }
    
    var path: String {
        switch self {
        case .getAllBank:
            return ""
        case .getGems:
            return ""
        case .getMetal:
            return ""
        case .getNews:
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
        case .getMetal:
            return .get
        case .getNews:
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
        case .getMetal:
            return nil
        case .getNews:
            parameters["lang"] = "ru"
        }
        return parameters
    }
    
    var enocding: ParameterEncoding {
        switch self {
        case .getAllBank, .getGems, .getMetal, .getNews:
            return URLEncoding.queryString
            
        }
        
        
    }
}
