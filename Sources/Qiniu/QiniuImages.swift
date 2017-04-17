import Foundation

public enum ImageQuality {
    
    case lower
    case normal
}

public final class QiniuImages {
    
    private init() {}
    
    public static let shared = QiniuImages()
    
    public private(set) var imageQuality: ImageQuality = .normal
    
    public func setImageQuality(_ quality: ImageQuality) {
        
        self.imageQuality = quality
    }
    
    func makeImageURLIterator(url: String, size: CGSize? = nil) -> AnyIterator<URL>? {
        
        guard let urlString = URL(string: url)?.absoluteString else { return nil }
        
        let scale: CGFloat = {
            switch self.imageQuality {
            case .lower:
                return 1
            case .normal:
                return UIScreen.main.scale
            }
        }()
        
        let formatStrings: [String] = {
            
            var strs: [String] = []
            
            if let size = size {
                
                let width   = Int(size.width * scale)
                let height  = Int(size.height * scale)
                
                strs.append(FormatInfo.webPFormat.makeQiniuImageFormatString(w: width, h: height))
                strs.append(FormatInfo.defaultFormat.makeQiniuImageFormatString(w: width, h: height))
            }
            
            strs.append(FormatInfo.webPFormat.makeQiniuImageFormatString())
            strs.append(FormatInfo.defaultFormat.makeQiniuImageFormatString())
            
            return strs
        }()
        
        let urlStrings = formatStrings.map { "\(urlString)?\($0)" }
        
        return urlStrings.makeImageURLIterator()
    }
}

extension String {
    
    public func makeImageURLIterator(size: CGSize? = nil) -> AnyIterator<URL>? {
        
        return QiniuImages.shared.makeImageURLIterator(url: self, size: size)
    }
}

extension URL {
    
    public func makeImageURLIterator(size: CGSize? = nil) -> AnyIterator<URL>? {
        
        return QiniuImages.shared.makeImageURLIterator(url: self.absoluteString, size: size)
    }
}
