//
//  AboutViewController.swift
//  WoofMeow
//
//  Created by Henry Huang on 7/11/15.
//  Copyright (c) 2015 XiaoHuang. All rights reserved.
//

import UIKit
import MessageUI

class AboutViewController: UIViewController, MFMailComposeViewControllerDelegate {

    @IBOutlet weak var appLogo: UIImageView!
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var shareButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func shareButtonTapped(sender: AnyObject) {
        let firstActivityItem = "Check out this interesting app! WoofMeow! http://xiaohuang.rocks/woofmeow"
        
        let activityViewController: UIActivityViewController = UIActivityViewController(activityItems: [firstActivityItem], applicationActivities: nil)
        
        activityViewController.popoverPresentationController?.sourceView = shareButton
        self.presentViewController(activityViewController, animated: true, completion: nil)
        
    }

    @IBAction func feedbackButtonTapped(sender: AnyObject) {
        let myMailComposerViewController = self.configureMailComposeViewController()
        if MFMailComposeViewController.canSendMail() {
            self.presentViewController(myMailComposerViewController, animated: true, completion: nil)
        } else {
            self.showSendMailErrorAlert()
        }
        
    }
    
    @IBAction func rateButtonTapped(sender: AnyObject) {
        
        let alertController = UIAlertController(title: "Rate WoofMeow!", message: "\nAre you enjoying WoofMeow? Please rate this app in the app store!\nOr please send me your feedback to improve this app!\nThanks!\n\nXiao", preferredStyle: .Alert)
        
        alertController.addAction(UIAlertAction(title: "Rate in AppStore", style: .Default, handler: {
            (action: UIAlertAction!) in
            let urlString = "http://xiaohuang.rocks/woofmeow"
            let url = NSURL(string: urlString)
            UIApplication.sharedApplication().openURL(url!)
        }))
        
        alertController.addAction(UIAlertAction(title: "Send Feedback", style: .Default, handler: { (action: UIAlertAction!) -> Void in
            let myMailComposerViewController = self.configureMailComposeViewController()
            if MFMailComposeViewController.canSendMail() {
                self.presentViewController(myMailComposerViewController, animated: true, completion: nil)
            } else {
                self.showSendMailErrorAlert()
            }
        }))
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: .Default, handler: { (action: UIAlertAction!) -> Void in
        }))
        
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    @IBAction func appLogoTappedHandler (recognizer: UITapGestureRecognizer) {
        if let view = recognizer.view {
            let urlString = "http://xiaohuang.rocks/woofmeow"
            let url = NSURL(string: urlString)
            UIApplication.sharedApplication().openURL(url!)
        }
    }
    
    @IBAction func avatarTappedHandler (recognizer: UITapGestureRecognizer) {
        if let view = recognizer.view {
            let urlString = "http://xiaohuang.rocks"
            let url = NSURL(string: urlString)
            UIApplication.sharedApplication().openURL(url!)
        }
    }
    
    
    // MARK: - MFMailComposeViewControllerDelegate
    
    func configureMailComposeViewController() -> MFMailComposeViewController {
        let myMailComposerViewController = MFMailComposeViewController()
        myMailComposerViewController.mailComposeDelegate = self
        
        myMailComposerViewController.setToRecipients(["henryhuang1989@me.com"])
        myMailComposerViewController.setSubject("WoofMeow Feedback")
        myMailComposerViewController.setMessageBody("Hi Xiao,\n\nI would like to share the following feedback...\n", isHTML: false)
        
        return myMailComposerViewController
    }
    
    func showSendMailErrorAlert() {
        let sendMailErrorAlert = UIAlertView(title: "Unable to send Email", message: "Your device could not send Email. Please check your Email configuration and try again.", delegate: self, cancelButtonTitle: "OK")
        sendMailErrorAlert.show()
    }
    
    func mailComposeController(controller: MFMailComposeViewController!, didFinishWithResult result: MFMailComposeResult, error: NSError!) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
