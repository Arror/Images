import Foundation

public protocol ImageCompatible {
    
    associatedtype CompatibleType
    
    var img: CompatibleType { get }
}

extension ImageCompatible {
    
    public var img: Image<Self> { return Image(self) }
}

extension UIImageView: ImageCompatible {}

