import Foundation
import YYWebImage

public struct Image<Base> {
    
    internal let base: Base
    
    public init(_ base: Base) {
        
        self.base = base
    }
}

extension Image where Base: UIImageView {
    
    public func setImage(urlStrings: [String], placeholder: UIImage? = nil) {
        
        let urls = urlStrings.makeURLs()
        
        self.setImage(urls: urls, placeholder: placeholder)
    }
    
    public func setImage(urls: [URL], placeholder: UIImage? = nil) {
        
        let iterator = urls.makeImageURLIterator()
        
        self.setImage(iterator: iterator, placeholder: placeholder)
    }
    
    public func setImage(iterator: AnyIterator<URL>?, placeholder: UIImage? = nil) {
        
        if let iterator = iterator {
            
            let completion: YYWebImageCompletionBlock = { image, url, type, stage, error in
                
                if let img = image {
                    DispatchQueue.main.async { self.base.image = img }
                } else {
                    self.setImage(iterator: iterator, placeholder: placeholder)
                }
            }
            
            self.base.yy_setImage(with: iterator.next(), placeholder: placeholder, options: .setImageWithFadeAnimation, completion: completion)
            
        } else {
            
            self.base.image = placeholder
        }
    }
}
