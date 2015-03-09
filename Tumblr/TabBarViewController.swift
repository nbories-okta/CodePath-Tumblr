//
//  TabBarViewController.swift
//  Tumblr
//
//  Created by Nicolas Bories on 3/7/15.
//  Copyright (c) 2015 Nico. All rights reserved.
//

import UIKit

class TabBarViewController: UIViewController, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var exploreBubble: UIImageView!
    @IBOutlet var buttons: [UIButton]!

    @IBOutlet weak var loadingView: UIView!
    @IBOutlet weak var loadingImage: UIImageView!
    
    var isPresenting: Bool = true
    var viewControllersArray = [UIViewController]()
    var selectedIndex: Int! = 0
    
    var homeViewController: HomeViewController!
    var searchViewController: SearchViewController!
    var composeViewVontroller: ComposeViewController!
    var accountViewController: AccountViewController!
    var trendingViewController: TrendingViewController!
    var duration: NSTimeInterval!
    var searchTapped: Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        homeViewController = storyboard.instantiateViewControllerWithIdentifier("homeStoryboard") as HomeViewController!
        searchViewController = storyboard.instantiateViewControllerWithIdentifier("searchStoryboard") as SearchViewController!
        accountViewController = storyboard.instantiateViewControllerWithIdentifier("accountStoryboard") as AccountViewController!
        trendingViewController = storyboard.instantiateViewControllerWithIdentifier("trendingStoryboard") as TrendingViewController!
        
        viewControllersArray = [homeViewController, searchViewController, accountViewController, trendingViewController]
        
        didPressButtons(buttons[0])
        loadingView.alpha = 0
        duration = 0.35
        
        var exploreBubbleInitialY = exploreBubble.center.y
        UIView.animateWithDuration(1, delay: 0, options: .Repeat | .Autoreverse, animations: { () -> Void in
            self.exploreBubble.center.y = exploreBubbleInitialY + 5
            }) { (Bool) -> Void in
                //
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func didPressButtons(sender: AnyObject) {
    
        removeChildView(viewControllersArray[selectedIndex])
        buttons[selectedIndex].selected = false
        
        selectedIndex = sender.tag
        
        buttons[selectedIndex].selected = true
        addChildViewController(viewControllersArray[selectedIndex])
        var tabContentView = viewControllersArray[selectedIndex].view
        tabContentView.frame = contentView.frame
        contentView.addSubview(tabContentView)
        viewControllersArray[selectedIndex].didMoveToParentViewController(self)

        
        if (selectedIndex == 1){

            exploreBubble.hidden = true
            var images = UIImage.animatedImageNamed("loading-", duration: 0.5)
            loadingImage.image = images
            loadingView.alpha = 1
            loadingImage.alpha = 1
            
            UIView.animateWithDuration(1, delay: 1.5, options: nil, animations: { () -> Void in
                self.loadingImage.alpha = 0
                self.loadingView.alpha = 0
                
                }, completion: { (Bool) -> Void in
                    
            })

            
            
            
        }
        
    }
    
    func removeChildView(content: UIViewController)
    {
        content.willMoveToParentViewController(nil)
        content.view.removeFromSuperview()
        content.removeFromParentViewController()
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        var destinationVC = segue.destinationViewController as ComposeViewController
        destinationVC.modalPresentationStyle = UIModalPresentationStyle.Custom
        destinationVC.transitioningDelegate = self
    }
    
    func animationControllerForPresentedController(presented: UIViewController!, presentingController presenting: UIViewController!, sourceController source: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = true
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = false
        return self
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return duration
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {

        var containerView = transitionContext.containerView()
        var toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        var fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        
        if (isPresenting) {
            containerView.addSubview(toViewController.view)
            var composeVC = toViewController as ComposeViewController
            toViewController.view.alpha = 0
            
            var textButtonInitialY = composeVC.textButton.center.y + 300
            var textButtonFinalY = composeVC.textButton.center.y
            
            var photoButtonInitialY = composeVC.photoButton.center.y + 300
            var photoButtonFinalY = composeVC.photoButton.center.y
            
            var quoteButtonInitialY = composeVC.quoteButton.center.y + 300
            var quoteButtonFinalY = composeVC.quoteButton.center.y
            
            var chatButtonInitialY = composeVC.chatButton.center.y + 300
            var chatButtonFinalY = composeVC.chatButton.center.y
            
            var linkButtonInitialY = composeVC.linkButton.center.y + 300
            var linkButtonFinalY = composeVC.linkButton.center.y
            
            var videoButtonInitialY = composeVC.videoButton.center.y + 300
            var videoButtonFinalY = composeVC.videoButton.center.y
            
            composeVC.textButton.center.y = textButtonInitialY
            composeVC.photoButton.center.y = photoButtonInitialY
            composeVC.quoteButton.center.y = quoteButtonInitialY
            composeVC.linkButton.center.y = linkButtonInitialY
            composeVC.chatButton.center.y = chatButtonInitialY
            composeVC.videoButton.center.y = videoButtonInitialY
            
            UIView.animateWithDuration(0.8, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: nil, animations: { () -> Void in
                composeVC.textButton.center.y = textButtonFinalY
                composeVC.quoteButton.center.y = quoteButtonFinalY
                }, completion: { (Bool) -> Void in
                    //
            })
            
            UIView.animateWithDuration(0.8, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: nil, animations: { () -> Void in
                composeVC.photoButton.center.y = photoButtonFinalY
                composeVC.chatButton.center.y = chatButtonFinalY
                }, completion: { (Bool) -> Void in
                    //
            })
            
            UIView.animateWithDuration(0.8, delay: 0, usingSpringWithDamping: 0.65, initialSpringVelocity: 0, options: nil, animations: { () -> Void in
                composeVC.linkButton.center.y = linkButtonFinalY
                composeVC.videoButton.center.y = videoButtonFinalY
                }, completion: { (Bool) -> Void in
                    //
            })
            
            UIView.animateWithDuration(0.45, animations: { () -> Void in
                toViewController.view.alpha = 1
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
            }
        } else {
            var composeVC = fromViewController as ComposeViewController
            var textButtonEndY = composeVC.textButton.center.y - 300
            var photoButtonEndY = composeVC.photoButton.center.y - 300
            var quoteButtonEndY = composeVC.quoteButton.center.y - 300
            var chatButtonEndY = composeVC.chatButton.center.y - 300
            var linkButtonEndY = composeVC.linkButton.center.y - 300
            var videoButtonEndY = composeVC.videoButton.center.y - 300
            
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                composeVC.quoteButton.center.y = quoteButtonEndY
                composeVC.chatButton.center.y = chatButtonEndY
                composeVC.textButton.center.y = textButtonEndY
            })
            
            UIView.animateWithDuration(duration, animations: { () -> Void in
                fromViewController.view.alpha = 0
                composeVC.photoButton.center.y = photoButtonEndY
                composeVC.linkButton.center.y = linkButtonEndY
                composeVC.videoButton.center.y = videoButtonEndY
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
                    fromViewController.view.removeFromSuperview()
            }
        }
    }




}
