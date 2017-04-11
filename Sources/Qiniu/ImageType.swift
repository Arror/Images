import Foundation
import CaseInsensitiveString

public enum ImageType {
    
    case `default`
    
    case psd
    case jpeg
    case png
    case gif
    case webp
    case tiff
    case bmp
    
    public init(code: String) {
        switch CaseInsensitiveString(code) {
        case "psd":     self = .psd
        case "jpeg":    self = .jpeg
        case "png":     self = .png
        case "gif":     self = .gif
        case "webp":    self = .webp
        case "tiff":    self = .tiff
        case "bmp":     self = .bmp
        default:        self = .default
        }
    }
    
    var code: String {
        switch self {
        case .psd:      return "psd"
        case .jpeg:     return "jpeg"
        case .png:      return "png"
        case .gif:      return "gif"
        case .webp:     return "webp"
        case .tiff:     return "tiff"
        case .bmp:      return "bmp"
        case .default:  return ""
        }
    }
    
    var imageTypeString: String {
        switch self {
        case .default:
            return ""
        case let type:
            return "/format/\(type.code)"
        }
    }
}
