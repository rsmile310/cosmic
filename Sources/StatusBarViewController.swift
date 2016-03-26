/*
* Copyright (C) 2015 - 2016, Daniel Dahan and CosmicMind, Inc. <http://cosmicmind.io>.
* All rights reserved.
*
* Redistribution and use in source and binary forms, with or without
* modification, are permitted provided that the following conditions are met:
*
*	*	Redistributions of source code must retain the above copyright notice, this
*		list of conditions and the following disclaimer.
*
*	*	Redistributions in binary form must reproduce the above copyright notice,
*		this list of conditions and the following disclaimer in the documentation
*		and/or other materials provided with the distribution.
*
*	*	Neither the name of Material nor the names of its
*		contributors may be used to endorse or promote products derived from
*		this software without specific prior written permission.
*
* THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
* AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
* IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
* DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
* FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
* DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
* SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
* CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
* OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
* OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

import UIKit

@IBDesignable
public class StatusBarViewController : UIViewController {
	/// The height of the StatusBar.
	@IBInspectable public var heightForStatusBar: CGFloat = 20
	
	/// The height when in Portrait orientation mode.
	@IBInspectable public var heightForPortraitOrientation: CGFloat = 64
	
	/// The height when in Landscape orientation mode.
	@IBInspectable public var heightForLandscapeOrientation: CGFloat = 44
	
	/**
	A Boolean property used to enable and disable interactivity
	with the mainViewController.
	*/
	@IBInspectable public var userInteractionEnabled: Bool {
		get {
			return mainViewController.view.userInteractionEnabled
		}
		set(value) {
			mainViewController.view.userInteractionEnabled = value
		}
	}
	
	/**
	A UIViewController property that references the active
	main UIViewController. To swap the mainViewController, it
	is recommended to use the transitionFromMainViewController
	helper method.
	*/
	public private(set) var mainViewController: UIViewController!
	
	/**
	An initializer for the StatusBarViewController.
	- Parameter mainViewController: The main UIViewController.
	*/
	public convenience init(mainViewController: UIViewController) {
		self.init()
		self.mainViewController = mainViewController
		prepareView()
	}
	
	/**
	A method to swap mainViewController objects.
	- Parameter toViewController: The UIViewController to swap
	with the active mainViewController.
	- Parameter duration: A NSTimeInterval that sets the
	animation duration of the transition.
	- Parameter options: UIViewAnimationOptions thst are used
	when animating the transition from the active mainViewController
	to the toViewController.
	- Parameter animations: An animation block that is executed during
	the transition from the active mainViewController
	to the toViewController.
	- Parameter completion: A completion block that is execited after
	the transition animation from the active mainViewController
	to the toViewController has completed.
	*/
	public func transitionFromMainViewController(toViewController: UIViewController, duration: NSTimeInterval = 0.5, options: UIViewAnimationOptions = [], animations: (() -> Void)? = nil, completion: ((Bool) -> Void)? = nil) {
		mainViewController.willMoveToParentViewController(nil)
		addChildViewController(toViewController)
		toViewController.view.frame = mainViewController.view.frame
		transitionFromViewController(mainViewController,
			toViewController: toViewController,
			duration: duration,
			options: options,
			animations: animations,
			completion: { [unowned self] (result: Bool) in
				toViewController.didMoveToParentViewController(self)
				self.mainViewController.removeFromParentViewController()
				self.mainViewController = toViewController
				self.view.sendSubviewToBack(self.mainViewController.view)
				completion?(result)
			})
	}
	
	/**
	Prepares the view instance when intialized. When subclassing,
	it is recommended to override the prepareView method
	to initialize property values and other setup operations.
	The super.prepareView method should always be called immediately
	when subclassing.
	*/
	public func prepareView() {
		edgesForExtendedLayout = .None
		view.clipsToBounds = true
		prepareMainViewController()
	}
	
	public override func viewWillLayoutSubviews() {
		super.viewWillLayoutSubviews()
		layoutSubviews()
	}
	
	/// Layout subviews.
	private func layoutSubviews() {
		let h: CGFloat = MaterialDevice.height
		let q: CGFloat = UIApplication.sharedApplication().statusBarFrame.size.height
		
		if .iPhone == MaterialDevice.type && MaterialDevice.landscape {
			mainViewController.view.frame.origin.y = heightForLandscapeOrientation
			mainViewController.view.frame.size.height = h - (heightForStatusBar >= q ? heightForLandscapeOrientation : q - heightForStatusBar - heightForLandscapeOrientation)
		} else {
			mainViewController.view.frame.origin.y = heightForPortraitOrientation
			mainViewController.view.frame.size.height = h - (heightForStatusBar >= q ? heightForPortraitOrientation : q - heightForStatusBar - heightForPortraitOrientation)
		}
	}
	
	/// A method that prepares the mainViewController.
	private func prepareMainViewController() {
		mainViewController.view.autoresizingMask = .FlexibleWidth
		prepareViewControllerWithinContainer(mainViewController, container: view)
	}
	
	/**
	A method that adds the passed in controller as a child of
	the StatusBarViewController within the passed in
	container view.
	- Parameter viewController: A UIViewController to add as a child.
	- Parameter container: A UIView that is the parent of the
	passed in controller view within the view hierarchy.
	*/
	private func prepareViewControllerWithinContainer(viewController: UIViewController?, container: UIView) {
		if let v: UIViewController = viewController {
			addChildViewController(v)
			container.insertSubview(v.view, atIndex: 0)
			v.didMoveToParentViewController(self)
		}
	}
}
