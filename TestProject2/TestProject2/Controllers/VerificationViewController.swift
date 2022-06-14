//
//  ViewController.swift
//  TestProject2
//
//  Created by Erzhan Kasymov on 12/4/22.
//

import UIKit

final class VerificationViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let backgroundImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "background")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let statusLabel = StatusLabel()
    private let mailTextField = MailTextField()
    private let verificationButton = VerificationButton()
    private let collectionView: MailCollectionView = .init(frame: .zero,
                                                           collectionViewLayout: UICollectionViewFlowLayout())
    private lazy var stackView = UIStackView(arrangedSubviews:
                                                [mailTextField,
                                                 verificationButton,
                                                 collectionView],
                                             axis: .vertical,
                                             spacing: 20)
    // MARK: - Properties
    
    private let verificationModel = VerificationModel()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        configureDelegates()
        setConstraints()
    }
    
    // MARK: - Configure
    
    private func setupViews(){
        
        view.addSubview(backgroundImageView)
        view.addSubview(statusLabel)
        view.addSubview(stackView)
        verificationButton.addTarget(self,
                                     action: #selector(verificationButtonTapped),
                                     for: .touchUpInside)
    }
    
    private func configureDelegates(){
        collectionView.dataSource = self
        collectionView.selectMailDelegate = self
        mailTextField.textFieldDelegate = self
    }
    
    // MARK: - Actions
    
    @objc private func verificationButtonTapped(){
        guard let mail = mailTextField.text else { return }
        
        NetworkDataFetch.shared.fetchMail(verifiableMail: mail) { result, error in
            if error == nil {
                guard let result = result else {return}
            }
        }
    }
    
}
//MARK: UICollectionViewDataSource

extension VerificationViewController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        verificationModel.filtredMailArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: IdCell.idMailCell.rawValue,
                                                            for:indexPath) as? MailCollectionViewCell
        else {return UICollectionViewCell()}
        
        let mailLabelText = verificationModel.filtredMailArray[indexPath.row]
        cell.cellConfigure(mailLabelText: mailLabelText)
        
        return cell
    }
}
//MARK:SelectProposeMailProtocol
extension VerificationViewController: SelectProposeMailProtocol {
    func selectProposedMail(indexPath: IndexPath) {
        guard let text = mailTextField.text else {return}
        verificationModel.getMailName(text: text)
        let domainMail = verificationModel.filtredMailArray[indexPath.row]
        let mailFullName = verificationModel.nameMail + domainMail
        mailTextField.text = mailFullName
        statusLabel.isValid = mailFullName.isValid()
        verificationButton.isValid = mailFullName.isValid()
        verificationModel.filtredMailArray = []
        collectionView.reloadData()
    }
}

//MARK: ActionsMailTextFieldProtocol

extension VerificationViewController: ActionsMailTextFieldProtocol{
    func typingText(text: String) {
        statusLabel.isValid = text.isValid()
        verificationButton.isValid = text.isValid()
        verificationModel.getFiltredMail(text: text)
        collectionView.reloadData()
    }
    
    func cleanOutTextField() {
        statusLabel.setDefaultSetting()
        verificationButton.setDefaultSetting()
        verificationModel.filtredMailArray = []
        collectionView.reloadData()
    }
}

// MARK: - Setup Constraints

extension VerificationViewController{
    
    private func setConstraints() {
        [backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
         backgroundImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ].forEach { $0.isActive = true }
        
        [statusLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 400),
         statusLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 120),
         statusLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20)
        ].forEach { $0.isActive = true }
        
        [mailTextField.heightAnchor.constraint(equalToConstant: 50),
         stackView.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 20),
         stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
         stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
         stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: 0)
        ].forEach { $0.isActive = true }
    }
}


