//
//  OnboardingViewController.swift
//  DevMuscles
//
//  Created by Вячеслав Вовк on 10.02.2024.
//

import UIKit
import SnapKit

class OnboardingViewController: UIViewController {
//    private var disposeBag = DisposeBag()
    
    // MARK: - Private Properties
    private var pages = [UIViewController]()
    
    
    // MARK: - Private Views
    private let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
    private let pageControl = UIPageControl()
    var viewOutput: OnboardingViewOutput!
    
    init(pages: [UIViewController] = [UIViewController](), viewOutput: OnboardingViewOutput!) {
        self.viewOutput = viewOutput
        self.pages = pages
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        setupPageControl()
        makeConstraints()
        view.backgroundColor = AppColors.accentGreen
    }
    
    
    // MARK: - Private Constants
//    private enum Constants {
//
//    }
    
}

// MARK: - Private Setup
private extension OnboardingViewController {
    
    func initialize() {
        
        pageViewController.delegate = self
        pageViewController.dataSource = self
        
        pageViewController.setViewControllers([pages.first!], direction: .forward, animated: true)
        
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.didMove(toParent: self)
    }
    
    func setupPageControl() {
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = 0
        pageControl.isUserInteractionEnabled = false
        view.addSubview(pageControl)
        pageControl.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(30)
        }
    }
    
    
    // MARK: - Constraints
    func makeConstraints() {
        
    }
}


// MARK: - UIPageViewControllerDataSource delegate
extension OnboardingViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = pages.firstIndex(of: viewController), currentIndex > 0 else { return nil}
        if pages[currentIndex - 1] == pages.last! { return nil }
        return pages[currentIndex - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController), currentIndex < pages.count - 1 else {
            viewOutput.onboardingFinish()
            return nil }
        return pages[currentIndex + 1]
    }
    
    
}

// MARK: - UIPageViewController delegate
extension OnboardingViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        if let index = pages.firstIndex(of: pendingViewControllers.first!) {
            pageControl.currentPage = index
        }
    }
}
