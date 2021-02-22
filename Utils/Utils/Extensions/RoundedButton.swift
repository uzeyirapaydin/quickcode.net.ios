//
//  RoundedButton.swift
//  QuickCode.net
//
//  Created by Uzeyir APAYDIN on 25.05.2018.
//  Copyright © 2018 Uzeyir APAYDIN. All rights reserved.
//

import UIKit
import LRTextField
import CoreTelephony
import UserNotifications

@IBDesignable public class RoundedButton: UIButton
{
    override public func layoutSubviews() {
        super.layoutSubviews()
        
        updateCornerRadius()
    }
    
    @IBInspectable var rounded: Bool = false {
        didSet {
            updateCornerRadius()
        }
    }
    
    func updateCornerRadius() {
        layer.cornerRadius = rounded ? 8: 0
    }
}



public extension NSDictionary {
    func getIndex(index:Int) -> (key:Key,value:Value) {
        var returnValue : (key:Key,value:Value)
        returnValue.key = self.allKeys[index]
        returnValue.value = self.allValues[index]
        return returnValue
    }
}


public extension Date {
    func toStringWithDay() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM yyyy EEEE"
        //dateFormatter.timeZone = TimeZone(identifier: "UTC")
        let dateString = dateFormatter.string(from:self)
        return dateString
    }
    
    public func toString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        //dateFormatter.timeZone = TimeZone(identifier: "UTC")
        let dateString = dateFormatter.string(from:self)
        
        return dateString
    }
    
    public func toStringHour() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        
        let dateString = dateFormatter.string(from:self)
        return dateString
    }
    
    public var startOfWeek: Date {
        var gregorian = Calendar(identifier: .gregorian)
        gregorian.timeZone =   TimeZone(identifier: "UTC")!
        let sunday = gregorian.date(from: gregorian.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self))
        if sunday == self {
            return gregorian.date(byAdding: .day, value: -6, to: sunday!)!
        }
        return gregorian.date(byAdding: .day, value: 1, to: sunday!)!
    }
    
    public var endOfWeek: Date {
        var gregorian = Calendar(identifier: .gregorian)
        gregorian.timeZone =   TimeZone(identifier: "UTC")!
        let sunday = gregorian.date(from: gregorian.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self))
        if sunday == self {
            return sunday!
        }else{
            return gregorian.date(byAdding: .day, value: 7, to: sunday!)!
        }
    }
    
    public var startOfMonth: Date {
        var component = Calendar.current.dateComponents([.year, .month, .day], from: self)
        component.day=1
        component.timeZone = TimeZone(identifier: "UTC")
        let returnValue = Calendar.current.date(from: component)
        
        return returnValue!
    }
    
    public var endOfMonth: Date {
        let returnValue = Calendar.current.date(byAdding: DateComponents(month: 1, day: -1), to: self.startOfMonth)!
        return returnValue
    }
    
}


extension String {
    func heightWithConstrainedWidth(width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: [.usesLineFragmentOrigin, .usesFontLeading], attributes: [NSAttributedString.Key.font: font], context: nil)
        return boundingBox.height
    }
    
    public func checkLocationString(shipmentId : Int, locationKey :  String) -> String {
        var returnValue : String = self
        if returnValue.count == 0 {
            returnValue = "Shipment \(shipmentId) Location \(locationKey)"
        }
        
        return returnValue
        
    }
}


 open class NibView: UIView {
    public var view: UIView!
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Setup view from .xib file
        xibSetup()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        // Setup view from .xib file
        xibSetup()
    }
}
public extension NibView {
    
    public func xibSetup() {
        backgroundColor = UIColor.clear
        view = loadNib()
        // use bounds not frame or it'll be offset
        view.frame = bounds
        // Adding custom subview on top of our view
        addSubview(view)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[childView]|",
                                                      options: [],
                                                      metrics: nil,
                                                      views: ["childView": view]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[childView]|",
                                                      options: [],
                                                      metrics: nil,
                                                      views: ["childView": view]))
    }
}

public extension UIView {
    /** Loads instance from nib with the same name. */
    func loadNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nibName = type(of: self).description().components(separatedBy: ".").last!
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as! UIView
    }
}

public extension UIView {
    class func fromNib<T: UIView>() -> T {
        return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
}

public extension UIStackView {
    
    func safelyRemoveArrangedSubviews() {
        
        // Remove all the arranged subviews and save them to an array
        let removedSubviews = arrangedSubviews.reduce([]) { (sum, next) -> [UIView] in
            self.removeArrangedSubview(next)
            return sum + [next]
        }
        
        // Deactive all constraints at once
        NSLayoutConstraint.deactivate(removedSubviews.flatMap({ $0.constraints }))
        
        // Remove the views from self
        removedSubviews.forEach({ $0.removeFromSuperview() })
    }
}

 @IBDesignable public class InsetLabel: UILabel {
    @IBInspectable var topInset: CGFloat = 0.0
    @IBInspectable var leftInset: CGFloat = 0.0
    @IBInspectable var bottomInset: CGFloat = 0.0
    @IBInspectable var rightInset: CGFloat = 0.0
    
    var insets: UIEdgeInsets {
        get {
            return UIEdgeInsets.init(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        }
        set {
            topInset = newValue.top
            leftInset = newValue.left
            bottomInset = newValue.bottom
            rightInset = newValue.right
        }
    }
    
    override public func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: insets))
    }
    
    override public func sizeThatFits(_ size: CGSize) -> CGSize {
        var adjSize = super.sizeThatFits(size)
        adjSize.width += leftInset + rightInset
        adjSize.height += topInset + bottomInset
        
        return adjSize
    }
    
    override public var intrinsicContentSize: CGSize {
        var contentSize = super.intrinsicContentSize
        contentSize.width += leftInset + rightInset
        contentSize.height += topInset + bottomInset
        
        return contentSize
    }
}


public extension UIView {
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
            layer.masksToBounds = true
        }
    }
    
    @IBInspectable
    var bottomBorderWidth: CGFloat {
        get {
            return 0.0   // Just to satisfy property
        }
        set {
            let line = UIView(frame: CGRect(x: 0.0, y: bounds.height, width: bounds.width, height: newValue))
            line.translatesAutoresizingMaskIntoConstraints = false
            line.backgroundColor = borderColor
            
            line.tag = 110
            self.addSubview(line)
            
            let views = ["line": line]
            let metrics = ["lineWidth": newValue]
            addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "|[line]|", options: [], metrics: nil, views: views))
            addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[line(==lineWidth)]|", options: [], metrics: metrics, views: views))
        }
    }
    
    
}

public class PaddedTextField: UITextField {
    
    @IBInspectable var padding: CGFloat = 0
    
    override public func textRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + padding, y: bounds.origin.y, width: bounds.width - padding * 2, height: bounds.height)
    }
    
    override public func editingRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + padding, y: bounds.origin.y, width: bounds.width - padding * 2, height: bounds.height)
    }
}

extension Double {
   public func convertToInt(decimalDigit: Int) -> Int {
        return (Int)(self *  pow(10, Double( decimalDigit)))
    }
}

public extension UIView {
    
    func pulsate() {
        
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.6
        pulse.fromValue = 0.95
        pulse.toValue = 1.0
        pulse.autoreverses = true
        pulse.repeatCount = 2
        pulse.initialVelocity = 0.5
        pulse.damping = 1.0
        
        layer.add(pulse, forKey: "pulse")
    }
    
    
    func showme() {
        
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.6
        pulse.fromValue = 0.97
        pulse.toValue = 1.0
        pulse.autoreverses = true
        pulse.repeatCount = 1
        pulse.initialVelocity = 0.5
        pulse.damping = 1.0
        
        layer.add(pulse, forKey: "pulse")
    }
    
    func flash() {
        
        let flash = CABasicAnimation(keyPath: "opacity")
        flash.duration = 0.5
        flash.fromValue = 1
        flash.toValue = 0.1
        flash.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        flash.autoreverses = true
        flash.repeatCount = 3
        
        layer.add(flash, forKey: nil)
    }
    
    
    func flashMarker() {
        
        let flash = CABasicAnimation(keyPath: "opacity")
        flash.duration = 0.07
        flash.fromValue = 1
        flash.toValue = 0.1
        flash.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        flash.autoreverses = true
        flash.repeatCount = 2
        
        layer.add(flash, forKey: nil)
    }
    
    func shake() {
        
        let shake = CABasicAnimation(keyPath: "position")
        shake.duration = 0.1
        shake.repeatCount = 2
        shake.autoreverses = true
        
        let fromPoint = CGPoint(x: center.x - 5, y: center.y)
        let fromValue = NSValue(cgPoint: fromPoint)
        
        let toPoint = CGPoint(x: center.x + 5, y: center.y)
        let toValue = NSValue(cgPoint: toPoint)
        
        shake.fromValue = fromValue
        shake.toValue = toValue
        
        layer.add(shake, forKey: "position")
    }
    
    // OUTPUT 1
    func dropShadow(scale: Bool = false) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.shadowOpacity = 0.3
        layer.shadowOffset  = CGSize(width: 1, height: 1)
        layer.shadowRadius = 1
        
        //layer.shouldRasterize = true
        
    }
    
    // OUTPUT 2
    func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
        
        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
}

public extension UITextField{
    public func setNotValidBackground(){
        backgroundColor = UIColor.red.withAlphaComponent(0.2)
    }
    
   public  func setValidBackground(){
        backgroundColor = UIColor.white
    }
}


public extension UITextView {
    public func setNotValidBackground(){
        backgroundColor = UIColor.red.withAlphaComponent(0.2)
    }
    
    public  func setValidBackground(){
        backgroundColor = UIColor.clear
    }
}

public extension UILabel {
    public func setNotValidBackground(){
        backgroundColor = UIColor.red.withAlphaComponent(0.2)
    }
    
    public  func setValidBackground(){
        backgroundColor = UIColor.clear
    }
}


public extension UITableViewCell {
    public func addKeyboardToolBar(textField : UITextField, action: Selector?) {
        var nextButton: UIBarButtonItem?
        let keyboardToolBar = UIToolbar(frame: CGRect(x: CGFloat(0), y: CGFloat(0), width: CGFloat(textField.frame.size.width), height: CGFloat(25)))
        keyboardToolBar.sizeToFit()
        keyboardToolBar.barStyle = .default
        textField.autocorrectionType = .no
        textField.inputAccessoryView = keyboardToolBar
        
        nextButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: action)
        
        
        keyboardToolBar.items = [UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil), nextButton] as? [UIBarButtonItem]
    }
    
    public func addKeyboardToolBar(textView : UITextView, action: Selector?) {
        var nextButton: UIBarButtonItem?
        let keyboardToolBar = UIToolbar(frame: CGRect(x: CGFloat(0), y: CGFloat(0), width: CGFloat(textView.frame.size.width), height: CGFloat(25)))
        keyboardToolBar.sizeToFit()
        keyboardToolBar.barStyle = .default
        textView.autocorrectionType = .no
        textView.inputAccessoryView = keyboardToolBar
        
        nextButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: action)
        
        
        keyboardToolBar.items = [UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil), nextButton] as? [UIBarButtonItem]
    }
    
}

public extension UIView {
    var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder!.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
    
    public func setHeight(newHeight: CGFloat){
        self.frame=CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width: self.frame.width, height: newHeight)
    }
    
    public func setWidth(newWidth: CGFloat){
        self.frame=CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width: newWidth, height: self.frame.height)
    }
    
    public class func getAllSubviews<T: UIView>(view: UIView) -> [T] {
        return view.subviews.flatMap { subView -> [T] in
            var result = getAllSubviews(view: subView) as [T]
            if let view = subView as? T {
                result.append(view)
            }
            return result
        }
    }
    
    public func getAllSubviews<T: UIView>() -> [T] {
        return UIView.getAllSubviews(view: self) as [T]
    }
}

public enum ValidationType {
    case optional, required
}

private var ValidationTypeHolderKey: UInt8 = 7

public extension LRTextField {
    
    public var isOptional: ValidationType {
        get {
            if let connectionState = objc_getAssociatedObject(self, &ValidationTypeHolderKey) as? ValidationType {
                return connectionState
            }
            return .required
        }
        set {
            objc_setAssociatedObject(self, &ValidationTypeHolderKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    
}

public extension UIImage {
    public func resized(withPercentage percentage: CGFloat) -> UIImage? {
        let canvasSize = CGSize(width: size.width * percentage, height: size.height * percentage)
        UIGraphicsBeginImageContextWithOptions(canvasSize, false, scale)
        defer { UIGraphicsEndImageContext() }
        draw(in: CGRect(origin: .zero, size: canvasSize))
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    public func resized(toWidth width: CGFloat) -> UIImage? {
        let canvasSize = CGSize(width: width, height: CGFloat(ceil(width/size.width * size.height)))
        UIGraphicsBeginImageContextWithOptions(canvasSize, false, scale)
        defer { UIGraphicsEndImageContext() }
        draw(in: CGRect(origin: .zero, size: canvasSize))
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}

















