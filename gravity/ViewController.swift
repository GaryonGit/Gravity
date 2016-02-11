//
//  ViewController.swift
//  gravity
//
//  Created by Gary on 27/01/2016.
//  Copyright © 2016 fromTheLoft. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    //  IBOUTLETS
    //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    @IBOutlet weak var iconBG01: UIView!
    @IBOutlet weak var iconImg01: UIImageView!
    @IBOutlet weak var iconBG02: UIView!
    @IBOutlet weak var iconImg02: UIImageView!
    @IBOutlet weak var iconBG03: UIView!
    @IBOutlet weak var iconImg03: UIImageView!
    @IBOutlet weak var iconBG04: UIView!
    @IBOutlet weak var iconImg04: UIImageView!
    @IBOutlet weak var iconBG05: UIView!
    @IBOutlet weak var iconImg05: UIImageView!
    @IBOutlet weak var iconBG06: UIView!
    @IBOutlet weak var iconImg06: UIImageView!
    @IBOutlet weak var iconBG07: UIView!
    @IBOutlet weak var iconImg07: UIImageView!
    @IBOutlet weak var iconBG08: UIView!
    @IBOutlet weak var iconImg08: UIImageView!
    @IBOutlet weak var iconBG09: UIView!
    @IBOutlet weak var iconImg09: UIImageView!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var gravityButton: UIButton!
    @IBOutlet weak var instructionsLabel: UILabel!
    
    /*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    IBOutletCollections
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
    @IBOutlet var iconBackGrounds: Array<UIView>!
    
    /*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    Constraints
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
    @IBOutlet weak var img01CenterXConstraint: NSLayoutConstraint!
    @IBOutlet weak var img02CenterXConstraint: NSLayoutConstraint!
    @IBOutlet weak var img03CenterXConstraint: NSLayoutConstraint!
    @IBOutlet weak var img04CenterXConstraint: NSLayoutConstraint!
    @IBOutlet weak var img05CenterXConstraint: NSLayoutConstraint!
    @IBOutlet weak var img06CenterXConstraint: NSLayoutConstraint!
    @IBOutlet weak var img07CenterXConstraint: NSLayoutConstraint!
    @IBOutlet weak var img08CenterXConstraint: NSLayoutConstraint!
    @IBOutlet weak var img09CenterXConstraint: NSLayoutConstraint!
    
    /*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    UIDynamic Variables
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
    var animator : UIDynamicAnimator!
    var gravityBehavior : UIGravityBehavior!
    var collision: UICollisionBehavior!
    var snapBehaviour:UISnapBehavior!
    
    /*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    Variables
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
    var pressedIcon = UIImageView()
    var pressedIconBg = UIView()
    var targetConstraint = NSLayoutConstraint()
    
    //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    //  IB Actions
    //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    @IBAction func resetIconsDidPress(sender: AnyObject) {
        reset()
    }
    
    @IBAction func gravityDidPress(sender: AnyObject) {
        applyGravity()
    }
    
    //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    //  "Toggle" Functions
    //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    
    func hideGravityShowReset(){
        gravityButton.hidden = true
        resetButton.hidden = false
        instructionsLabel.text = "TAP TO RESET"
    }
    
    func showGravityHideReset(){
        gravityButton.hidden = false
        resetButton.hidden = true
        instructionsLabel.text = "TAP ANYWHERE TO BEGIN"
    }
    
    
    //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    //  Fade in / Fade Out Icon Backgrounds
    //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


    var half: CGFloat = 0.4
    var full: CGFloat = 1.0

    func fadeOutIconBG() {
        
        UIView.animateWithDuration(
            0.4,
            delay: 0.060,
            usingSpringWithDamping: 0.550,
            initialSpringVelocity: 4.0,
            options: [],
            animations: {
                
                self.iconBG01.transform = CGAffineTransformMakeScale(self.half, self.half)
                self.iconBG02.transform = CGAffineTransformMakeScale(self.half, self.half)
                self.iconBG03.transform = CGAffineTransformMakeScale(self.half, self.half)
                self.iconBG04.transform = CGAffineTransformMakeScale(self.half, self.half)
                self.iconBG05.transform = CGAffineTransformMakeScale(self.half, self.half)
                self.iconBG06.transform = CGAffineTransformMakeScale(self.half, self.half)
                self.iconBG07.transform = CGAffineTransformMakeScale(self.half, self.half)
                self.iconBG08.transform = CGAffineTransformMakeScale(self.half, self.half)
                self.iconBG09.transform = CGAffineTransformMakeScale(self.half, self.half)
                
                self.iconBG01.alpha = self.half
                self.iconBG02.alpha = self.half
                self.iconBG03.alpha = self.half
                self.iconBG04.alpha = self.half
                self.iconBG05.alpha = self.half
                self.iconBG06.alpha = self.half
                self.iconBG07.alpha = self.half
                self.iconBG08.alpha = self.half
                self.iconBG09.alpha = self.half
                
            }, completion:nil)

        }
    
    func fadeInIconBG() {
        
        UIView.animateWithDuration(
            0.4,
            delay: 0.060,
            usingSpringWithDamping: 0.550,
            initialSpringVelocity: 4.0,
            options: [],
            animations: {
                
                self.iconBG01.transform = CGAffineTransformMakeScale(self.full, self.full)
                self.iconBG02.transform = CGAffineTransformMakeScale(self.full, self.full)
                self.iconBG03.transform = CGAffineTransformMakeScale(self.full, self.full)
                self.iconBG04.transform = CGAffineTransformMakeScale(self.full, self.full)
                self.iconBG05.transform = CGAffineTransformMakeScale(self.full, self.full)
                self.iconBG06.transform = CGAffineTransformMakeScale(self.full, self.full)
                self.iconBG07.transform = CGAffineTransformMakeScale(self.full, self.full)
                self.iconBG08.transform = CGAffineTransformMakeScale(self.full, self.full)
                self.iconBG09.transform = CGAffineTransformMakeScale(self.full, self.full)
                
                self.iconBG01.alpha = self.full
                self.iconBG02.alpha = self.full
                self.iconBG03.alpha = self.full
                self.iconBG04.alpha = self.full
                self.iconBG05.alpha = self.full
                self.iconBG06.alpha = self.full
                self.iconBG07.alpha = self.full
                self.iconBG08.alpha = self.full
                self.iconBG09.alpha = self.full
                
            }, completion:nil)
        
    }
    
    //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    //  Gravity | Collision | Function | Snap
    //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    func applyGravity() {
        
        hideGravityShowReset()
        fadeOutIconBG()
        
        //Gravity
        let gravity = UIGravityBehavior(items:[iconImg01, iconImg02, iconImg03, iconImg04, iconImg05, iconImg06, iconImg07, iconImg08, iconImg09])
        gravity.gravityDirection = CGVectorMake(0, 1)
        animator.addBehavior(gravity)
        
        //Collision
        collision = UICollisionBehavior(items:[iconImg01, iconImg02, iconImg03, iconImg04, iconImg05, iconImg06, iconImg07, iconImg08, iconImg09])
        animator.addBehavior(collision)
        collision.translatesReferenceBoundsIntoBoundary = true
        
        // Push
        let push = UIPushBehavior(items: [iconImg01, iconImg02, iconImg03, iconImg04, iconImg05, iconImg06, iconImg07, iconImg08, iconImg09], mode: UIPushBehaviorMode.Instantaneous);
        push.setAngle(-0.7865, magnitude: 8)
        animator.addBehavior(push)
        
        //Snap
        //let snap = UISnapBehavior(item: iconImg01, snapToPoint: CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds)))
        //animator.addBehavior(snap)
    }
    
    
    
    //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    //  Animate to original loading position
    //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    func reset() {
        // Remove UIDynamics behaviours
        animator.removeAllBehaviors()
        
        showGravityHideReset()
        fadeInIconBG()
        
        // Update Constraint Constants
        self.img01CenterXConstraint.constant = 0.1
        self.img02CenterXConstraint.constant = 0.1
        self.img03CenterXConstraint.constant = 0.1
        self.img04CenterXConstraint.constant = 0.1
        self.img05CenterXConstraint.constant = 0.1
        self.img06CenterXConstraint.constant = 0.1
        self.img07CenterXConstraint.constant = 0.1
        self.img08CenterXConstraint.constant = 0.1
        self.img09CenterXConstraint.constant = 0.1
        
        // Animate
        UIView.animateWithDuration(
            0.4,
            delay: 0.060,
            usingSpringWithDamping: 0.550,
            initialSpringVelocity: 4.0,
            options: [],
            animations: {
                
                // Update layout - This will animate as we have updated the constraint constants above
                self.view.layoutIfNeeded()
                
                //Reset Rotation Angle
                self.iconImg01.transform = CGAffineTransformMakeRotation(0)
                self.iconImg02.transform = CGAffineTransformMakeRotation(0)
                self.iconImg03.transform = CGAffineTransformMakeRotation(0)
                self.iconImg04.transform = CGAffineTransformMakeRotation(0)
                self.iconImg05.transform = CGAffineTransformMakeRotation(0)
                self.iconImg06.transform = CGAffineTransformMakeRotation(0)
                self.iconImg07.transform = CGAffineTransformMakeRotation(0)
                self.iconImg08.transform = CGAffineTransformMakeRotation(0)
                self.iconImg09.transform = CGAffineTransformMakeRotation(0)
            }, completion: {finished in
                
                // Reset Constraint Constants
                UIView.animateWithDuration(
                    0.0,
                    delay: 0.0,
                    usingSpringWithDamping: 0.550,
                    initialSpringVelocity: 1.0,
                    options: [],
                    animations: {
                        self.img01CenterXConstraint.constant = 0
                        self.img02CenterXConstraint.constant = 0
                        self.img03CenterXConstraint.constant = 0
                        self.img04CenterXConstraint.constant = 0
                        self.img05CenterXConstraint.constant = 0
                        self.img06CenterXConstraint.constant = 0
                        self.img07CenterXConstraint.constant = 0
                        self.img08CenterXConstraint.constant = 0
                        self.img09CenterXConstraint.constant = 0
                    }, completion:nil)
        })
    }
    
    
    /*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    Icon BG Styling
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
    func styleIconBG() {
        //Loop through the rows in the OutletCollection and apply styles
        for UIView in iconBackGrounds{
            UIView.layer.cornerRadius = 45
            UIView.backgroundColor = UIColor(red: (255/255.0), green: (255/255.0), blue: (255/255.0), alpha: 0.2)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Included in ViewDidLoad. It's for UIKIT Dynamics
        animator = UIDynamicAnimator(referenceView: view)
        //Run styles function
        styleIconBG()
        showGravityHideReset()
        
    }
    
    
    
}

