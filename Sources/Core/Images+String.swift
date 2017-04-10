import Foundation

extension Array where Iterator.Element == String {
    
    func makeURLs() -> [URL] {
        
        return self.flatMap { URL(string: $0) }
    }
    
    public func makeImageURLIterator() -> AnyIterator<URL> {
        
        return self.makeURLs().makeImageURLIterator()
    }
}
