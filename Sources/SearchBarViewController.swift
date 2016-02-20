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

public extension UIViewController {
	/**
	A convenience property that provides access to the SearchBarViewController.
	This is the recommended method of accessing the SearchBarViewController
	through child UIViewControllers.
	*/
	public var searchBarViewController: SearchBarViewController? {
		var viewController: UIViewController? = self
		while nil != viewController {
			if viewController is SearchBarViewController {
				return viewController as? SearchBarViewController
			}
			viewController = viewController?.parentViewController
		}
		return nil
	}
}

public class SearchBarViewController: UIViewController {
	public private(set) lazy var searchBarView: SearchBarView = SearchBarView()
	
	/**
	A Boolean property used to enable and disable interactivity
	with the mainViewController.
	*/
	public var userInteractionEnabled: Bool {
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
	An initializer for the SearchBarViewController.
	- Parameter mainViewController: The main UIViewController.
	*/
	public convenience init(mainViewController: UIViewController) {
		self.init()
		self.mainViewController = mainViewController
		prepareView()
	}
	
	public override func viewWillLayoutSubviews() {
		super.viewWillLayoutSubviews()
		layoutSubviews()
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
	public func transitionFromMainViewController(toViewController: UIViewController, duration: NSTimeInterval = 0.5, options: UIViewAnimationOptions = [], animations: (() -> Void)?, completion: ((Bool) -> Void)?) {
		mainViewController.willMoveToParentViewController(nil)
		addChildViewController(toViewController)
		toViewController.view.frame = view.bounds
		transitionFromViewController(mainViewController,
			toViewController: toViewController,
			duration: duration,
			options: options,
			animations: animations,
			completion: { [unowned self] (result: Bool) in
				toViewController.didMoveToParentViewController(self)
				self.mainViewController.removeFromParentViewController()
				self.mainViewController = toViewController
				completion?(result)
			})
	}
	
	/// A method that generally prepares the SearchBarViewController.
	private func prepareView() {
		prepareSearchBarView()
		prepareMainViewController()
	}
	
	/// Prepares the SearchBarView.
	private func prepareSearchBarView() {
		searchBarView.delegate = self
		view.addSubview(searchBarView)
	}
	
	/// A method that prepares the mainViewController.
	private func prepareMainViewController() {
		prepareViewControllerWithinContainer(mainViewController, container: view)
	}
	
	/**
	A method that adds the passed in controller as a child of
	the SearchBarViewController within the passed in
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
	
	/// Layout subviews.
	private func layoutSubviews() {
		let size: CGSize = UIScreen.mainScreen().bounds.size
		let h: CGFloat = UIApplication.sharedApplication().statusBarFrame.size.height
		mainViewController.view.frame = CGRectMake(0, searchBarView.height, size.width, size.height - searchBarView.height - (20 >= h ? 0 : h - 20))
	}
}

extension SearchBarViewController : SearchBarViewDelegate {
	/// Monitor layout changes.
	public func searchBarViewDidChangeLayout(searchBarView: SearchBarView) {
		layoutSubviews()
	}
}