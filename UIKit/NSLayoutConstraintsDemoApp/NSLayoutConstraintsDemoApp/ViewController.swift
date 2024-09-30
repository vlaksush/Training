//
//  ViewController.swift
//  NSLayoutConstraintsDemoApp
//
//  Created by Ravi Shankar on 11/09/24.
//

import UIKit

class ViewController: UIViewController {
    
    
    private let SCREEN_SIZE = UIScreen.main.bounds
    private let GAP_BETWEEN_VIEWS:CGFloat = 0.08
    
    // Create four Subviews
    
    var topLeftView = UIView()
    var topRightView = UIView()
    var bottomLeftView = UIView()
    var bottomRightView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.red
        
        addViews()
        addConstraints()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK:- Adding Views
    
    func addViews() {
        
        let heightOfSubView = SCREEN_SIZE.height / 2 - SCREEN_SIZE.height * GAP_BETWEEN_VIEWS/2
        let widthOfSubView = SCREEN_SIZE.width / 2 - SCREEN_SIZE.height * GAP_BETWEEN_VIEWS/2
        
        // Calculate the height and size of each views
        
        topLeftView = UIView(frame: CGRect(x: 0, y: 0, width: widthOfSubView, height: heightOfSubView))
        topRightView = UIView(frame: CGRect(x: widthOfSubView + (SCREEN_SIZE.height * GAP_BETWEEN_VIEWS), y: 0, width: widthOfSubView, height: heightOfSubView))
        bottomLeftView = UIView(frame: CGRect(x: 0, y: heightOfSubView + (SCREEN_SIZE.height * GAP_BETWEEN_VIEWS), width: widthOfSubView, height: heightOfSubView))
        bottomRightView = UIView(frame: CGRect(x: widthOfSubView + (SCREEN_SIZE.height * GAP_BETWEEN_VIEWS), y: heightOfSubView + (SCREEN_SIZE.height * GAP_BETWEEN_VIEWS), width: widthOfSubView, height: heightOfSubView))
        
        topLeftView.backgroundColor = UIColor.white
        topRightView.backgroundColor = UIColor.white
        bottomLeftView.backgroundColor = UIColor.white
        bottomRightView.backgroundColor = UIColor.white
        
        view.addSubview(topLeftView)
        view.addSubview(topRightView)
        view.addSubview(bottomLeftView)
        view.addSubview(bottomRightView)
    }
    
    // MARK:- Add Constraints
    
    func addConstraints() {
        addtopLeftViewConstraints()
        addTopRightViewConstraints()
        addBottomLeftViewConstraints()
        addBottomRightViewConstraints()
        addTopBottomConstraints()
        addLeftRightConstraints()
        addEqualWidthConstraints()
        addEqualHeightConstraints()
        disableAutoResizingMasks()
    }
    
    // MARK:- TopLeftView Constraints
    
    func addtopLeftViewConstraints() {
        let topLeftViewLeadingConstraint = NSLayoutConstraint(item: topLeftView, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal
                                                              , toItem: view, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: 0)
        
        let topLeftViewTopConstraint = NSLayoutConstraint(item: topLeftView, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal
                                                          , toItem: view, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: 0)
        
        NSLayoutConstraint.activate([topLeftViewLeadingConstraint, topLeftViewTopConstraint])
    }
    
    // MARK:- TopRightView Constraints
    
    func addTopRightViewConstraints() {
        
        let topRightViewTrailingConstraint = NSLayoutConstraint(item: topRightView, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal
                                                                , toItem: view, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: 0)
        
        let topRightViewTopConstraint = NSLayoutConstraint(item: topRightView, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal
                                                           , toItem: view, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: 0)
        
        NSLayoutConstraint.activate([topRightViewTrailingConstraint, topRightViewTopConstraint])
    }
    
    // MARK:- BottomLeftView Constraints
    
    func addBottomLeftViewConstraints() {
        
        let bottomLeftViewLeadingConstraint = NSLayoutConstraint(item: bottomLeftView, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal
                                                                 , toItem: view, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: 0)
        
        let bottomLeftViewBottomConstraint = NSLayoutConstraint(item: bottomLeftView, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal
                                                                , toItem: view, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: 0)
        
        NSLayoutConstraint.activate([bottomLeftViewLeadingConstraint, bottomLeftViewBottomConstraint])
        
    }
    
    // MARK:- BottomRightView Constraints
    
    func addBottomRightViewConstraints() {
        
        let bottomRightViewTrailingConstraint = NSLayoutConstraint(item: bottomRightView, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal
                                                                   , toItem: view, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: 0)
        
        let bottomRightViewBottomConstraint = NSLayoutConstraint(item: bottomRightView, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal
                                                                 , toItem: view, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: 0)
        
        NSLayoutConstraint.activate([bottomRightViewTrailingConstraint, bottomRightViewBottomConstraint])
    }
    
    // MARK:- TopBottom Constraints
    
    func addTopBottomConstraints() {
        let verticalSpacing1 = NSLayoutConstraint(item: bottomLeftView, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: topLeftView, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: (SCREEN_SIZE.height * GAP_BETWEEN_VIEWS))
        
        let verticalSpacing2 = NSLayoutConstraint(item: bottomRightView, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: topRightView, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: (SCREEN_SIZE.height * GAP_BETWEEN_VIEWS))
        
        
        NSLayoutConstraint.activate([verticalSpacing1, verticalSpacing2])
        
    }
    
    // MARK:- LeftRight Constraints
    
    func addLeftRightConstraints() {
        
        let horizontalSpacing1 = NSLayoutConstraint(item: topRightView, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: topLeftView, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: (SCREEN_SIZE.height * GAP_BETWEEN_VIEWS))
        
        let horizontalSpacing2 = NSLayoutConstraint(item: bottomRightView, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: bottomLeftView, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: (SCREEN_SIZE.height * GAP_BETWEEN_VIEWS))
        
        NSLayoutConstraint.activate([horizontalSpacing1, horizontalSpacing2])
        
    }
    
    // MARK:- Equal Width Constraints
    
    func addEqualWidthConstraints() {
        let topRightViewWidth = NSLayoutConstraint(item: topLeftView, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: topRightView, attribute: NSLayoutConstraint.Attribute.width, multiplier: 1, constant: 0)
        
        let bottomLeftViewWidth = NSLayoutConstraint(item: topLeftView, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: bottomLeftView, attribute: NSLayoutConstraint.Attribute.width, multiplier: 1, constant: 0)
        
        let bottomRightViewWidth = NSLayoutConstraint(item: topLeftView, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: bottomRightView, attribute: NSLayoutConstraint.Attribute.width, multiplier: 1, constant: 0)
        
        NSLayoutConstraint.activate([topRightViewWidth, bottomLeftViewWidth,bottomRightViewWidth ])
    }
    
    
    // MARK:- Equal Height Constraints
    
    func addEqualHeightConstraints() {
        let topRightViewHeight = NSLayoutConstraint(item: topLeftView, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: topRightView, attribute: NSLayoutConstraint.Attribute.height, multiplier: 1, constant: 0)
        
        let bottomLeftViewHeight = NSLayoutConstraint(item: topLeftView, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: bottomLeftView, attribute: NSLayoutConstraint.Attribute.height, multiplier: 1, constant: 0)
        
        let bottomRightViewHeight = NSLayoutConstraint(item: topLeftView, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: bottomRightView, attribute: NSLayoutConstraint.Attribute.height, multiplier: 1, constant: 0)
        
        NSLayoutConstraint.activate([topRightViewHeight, bottomLeftViewHeight,bottomRightViewHeight ])
    }
    
    // MARK:- disable autoResizingMasks
    
    func disableAutoResizingMasks() {
        topLeftView.translatesAutoresizingMaskIntoConstraints = false
        topRightView.translatesAutoresizingMaskIntoConstraints = false
        bottomLeftView.translatesAutoresizingMaskIntoConstraints = false
        bottomRightView.translatesAutoresizingMaskIntoConstraints = false
    }

}


