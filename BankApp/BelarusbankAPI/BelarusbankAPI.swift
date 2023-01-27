import Foundation
import Moya

enum BelarusbankAPI {
    case getAllBank
    case getFillials
    case getGems
    case getMetal
    case getNews
}

extension BelarusbankAPI: TargetType {
    var baseURL: URL {
        switch self {
        case .getAllBank, .getGems, .getMetal, .getNews, .getFillials:
            return URL(string: "https://belarusbank.by/api")!
        }
        
        
    }
    
    var path: String {
        switch self {
        case .getAllBank:
            return "atm"
        case .getGems:
            return "getgems"
        case .getMetal:
            return "getinfodrall"
        case .getNews:
            return "news_info"
        case .getFillials:
            return "filials_info"
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
        case .getFillials:
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
        case .getFillials:
            return nil
        }
        return parameters
    }
    
    var enocding: ParameterEncoding {
        switch self {
        case .getAllBank, .getGems, .getMetal, .getNews, .getFillials:
            return URLEncoding.queryString
            
        }
        
        
    }
}
