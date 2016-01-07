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
*	*	Neither the name of MaterialKit nor the names of its
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
import MaterialKit

class SideViewController: UIViewController, SideNavigationViewControllerDelegate {
	override func viewDidLoad() {
		super.viewDidLoad()
		prepareView()
		
		// Examples of using SideNavigationViewController.
		prepareSwapSideNavigationViewControllerExample()
	}
	
	internal func handleSwapViewControllers() {
		sideNavigationViewController?.transitionFromMainViewController(sideNavigationViewController?.mainViewController is AMainViewController ? BMainViewController() : AMainViewController(),
			duration: 0.25,
			options: .TransitionCrossDissolve,
			animations: nil,
			completion: { (result: Bool) in
				self.sideNavigationViewController?.close()
			}
		)
	}
	
	/**
	:name:	prepareView
	:description: General preparation statements.
	*/
	private func prepareView() {
		view.backgroundColor = MaterialColor.purple.base
	}
	
	/**
	:name:	prepareGeneralSideNavigationViewControllerExample
	:description:	General usage example.
	*/
	private func prepareSwapSideNavigationViewControllerExample() {
		let button: FabButton = FabButton()
		button.backgroundColor = MaterialColor.orange.base
		button.addTarget(self, action: "handleSwapViewControllers", forControlEvents: .TouchUpInside)
		
		// Add the button through MaterialLayout.
		view.addSubview(button)
		button.translatesAutoresizingMaskIntoConstraints = false
		MaterialLayout.alignFromTopRight(view, child: button, top: 24, right: 24)
		MaterialLayout.size(view, child: button, width: 48, height: 48)
	}
}

