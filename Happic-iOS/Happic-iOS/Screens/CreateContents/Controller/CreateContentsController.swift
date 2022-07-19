//
//  CreateContentsController.swift
//  Happic-iOS
//
//  Created by devxsby on 2022/07/14.
//

import UIKit

final class CreateContentsController: UIViewController {
    
    // MARK: - Properties
    var allMeridiem: [String] = ["오전", "오후"]
    var allHour: [String] = ["1시", "2시", "3시", "4시", "5시", "6시", "7시", "8시", "9시", "10시", "11시", "12시"]
    
    // MARK: - UI
    private lazy var headerView = UIView()
    private lazy var scrollView = UIScrollView()
    private lazy var containerView = UIView()
    private lazy var whenPicker = UIPickerView()
    private lazy var whenTagView = CustomRecommendTagView()
    private lazy var whereTagView = CustomRecommendTagView()
    private lazy var whoTagView = CustomRecommendTagView()
    private lazy var whatTagView = CustomRecommendTagView()
    
    private lazy var backButton = UIButton(type: .system).then {
        $0.setImage(ImageLiterals.icnLeft, for: .normal)
        $0.tintColor = .hpWhite
        $0.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        $0.addTarget(self, action: #selector(dismissViewController), for: .touchUpInside)
    }
    
    private let dateLabel = UILabel().then {
        $0.text = "07.20 해픽"
        $0.textColor = .hpWhite
        $0.font = UIFont.font(.pretendardBold, ofSize: 16)
    }
    
    private let saveButton = UIButton(type: .system).then {
        $0.setAttributedTitle(NSAttributedString(string: "저장", attributes: [.font: UIFont.font(.pretendardBold, ofSize: 16)]), for: .normal)
        $0.setTitleColor(.hpGray6, for: .normal)
    }
    
    var pickerImageView = UIImageView().then {
        $0.image = ImageLiterals.imageDailySample3
        $0.contentMode = .scaleAspectFill
        $0.layer.masksToBounds = true
        $0.layer.cornerRadius = 12
    }
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setDelegate()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = false
    }
    
    // MARK: - Functions
    private func configureUI() {
        setPurpleBackgroundColor()
        setHeaderView()
        setScrollView()
        configPickerView()
    }
    
    private func setDelegate() {
        whenTagView.delegate = self
        whereTagView.delegate = self
        whoTagView.delegate = self
        whatTagView.delegate = self
        
        scrollView.delegate = self
    }
    
    private func setHeaderView() {
        
        view.addSubview(headerView)
        headerView.addSubviews(backButton, dateLabel, saveButton)
                
        headerView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(65)
        }
        
        backButton.snp.makeConstraints { make in
            make.centerY.equalTo(headerView)
            make.leading.equalTo(headerView.snp.leading).offset(20)
            make.width.height.equalTo(48)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.center.equalTo(headerView)
        }
        
        saveButton.snp.makeConstraints { make in
            make.centerY.equalTo(headerView)
            make.trailing.equalTo(headerView.snp.trailing).inset(20)
            make.width.height.equalTo(48)
        }
    }
    
    private func setScrollView() {
        
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubview(pickerImageView)
        
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom)
            make.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        containerView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView.contentLayoutGuide)
            make.width.equalTo(scrollView.snp.width)
            make.height.greaterThanOrEqualTo(scrollView.snp.height).priority(500)
        }
        
        pickerImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(300.adjusted)
        }
        
        let tagStacks = UIStackView(arrangedSubviews: [whenTagView, whereTagView, whoTagView, whatTagView])
        tagStacks.axis = .vertical
        tagStacks.spacing = 8
        tagStacks.distribution = .fill
        
        containerView.addSubview(tagStacks)
        tagStacks.snp.makeConstraints { make in
            make.top.equalTo(pickerImageView.snp.bottom).offset(32)
            make.leading.trailing.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().inset(400)
        }
        
        hideKeyboardWhenTappedAround()
        
        whenTagView.tagLabel.text = "#when"
        whenTagView.userTextField.placeholder = "시간을 입력해주세요"
        
        whereTagView.tagLabel.text = "#where"
        whereTagView.userTextField.placeholder = "장소을 입력해주세요"
        
        whoTagView.tagLabel.text = "#who"
        whoTagView.userTextField.placeholder = "함께한 사람을 입력해주세요"
        
        whatTagView.tagLabel.text = "#what"
        whatTagView.userTextField.placeholder = "무엇을 했는지 입력해주세요"
    }
    
    @objc private func dismissViewController() {
        self.dismiss(animated: true)
    }
}

// MARK: - Extensions
extension CreateContentsController: UIPickerViewDelegate, UIPickerViewDataSource {
    func configPickerView() {
        whenPicker.delegate = self
        whenPicker.dataSource = self
        
        whenTagView.userTextField.inputView = whenPicker
        configToolbar()
    }
    
    func configToolbar() {
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 35))
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor.white
        toolBar.sizeToFit()
        
        let doneBT = UIBarButtonItem(title: "완료", style: .plain, target: self, action: #selector(self.donePicker))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelBT = UIBarButtonItem(title: "취소", style: .plain, target: self, action: #selector(self.cancelPicker))
        
        toolBar.setItems([cancelBT, flexibleSpace, doneBT], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        whenTagView.userTextField.inputAccessoryView = toolBar
    }
    
    @objc func donePicker() {
        let row = self.whenPicker.selectedRow(inComponent: 0)
        self.whenTagView.userTextField.text = self.allMeridiem[row] + self.allHour[row]
        self.whenTagView.userTextField.resignFirstResponder()
    }

    @objc func cancelPicker() {
        self.whenTagView.userTextField.text = nil
        self.whenTagView.userTextField.resignFirstResponder()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return allMeridiem.count
        case 1:
            return allHour.count
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            return"\(allMeridiem[row])"
        case 1:
            return "\(allHour[row])"
        default:
            return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // 에러 수정 필요
        self.whenTagView.userTextField.text = self.allMeridiem[row] + self.allHour[row]
    }
}

// MARK: - Extensions
extension CreateContentsController: CustomRecommendTagViewDelgegate {
    func scrollUp(_ view: CustomRecommendTagView) {
        let height = view.frame.size.height
        let offset = CGPoint(x: 0, y: view.frame.origin.y + height)
        scrollView.setContentOffset(offset, animated: true)
    }
}

extension CreateContentsController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y < 50 {
            UIView.animate(withDuration: 0.5) {
                self.pickerImageView.transform = CGAffineTransform.identity
                self.whenTagView.superview?.transform = CGAffineTransform.identity
            }
        } else {
            UIView.animate(withDuration: 0.5) {
                self.pickerImageView.transform = CGAffineTransform(scaleX: 1/3, y: 1/3)
                self.whenTagView.superview?.transform = CGAffineTransform(translationX: 0, y: -100)
            }
        }
    }
}
