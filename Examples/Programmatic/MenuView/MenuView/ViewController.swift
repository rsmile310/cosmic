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

/**

*/

import UIKit
import Material

class ViewController: UIViewController {
	private var menuView: MenuLayout!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		prepareView()
		prepareMenuLayoutExample()
	}
	
	internal func handleOpenMenuLayout() {
		if menuView.opened {
			menuView.close()
		} else {
			menuView.open() { (item: MenuLayoutItem) in
				(item.button as? MaterialButton)?.pulse()
			}
		}
	}
	
	/// General preparation statements are placed here.
	private func prepareView() {
		view.backgroundColor = MaterialColor.white
	}
	
	/// Prepares the MenuLayout example.
	private func prepareMenuLayoutExample() {
		let btn: FlatButton = FlatButton(frame: CGRectMake(100, 100, 100, 100))
		btn.backgroundColor = MaterialColor.red.base
		
		
		let image: UIImage? = UIImage(named: "ic_add_white")
		let btn1: FabButton = FabButton()
		btn1.depth = .None
		btn1.setImage(image, forState: .Normal)
		btn1.setImage(image, forState: .Highlighted)
		btn1.addTarget(self, action: "handleOpenMenuLayout", forControlEvents: .TouchUpInside)
		view.addSubview(btn1)
		
		let btn2: FabButton = FabButton()
		btn2.depth = .None
		btn2.backgroundColor = MaterialColor.blue.base
		btn2.setImage(image, forState: .Normal)
		btn2.setImage(image, forState: .Highlighted)
		view.addSubview(btn2)
		
		let btn3: FabButton = FabButton()
		btn3.depth = .None
		btn3.backgroundColor = MaterialColor.green.base
		btn3.setImage(image, forState: .Normal)
		btn3.setImage(image, forState: .Highlighted)
		view.addSubview(btn3)
		
		let btn4: FabButton = FabButton()
		btn4.depth = .None
		btn4.backgroundColor = MaterialColor.yellow.base
		btn4.setImage(image, forState: .Normal)
		btn4.setImage(image, forState: .Highlighted)
		view.addSubview(btn4)
		
		menuView = MenuLayout()
		menuView.menuPosition = .TopRight
		menuView.menuDirection = .Left
		menuView.baseSize = CGSizeMake(36, 36)
		menuView.itemSize = CGSizeMake(36, 36)
		
		view.addSubview(btn)
		
		menuView.menuItems = [
			MenuLayoutItem(button: btn1),
			MenuLayoutItem(button: btn2),
			MenuLayoutItem(button: btn3),
			MenuLayoutItem(button: btn4)
		]
	}
}

