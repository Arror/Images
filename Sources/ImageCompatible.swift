import UIKit
import YYWebImage

public struct Image<Base> {
    
    internal let base: Base
    
    public init(_ base: Base) {
        
        self.base = base
    }
}

public protocol ImageCompatible {
    
    associatedtype CompatibleType
    
    var img: CompatibleType { get }
}

extension ImageCompatible {
    
    public var img: Image<Self> { return Image(self) }
}

extension UIImageView: ImageCompatible {}

extension Image where Base: UIImageView {
    
    public func setImage(iterator: AnyIterator<URL>?, placeholder: UIImage? = nil, options: YYWebImageOptions = [.setImageWithFadeAnimation]) {
        
        if let iterator = iterator {
            
            let completion: YYWebImageCompletionBlock = { image, url, type, stage, error in
                
                if let img = image {
                    
                    DispatchQueue.main.async { self.base.image = img }
                    
                } else {
                    
                    self.setImage(iterator: iterator, placeholder: placeholder, options: options)
                }
            }
            
            self.base.yy_setImage(with: iterator.next(), placeholder: placeholder, options: options, completion: completion)
            
        } else {
            
            self.base.image = placeholder
        }
    }
}
