import Foundation

extension Array where Iterator.Element == URL {
    
    public func makeImageURLIterator() -> AnyIterator<URL> {
        
        return AnyIterator<URL>(self.makeIterator())
    }
}
