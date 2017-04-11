import Foundation

extension Array where Iterator.Element == String {
    
    func makeURLs() -> [URL] {
        
        return self.flatMap { URL(string: $0) }
    }
    
    func makeImageURLIterator() -> AnyIterator<URL> {
        
        return self.makeURLs().makeImageURLIterator()
    }
}

extension Array where Iterator.Element == URL {
    
    func makeImageURLIterator() -> AnyIterator<URL> {
        
        return AnyIterator<URL>(self.makeIterator())
    }
}
