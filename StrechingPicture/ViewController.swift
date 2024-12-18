//
//  ViewController.swift
//  StrechingPicture
//
//  Created by admin on 21.11.2024.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    private static var defaultImageHeight: CGFloat = 270
    
    // MARK: - Views
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        
        view.delegate = self
        view.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 2)
        
        return view
    }()
    
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "CatGrass")
        return view
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupViews()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        scrollView.frame = view.bounds
        imageView.frame = .init(
            x: .zero,
            y: -scrollView.safeAreaInsets.top,
            width: scrollView.frame.width,
            height: Self.defaultImageHeight
        )
    }
    
    // MARK: - Setup Views
    func setupViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
    }
}

// MARK: - UIScrollViewDelegate
extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y = scrollView.contentOffset.y + scrollView.safeAreaInsets.top
        
        if y < 0 {
            imageView.frame = .init(x: .zero, y: -scrollView.safeAreaInsets.top + y, width: scrollView.frame.width, height: Self.defaultImageHeight + abs(y))
        }
        
        scrollView.verticalScrollIndicatorInsets.top = imageView.frame.height - scrollView.safeAreaInsets.top
    }
}
