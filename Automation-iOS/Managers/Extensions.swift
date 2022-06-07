//
//  Created by Dushan Saputhanthri on 15/6/18.
//  Copyright © 2018 RYRA Circuit. All rights reserved.
//

import Foundation
import UIKit
import AlamofireImage

extension Dictionary {
    
    mutating func updateDictionary(otherValues: Dictionary) {
        for (key, value) in otherValues {
            self.updateValue(value, forKey: key)
        }
    }
}

extension String {
    
    func trim() -> String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    func removingAllWhitespaces() -> String {
        return removingCharacters(from: .whitespaces)
    }
    
    func removingCharacters(from set: CharacterSet) -> String {
        var newString = self
        newString.removeAll { char -> Bool in
            guard let scalar = char.unicodeScalars.first else { return false }
            return set.contains(scalar)
        }
        return newString
    }
    
    func htmlAttributedString(family: String?, size: CGFloat, hexString: String) -> NSAttributedString? {
        do {
            let htmlCSSString = "<style>" +
                "html *" +
                "{" +
                "font-size: \(size)pt !important;" +
                "color: #\(hexString) !important;" +
                "font-family: \(family ?? "Helvetica"), Helvetica !important;" +
            "}</style> \(self)"
            
            guard let data = htmlCSSString.data(using: String.Encoding.utf8) else {
                return nil
            }
            
            return try NSAttributedString(data: data,
                                          options: [.documentType: NSAttributedString.DocumentType.html,
                                                    .characterEncoding: String.Encoding.utf8.rawValue],
                                          documentAttributes: nil)
        } catch {
            print("error: ", error)
            return nil
        }
    }
}

extension Int {
    
    var roundedWithAbbreviations: String {
        
        let number = Double(self)
        let thousand = number / 1000
        let million = number / 1000000
        let billion = number / 1000000000
        
        if billion >= 1.0 {
            return "\(round(billion*10)/10)B"
        }
        else if million >= 1.0 {
            return "\(round(million*10)/10)M"
        }
        else if thousand >= 1.0 {
            return "\(round(thousand*10)/10)K"
        }
        else {
            return "\(self)"
        }
    }
}

extension UIView {
    
    func removeAllSubViews() {
        self.subviews.forEach { $0.removeFromSuperview() }
    }
    
    func addLayerEffects(with borderColor: UIColor? = nil, borderWidth: CGFloat = 0.0, cornerRadius: CGFloat = 0.0) {
        self.layer.borderColor = borderColor?.cgColor
        self.layer.borderWidth = borderWidth
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
    }
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
    func addShadow(offSet: CGFloat = 2.0, color: UIColor = .lightGray) {
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = CGSize(width: offSet, height: offSet)
        self.layer.shadowOpacity = 1
        self.layer.shouldRasterize = false
        self.layer.masksToBounds = false
    }
    
    func convertToImage() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.isOpaque, 0.0)
        self.drawHierarchy(in: self.bounds, afterScreenUpdates: true)
        let snapshotImageFromMyView = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return snapshotImageFromMyView!
    }
    
    func applyGradient(isTopBottom: Bool, colorArray: [UIColor]) {
        if let sublayers = layer.sublayers {
            let _ = sublayers.filter({ $0 is CAGradientLayer }).map({ $0.removeFromSuperlayer() })
        }
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colorArray.map({ $0.cgColor })
        if isTopBottom {
            gradientLayer.locations = [0.0, 1.0]
        } else {
            //leftRight
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        }
        
        backgroundColor = .clear
        gradientLayer.frame = self.bounds
        layer.insertSublayer(gradientLayer, at: 0)
    }
}

extension UILabel {
    
    var optimalHeight:CGFloat {
        get {
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.width, height: CGFloat.greatestFiniteMagnitude))
            label.numberOfLines = 0
            label.lineBreakMode = NSLineBreakMode.byTruncatingTail
            label.font = self.font.withSize(15.0)
            label.text = self.text
            label.sizeToFit()
            return label.frame.height
        }
    }
}

extension NSRange {
    
    func range(for str: String) -> Range<String.Index>? {
        guard location != NSNotFound else { return nil }

        guard let fromUTFIndex = str.utf16.index(str.utf16.startIndex, offsetBy: location, limitedBy: str.utf16.endIndex) else { return nil }
        guard let toUTFIndex = str.utf16.index(fromUTFIndex, offsetBy: length, limitedBy: str.utf16.endIndex) else { return nil }
        guard let fromIndex = String.Index(fromUTFIndex, within: str) else { return nil }
        guard let toIndex = String.Index(toUTFIndex, within: str) else { return nil }
        
        return fromIndex ..< toIndex
    }
}

extension UIButton {
    
    func setImageWithUrl(_ urlString: String, isBackground: Bool = false, state: UIControl.State = .normal, placeholderImage: UIImage = UIImage()) {
        if let url = URL(string: urlString) {
            switch isBackground {
            case true:
                self.af.setBackgroundImage(for: state, url: url, placeholderImage: placeholderImage, progressQueue: .global())
            default:
                self.af.setImage(for: state, url: url, placeholderImage: placeholderImage, progressQueue: .global())
            }
        }
    }
}

extension UIImageView {
    
    func loadImage(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
    
    func setImageWithUrl(_ urlString: String, placeholderImage: UIImage = UIImage()) {
        if let url = URL(string: urlString) {
            self.af.setImage(withURL: url, placeholderImage: placeholderImage, progressQueue: .global())
        }
    }
}

extension UIImage {
    
    func tintedImage(color: UIColor) -> UIImage? {
        let templateImage = self.withRenderingMode(.alwaysTemplate)
        
        let imageView = UIImageView()
        imageView.image = templateImage
        imageView.tintColor = color
        
        return imageView.image
    }
}

extension Bundle {
    
    var appName: String? {
        return infoDictionary?["CFBundleName"] as? String
    }
    
    var bundleId: String? {
        return bundleIdentifier
    }
    
    var versionNumber: String? {
        return infoDictionary?["CFBundleShortVersionString"] as? String
    }
    
    var buildNumber: String? {
        return infoDictionary?["CFBundleVersion"] as? String
    }
}
