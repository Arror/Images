import Foundation

public struct ImageURLInfo {
    
    let mode:           ImageMode
    let type:           ImageType
    let interlace:      Bool
    let ignoreError:    Bool
    let quality:        Int
    let qualityForce:   Bool
    
    public init(
        mode: ImageMode,
        type: ImageType     = .default,
        interlace: Bool     = true,
        ignoreError: Bool   = true,
        quality: Int        = 75,
        qualityForce: Bool  = false) {
        
        self.type           = type
        self.mode           = mode
        self.quality        = quality
        self.interlace      = interlace
        self.ignoreError    = ignoreError
        self.qualityForce   = qualityForce
    }
    
    func makeQiniuImageURLExtension(w: Int? = nil, h: Int? = nil) -> String {
        
        let qualityString: String = {
            
            guard (0...100).contains(self.quality) else { return "/q/75" }
            
            return "/q/\(self.quality)" + (self.qualityForce ? "!" : "")
        }()
        
        let ignoreErrorString: String = {
            if self.ignoreError {
                return "/ignore-error/1"
            } else {
                return ""
            }
        }()
        
        return "imageView2\(self.mode.imageModeString(w: w, h: h))\(self.type.imageTypeString)/interlace/\(self.interlace ? "1" : "0")\(qualityString)\(ignoreErrorString)"
    }
}
