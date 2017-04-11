import Foundation

public enum ImageMode {
    
    case m0
    case m1
    case m2
    case m3
    case m4
    case m5
    
    public func imageModeString(w: Int? = nil , h: Int? = nil) -> String {
        
        let m: UInt = {
            switch self {
            case .m0: return 0
            case .m1: return 1
            case .m2: return 2
            case .m3: return 3
            case .m4: return 4
            case .m5: return 5
            }
        }()
        
        let width: String = {
            if let wStr = w, wStr > 0 {
                return "/w/\(wStr)"
            } else {
                return ""
            }
        }()
        
        let height: String = {
            if let hStr = h, hStr > 0 {
                return "/h/\(hStr)"
            } else {
                return ""
            }
        }()
        
        guard !(width.isEmpty && height.isEmpty) else { return "" }
        
        return "/\(m)\(width)\(height)"
    }
}
