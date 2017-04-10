import Foundation

extension Array where Iterator.Element == String {
    
    func makeURLs() -> [URL] {
        
        return self.flatMap { URL(string: $0) }
    }
}

extension Array where Iterator.Element == URL {
    
    public func makeImageURLIterator() -> AnyIterator<URL> {
        
        return AnyIterator<URL>(self.makeIterator())
    }
}
