import Foundation

struct FormatInfo {
    
    let mode:           ImageMode
    let type:           ImageType
    let interlace:      Bool
    let ignoreError:    Bool
    let quality:        Int
    let qualityForce:   Bool
    
    init(
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
    
    func makeQiniuImageFormatString(w: Int? = nil, h: Int? = nil) -> String {
        
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
        
        let interlaceString: String = "/interlace/\(self.interlace ? "1" : "0")"
        
        return "imageView2\(self.mode.imageModeFormatString(w: w, h: h))\(self.type.imageTypeFormatString())\(interlaceString)\(qualityString)\(ignoreErrorString)"
    }
    
    static let defaultFormat = FormatInfo(mode: .m0)
    static let webPFormat    = FormatInfo(mode: .m0, type: .webp)
}
