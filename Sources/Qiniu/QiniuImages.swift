import Foundation

public enum ImageQuality {
    
    case lower
    case normal
}

public class QiniuImages {
    
    private init() {}
    
    public static let shared = QiniuImages()
    
    public private(set) var host: String = ""
    
    public private(set) var imageQuality: ImageQuality = .normal
    
    public func regist(host: String) {
        
        self.host = host
    }
    
    public func setImageQuality(_ quality: ImageQuality) {
        
        self.imageQuality = quality
    }
    
    func makeImageURLIterator(url: String, size: CGSize? = nil) -> AnyIterator<URL>? {
        
        guard let urlString = self.makeImageURLString(string: url) else { return nil }
        
        let scale: CGFloat = {
            switch self.imageQuality {
            case .lower:
                return 1
            case .normal:
                return UIScreen.main.scale
            }
        }()
        
        let extensionInfo: [String] = {
            
            var infos: [String] = []
            
            if let size = size {
                let width   = Int(size.width * scale)
                let height  = Int(size.height * scale)
                
                infos.append(self.webPImageURLInfo.makeQiniuImageURLExtension(w: width, h: height))
                infos.append(self.defaultImageURLInfo.makeQiniuImageURLExtension(w: width, h: height))
            }
            
            infos.append(self.webPImageURLInfo.makeQiniuImageURLExtension())
            infos.append(self.defaultImageURLInfo.makeQiniuImageURLExtension())
            
            return infos
        }()
        
        let urlStrings = extensionInfo.map { "\(urlString)?\($0)" }
        
        return urlStrings.makeImageURLIterator()
    }
    
    let defaultImageURLInfo = ImageURLInfo(mode: .m0)
    let webPImageURLInfo    = ImageURLInfo(mode: .m0, type: .webp)
    
    func makeImageURLString(string: String?) -> String? {
        
        guard let str = string, !str.isEmpty else { return nil }
        
        if str.lowercased().hasPrefix("http") {
            return str
        } else {
            return "\(self.host)/\(str)"
        }
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
