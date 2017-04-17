import Foundation

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
