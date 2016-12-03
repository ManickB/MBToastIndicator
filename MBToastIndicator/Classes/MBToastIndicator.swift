//
//  MBToastIndicator.swift
//  MToaster
//
//  Created by ViVID on 12/3/16.
//  Copyright © 2016 ViVID. All rights reserved.
//

import UIKit
let MBScreenWidth = UIScreen.mainScreen().bounds.size.width
let MBScreenHeight = UIScreen.mainScreen().bounds.size.height
let MBtoastMaxWidth   = MBScreenWidth * 0.935
let MBtoastMaxHeight   = 100
let MBtoastMargin_X   = 20
let MBtoastMargin_y   = 10
let MBtoasttoBottom   = 35
let MBtoastCornerRadius  = 0.8
let MBToastFont  = UIFont.systemFontOfSize(15)
let MBToastDefaultAnimationDuration = 0.2
let MBToastDefaultTextColor = UIColor.blackColor()
let MBToastDefaultTextColor_DarkStyle = UIColor.whiteColor()
class MBToastIndicator: NSObject {
    func getToaster(Text : NSString ,TypePosition : NSString)
    {
        var size = CGFloat()
        var Viewrect = CGRect()
        let labelSize = self.getLabelSize(Text)
        let  viewSize = self.getFrameToast(Text)
        let rect = CGRectMake((viewSize.width - labelSize.width)/2, (viewSize.height - labelSize.height)/2, labelSize.width, labelSize.height)
        
        let toastSize = self.getFrameToast(Text)
        if TypePosition == "TOP"
        {
            size = MBScreenHeight/8
            print(MBScreenWidth)
            print(MBScreenHeight)
            print(KeyBoardHeight())
            print(size)
            print(toastSize.height)
            print("Top : \(MBScreenHeight - self.KeyBoardHeight() - CGFloat(size) - toastSize.height)")
            
            Viewrect =  CGRectMake((MBScreenWidth - toastSize.width)/2 ,MBScreenHeight/8, toastSize.width, toastSize.height)
        }
        else if TypePosition == "CENTER"
        {
            size = MBScreenHeight/2
            print("Center : \(MBScreenHeight - self.KeyBoardHeight() - CGFloat(size) - toastSize.height)")
            Viewrect =  CGRectMake((MBScreenWidth - toastSize.width)/2 ,MBScreenHeight/2, toastSize.width, toastSize.height)
        }
        else if TypePosition == "BOTTOM"
        {
            print("KeyBoard : \(self.KeyBoardHeight()))")
            size = MBScreenHeight / 2 + MBScreenHeight / 3
            print("MY : \(size))")
            print("Bottom : \(MBScreenHeight - self.KeyBoardHeight() - CGFloat(MBtoasttoBottom) - toastSize.height))")
            Viewrect =  CGRectMake((MBScreenWidth - toastSize.width)/2 ,MBScreenHeight - self.KeyBoardHeight() - CGFloat(MBtoasttoBottom) - toastSize.height, toastSize.width, toastSize.height)
        }
        let mainView = UIView.init(frame: Viewrect)
        
        mainView.backgroundColor = UIColor.init(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 70)
        mainView.layer.cornerRadius = 5.0
        mainView.layer.shadowColor = UIColor.whiteColor().CGColor
        mainView.layer.shadowOpacity = 1
        mainView.layer.shadowOffset = CGSize.zero
        mainView.layer.shadowRadius = 10
        let label = UILabel.init(frame:rect)
        label.textAlignment = NSTextAlignment.Center
        label.textColor = UIColor.whiteColor()
        label.backgroundColor = UIColor.clearColor()
        label.text = Text as String
        let name = "Baskerville-SemiBoldItalic"
        label.font = UIFont.init(name: name, size: 15)
        print(label.font.pointSize)
        label.layer.cornerRadius = 5.0
        mainView.addSubview(label)
        
        //THis line to enter the view in all viewController
        UIApplication.sharedApplication().keyWindow?.addSubview(mainView)
        
        UIView.animateWithDuration(1.0, delay: 1.0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
            mainView.alpha = 0.0
            }, completion: nil)
    }
    
    func KeyBoardHeight() -> CGFloat
    {
        for window in UIApplication.sharedApplication().windows
        {
            let testwindow = window as UIWindow
            for posssibleKey in testwindow.subviews
            {
                let posssibleKeyBoard  = posssibleKey as UIView
                if posssibleKeyBoard.description .hasPrefix("UIPeripheralHostView") {
                    return posssibleKeyBoard.bounds.size.height
                }
                else if posssibleKeyBoard.description.hasSuffix("UIInputSetContainerView")
                {
                    for hostKeybord in posssibleKeyBoard.subviews
                    {
                        let HostKeyBoard = hostKeybord as UIView
                        if HostKeyBoard.description.hasPrefix("<UIInputSetHost")
                        {
                            return HostKeyBoard.frame.size.height
                        }
                    }
                }
            }
        }
        return 0
    }
    
    func getLabelSize(message : NSString) -> CGSize
    {
        
        let textSize = message.boundingRectWithSize(CGSizeMake(CGFloat(MBtoastMaxWidth) - CGFloat(MBtoastMargin_X)*2,CGFloat(MAXFLOAT)), options: [NSStringDrawingOptions.UsesFontLeading , NSStringDrawingOptions.TruncatesLastVisibleLine , NSStringDrawingOptions.UsesLineFragmentOrigin], attributes: [NSFontAttributeName: MBToastFont], context: nil)
        let size = CGSizeMake(max(textSize.size.width,CGFloat(MBtoastMargin_y * 2)), min(textSize.size.height, CGFloat(MBtoastMaxHeight - MBtoastMargin_y) * 2))
        
        return size
    }
    
    func getFrameToast(ToastMessage : NSString) -> CGSize
    {
        let textSize = self.getLabelSize(ToastMessage)
        let size = CGSizeMake(min(textSize.width + CGFloat(MBtoastMargin_X) * 2, MBtoastMaxWidth), min(textSize.height + CGFloat(MBtoastMargin_y) * 2 , CGFloat(MBtoastMaxHeight)))
        return size
    }

}
