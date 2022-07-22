//
//  CreateContentsController.swift
//  Happic-iOS
//
//  Created by devxsby on 2022/07/14.
//

import UIKit

// MARK: - Protocols
protocol CreateContentsControllerDelegate: AnyObject {
    func showToastAfterCreating(_ message: String)
}

final class CreateContentsController: UIViewController {
    
    // MARK: - Properties
    weak var delegate: CreateContentsControllerDelegate?
    private var photoURL: String?
    var allMeridiem: [String] = ["오전", "오후"]
    var allHour: [String] = ["1시", "2시", "3시", "4시", "5시", "6시", "7시", "8시", "9시", "10시", "11시", "12시"]
    var leftPickerValue: String = "오전"
    var rightPickerValue: String = "1시"
    
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
        $0.textColor = .hpWhite
        $0.font = UIFont.font(.pretendardBold, ofSize: 16)
    }
    
    private lazy var saveButton = UIButton(type: .system).then {
        $0.setAttributedTitle(NSAttributedString(string: "저장", attributes: [.font: UIFont.font(.pretendardBold, ofSize: 16), .foregroundColor: UIColor.hpOrange]), for: .normal)
        $0.setAttributedTitle(NSAttributedString(string: "저장", attributes: [.font: UIFont.font(.pretendardBold, ofSize: 16), .foregroundColor: UIColor.hpGray6]), for: .disabled)
        $0.addTarget(self, action: #selector(saveButtonDidTap), for: .touchUpInside)
        $0.isEnabled = false
    }
    
    var pickerImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.layer.masksToBounds = true
        $0.layer.cornerRadius = 12
    }
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setDelegate()
        uploadImage()
        getRecommendTag()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        addKeyboardObserver()
        tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = false
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
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
        
        whenPicker.delegate = self
        whenPicker.dataSource = self
    }
    
    private func setHeaderView() {
        
        view.addSubview(headerView)
        headerView.addSubviews(backButton, dateLabel, saveButton)
        
        setCurrentDateLabel()
        setHeaderViewShadow()
                
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
        
        setTagLabel()
        
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
        
        let tagStackView = UIStackView(arrangedSubviews: [whenTagView, whereTagView, whoTagView, whatTagView])
        tagStackView.axis = .vertical
        tagStackView.spacing = 8
        tagStackView.distribution = .fill
        
        containerView.addSubview(tagStackView)
        tagStackView.snp.makeConstraints { make in
            make.top.equalTo(pickerImageView.snp.bottom).offset(32)
            make.leading.trailing.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().inset(100.adjustedH)
        }
    }
    
    private func addKeyboardObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardUp), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDown), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardUp(notification: NSNotification) {
        whenTagView.superview?.snp.updateConstraints { make in
            make.bottom.equalToSuperview().inset(160.adjustedH)
        }
    }
    
    @objc func keyboardDown() {
        whenTagView.superview?.snp.updateConstraints { make in
            make.bottom.equalToSuperview().inset(100.adjustedH)
        }
    }
    
    private func setCurrentDateLabel() {
        let date = Date()
        let todayMonth = Calendar.current.dateComponents([.month], from: date)
        let todayDay = Calendar.current.dateComponents([.day], from: date)
        
        guard let month = todayMonth.month,
              let day = todayDay.day else { return }
        
        var monthStr = String(month)
        let dayStr = String(day)
        if monthStr.count == 1 {
            monthStr = "0\(monthStr)"
        }
        self.dateLabel.text = "\(monthStr).\(dayStr) 해픽"
    }
    
    private func setHeaderViewShadow() {
        headerView.layer.masksToBounds = false
        headerView.layer.shadowColor = UIColor.black.cgColor
        headerView.layer.shadowRadius = 4 / 2.0
        headerView.layer.shadowPath = CGPath.init(rect: CGRect.init(x: 0, y: 65, width: UIScreen.main.bounds.width, height: 4), transform: nil)
        headerView.layer.shadowOpacity = 0.25
        headerView.layer.shadowOffset = CGSize(width: 0, height: 4)
    }
    
    private func setTagLabel() {
        whenTagView.tagLabel.text = "#when"
        whenTagView.userTextField.attributedPlaceholder = NSAttributedString(string: "시간을 입력해주세요", attributes: [.foregroundColor: UIColor.hpGray6])
        
        whereTagView.tagLabel.text = "#where"
        whereTagView.userTextField.attributedPlaceholder = NSAttributedString(string: "장소를 입력해주세요", attributes: [.foregroundColor: UIColor.hpGray6])
        
        whoTagView.tagLabel.text = "#who"
        whoTagView.userTextField.attributedPlaceholder = NSAttributedString(string: "함께한 사람을 입력해주세요", attributes: [.foregroundColor: UIColor.hpGray6])
        
        whatTagView.tagLabel.text = "#what"
        whatTagView.userTextField.attributedPlaceholder = NSAttributedString(string: "무엇을 했는지 입력해주세요", attributes: [.foregroundColor: UIColor.hpGray6])
    }
    
    @objc private func dismissViewController() {
        self.dismiss(animated: true)
    }
    
    @objc private func saveButtonDidTap() {
        createHaruHappic()
    }
}

// MARK: - Extensions
extension CreateContentsController: UIPickerViewDelegate, UIPickerViewDataSource {
    func configPickerView() {
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
        self.whenTagView.userTextField.resignFirstResponder()
        self.whenTagView.userTextField.text = leftPickerValue + rightPickerValue
        validateCheck()
    }

    @objc func cancelPicker() {
        self.whenTagView.userTextField.text = nil
        self.whenTagView.userTextField.resignFirstResponder()
        validateCheck()
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
        switch component {
        case 0:
            leftPickerValue = self.allMeridiem[row]
        case 1:
            rightPickerValue = self.allHour[row]
        default:
            break
        }
        self.whenTagView.userTextField.text = leftPickerValue + rightPickerValue
    }
}

// MARK: - Extensions
extension CreateContentsController: CustomRecommendTagViewDelgegate {
    func validateCheck() {
        let hasText = [whenTagView, whereTagView, whoTagView, whatTagView].allSatisfy {
            $0.hasText
        }
        saveButton.isEnabled = hasText
    }
    
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
                self.pickerImageView.superview?.transform = CGAffineTransform.identity
                self.whenTagView.superview?.transform = CGAffineTransform.identity
            }
        } else {
            UIView.animate(withDuration: 0.5) {
                self.pickerImageView.transform = CGAffineTransform(scaleX: 0.3, y: 0.3)
                self.pickerImageView.superview?.transform = CGAffineTransform(translationX: 0, y: -40.adjustedH)
                self.whenTagView.superview?.transform = CGAffineTransform(translationX: 0, y: -110.adjustedH)
            }
        }
    }
}

// MARK: - Network
extension CreateContentsController {
    func uploadImage() {
        guard let image = self.pickerImageView.image else { return }
        CreateContentsService.shared.uploadImage(imageData: image) { response in
            switch response {
            case .success(let result):
                guard let data = result as? UploadImageModel else { return }
                print(data)
                self.photoURL = data.id
            default:
                break
            }
        }
    }
    
    func getRecommendTag() {
        CreateContentsService.shared.getRecommendTag { response in
            switch response {
            case .success(let result):
                guard let data = result as? RecommendTagModel else { return }
                self.whereTagView.setData(tags: data.place)
                self.whoTagView.setData(tags: data.who)
                self.whatTagView.setData(tags: data.what)
            default:
                break
            }
        }
    }
    
    func createHaruHappic() {
        guard let photo = photoURL,
              let when = whenTagView.userTextField.text,
              let place = whereTagView.userTextField.text,
              let who = whoTagView.userTextField.text,
              let what = whatTagView.userTextField.text else { return }
        CreateContentsService.shared.createHaruHappic(photo: photo, when: when, place: place, who: who, what: what) { response in
            switch response {
            case .success:
                self.dismissViewController()
                self.delegate?.showToastAfterCreating("오늘의 해픽을 등록했어요")
            default:
                self.dismissViewController()
                self.delegate?.showToastAfterCreating("\(response)")
            }
        }
    }
}
