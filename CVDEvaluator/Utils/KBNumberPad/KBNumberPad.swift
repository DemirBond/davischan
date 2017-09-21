//
//  KBNumberPad.swift
//  Pods
//
//  Created by Kirill Biakov on 01/21/2017.
//  Copyright (c) 2017 Kirill Biakov. All rights reserved.
//

import Foundation
import UIKit


// MARK: - Delegate

public protocol KBNumberPadDelegate {
	//func onNumberClicked(numberPad: KBNumberPad, number: Int);
	func onDoneClicked(numberPad: KBNumberPad);
	func onNextClicked(numberPad: KBNumberPad);
	//func onClearClicked(numberPad: KBNumberPad);
}


// MARK: NumberPadType

public enum KBNumberPadType {
	case Integer
	case Decimal
}


// MARK: - NumberPad ReturnType

public enum KBNumberPadReturnType {
	case Done
	case Next
}


// MARK: - View

public class KBNumberPad: UIView {
    
	private static let nibName = "KBNumberPad"
	private static let clearSymbolIconName = "ClearSymbolIcon"
	private static let clearSymbolFilledIconName = "ClearSymbolFilledIcon"
	
	private static let estimatedWidth = Int(UIScreen.main.bounds.width)
	private static let estimatedHeight = 216
	
	var textInput: (UITextInput & UIResponder)?
	
	@IBOutlet var containerView: UIView!
	@IBOutlet var numberButtons: [UIButton]!
	@IBOutlet var puncButton: UIButton!
	@IBOutlet var doneButton: UIButton!
	@IBOutlet var nextButton: UIButton!
	@IBOutlet var clearButton: UIButton!
	
	var isPunctuated: Bool = false
	var lastString: String?
	
	public var delegate: KBNumberPadDelegate?
	
	var padType: KBNumberPadType?
	var returnType: KBNumberPadReturnType?
	
	
	// MARK: - Init
	
	convenience init(padType: KBNumberPadType, returnType: KBNumberPadReturnType) {
		self.init(frame: KBNumberPad.defaultRect())
		
		self.padType = padType
		self.returnType = returnType
		setupViewFromXib()
		
		addNotificationsObservers()
	}
	
	override public init(frame: CGRect) {
		super.init(frame: frame)
	}
	
	required public init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		setupViewFromXib()
		addNotificationsObservers()
	}
	
	deinit {
		delegate = nil
		NotificationCenter.default.removeObserver(self)
	}
	
	private func setupViewFromXib() {
		let nib = UINib(nibName: KBNumberPad.nibName, bundle: bundle())
			.instantiate(withOwner: self, options: nil)
		
		let view = nib.first as! UIView
		view.frame = bounds
		view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
		addSubview(view)
		
		for index in 0...15 {
			let buttonView: UIView = view.viewWithTag(100 + index)!
			buttonView.layer.cornerRadius = 4.0
			buttonView.layer.masksToBounds = false
			buttonView.layer.shadowColor = UIColor(palette: ColorPalette.black)?.cgColor
			buttonView.layer.shadowOffset = CGSize(width: 0, height: 0.5)
			buttonView.layer.shadowRadius = 0.5
			buttonView.layer.shadowOpacity = 0.5
		}

		if padType == .Integer {
			self.puncButton.isHidden = true
		}
		else {
			self.puncButton.isHidden = false
		}
		
		if returnType == .Done {
			self.doneButton.isHidden = false
			self.nextButton.isHidden = true
		}
		else {
			self.doneButton.isHidden = true
			self.nextButton.isHidden = false
		}
	}
	
	fileprivate func loadIcon(name: String) -> UIImage? {
		let image = UIImage(named: name, in: bundle(), compatibleWith: nil)
		let colorable = UIImageRenderingMode.alwaysTemplate
		return image?.withRenderingMode(colorable)
	}
	
	private static func defaultRect() -> CGRect {
		return CGRect(x: 0,
		              y: 0,
		              width: KBNumberPad.estimatedWidth,
		              height: KBNumberPad.estimatedHeight)
	}
	
	private func bundle() -> Bundle {
		return Bundle(for: type(of: self))
	}
	
	
	func addNotificationsObservers() {
		NotificationCenter.default.addObserver(self, selector: #selector(textDidBeginEditing), name: NSNotification.Name.UITextFieldTextDidBeginEditing, object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(textDidBeginEditing), name: NSNotification.Name.UITextFieldTextDidBeginEditing, object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(textDidEndEditing), name: NSNotification.Name.UITextViewTextDidEndEditing, object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(textDidEndEditing), name: NSNotification.Name.UITextViewTextDidEndEditing, object: nil)
		
	}
	
	
	// MARK: - TextField Editing
	
	func textDidBeginEditing(notification: NSNotification) {
//		if !(notification.object as! NSObject).conforms(to: protocol(UITextInput)) do {
//			return
//		}
		
		let textInput: (UITextInput & UIResponder)? = notification.object as? (UITextInput & UIResponder)
		if textInput?.inputView != nil && textInput?.inputView == self {
			self.textInput = textInput
		}
	}
	
	func textDidEndEditing(notification: NSNotification) {
		self.textInput = nil
	}

	
	// MARK: - Public methods
	
	public func setDelimiterColor(_ color: UIColor) {
		containerView.backgroundColor = color
	}
	
	public func setButtonsColor(_ color: UIColor) {
		setNumberButtonsColor(color)
		setPuncButtonColor(color)
		setDoneButtonColor(color)
		setNextButtonColor(color)
		setClearButtonColor(color)
	}
	
	public func setButtonsBackgroundColor(_ color: UIColor) {
		[numberButtons, [puncButton, doneButton, nextButton, clearButton]].joined().forEach {
			$0.backgroundColor = color
		}
	}
	
	
	// - Number buttons
	
	public func setNumberButtonsColor(_ color: UIColor) {
		numberButtons.forEach {
			$0.setTitleColor(color, for: UIControlState.normal)
		}
	}
	
	public func setNumberButtonsFont(_ font: UIFont) {
		numberButtons.forEach {
			$0.titleLabel?.font = font
		}
	}
	
	
	// - Punc button
	
	public func setPuncButtonColor(_ color: UIColor) {
		puncButton.setTitleColor(color, for: UIControlState.normal)
	}
	
	public func setPuncButtonFont(_ font: UIFont) {
		puncButton.titleLabel?.font = font
	}
	
	public func setPuncButtonTitle(_ title: String) {
		puncButton.titleLabel?.text = title
	}
	
	public func setPuncButtonBackgroundColor(_ color: UIColor) {
		puncButton.backgroundColor = color
	}
	
	
	// - Done button
	
	public func setDoneButtonColor(_ color: UIColor) {
		doneButton.setTitleColor(color, for: UIControlState.normal)
	}
	
	public func setDoneButtonFont(_ font: UIFont) {
		doneButton.titleLabel?.font = font
	}
	
	public func setDoneButtonTitle(_ title: String) {
		doneButton.titleLabel?.text = title
	}
	
	public func setDoneButtonBackgroundColor(_ color: UIColor) {
		doneButton.backgroundColor = color
	}
	
	
	// - Next button
	
	public func setNextButtonColor(_ color: UIColor) {
		nextButton.setTitleColor(color, for: UIControlState.normal)
	}
	
	public func setNextButtonFont(_ font: UIFont) {
		nextButton.titleLabel?.font = font
	}
	
	public func setNextButtonTitle(_ title: String) {
		nextButton.titleLabel?.text = title
	}
	
	public func setNextButtonBackgroundColor(_ color: UIColor) {
		nextButton.backgroundColor = color
	}
	
	
	// - Clear button
	
	public func setClearButtonColor(_ color: UIColor) {
		clearButton.tintColor = color
	}
	
	public func setClearButtonImage(_ image: UIImage) {
		clearButton.imageView?.image = image
	}
	
	public func setClearButtonBackgroundColor(_ color: UIColor) {
		clearButton.backgroundColor = color
	}
	
	public func resetClearButtonImage(isFilled: Bool = false) {
		let iconName = isFilled ?
			KBNumberPad.clearSymbolFilledIconName :
			KBNumberPad.clearSymbolIconName
		
		let image = loadIcon(name: iconName)
		
		setClearButtonImage(image!)
	}
	
	
	// MARK: - IBActions
	
	@IBAction func onNumberClicked(_ sender: UIButton) {
		guard let text: String = sender.titleLabel?.text else { return }
		self.lastString = text
		self.textInput?.insertText(text)
	}
	
	@IBAction func onPuncButtonClicked(_ sender: UIButton) {
		guard let text: String = sender.titleLabel?.text else { return }
		self.lastString = text
		if text == "." {
			if !isPunctuated {
				self.textInput?.insertText(text)
				isPunctuated = true
			}
		}
	}
	
	@IBAction func onDoneClicked(_ sender: UIButton) {
		delegate?.onDoneClicked(numberPad: self)
	}
	
	@IBAction func onNextClicked(_ sender: UIButton) {
		delegate?.onNextClicked(numberPad: self)
	}
	
	@IBAction func onClearClicked(_ sender: UIButton) {
		if isPunctuated {
			if self.lastString == "." {
				isPunctuated = false
			}
		}
		self.textInput?.deleteBackward()
	}
}
