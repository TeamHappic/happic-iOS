<img src = "https://user-images.githubusercontent.com/80062632/178316819-9873c137-bcbc-4162-afae-095e1a8e99ce.png">  <br>

# happic:

**하루 한 컷의 사진과 키워드 분석이 알려주는 나의 행복, 해픽**

> SOPT 30th APP JAM <br>
> 프로젝트 기간 : 2021.07.02 ~ 2021.07.23


<br>
<br>

![happic](https://user-images.githubusercontent.com/80062632/180698857-bb5d84e9-71cf-46a5-9282-846b9333f80a.jpeg)


<br>
<br>

##  Team happic iOS Developers
 <img src="https://user-images.githubusercontent.com/80062632/178317953-4de3c159-44bd-4416-a911-4deb97a1c329.png" width="500"> | <img src="https://user-images.githubusercontent.com/80062632/178318062-ee2432b3-7fc9-4c61-a434-98cf4e25b285.png" width="500"> | <img src="https://user-images.githubusercontent.com/80062632/178318144-7ba5a4f6-3db1-4fce-b4ac-8fb684f45989.png" width="500"> |
 :---------:|:----------:|:---------:
 이세진 | 윤수빈 | 강승현 |
[lsj8706](https://github.com/lsj8706) | [devxsby](https://github.com/devxsby) | [ZaidKang](https://github.com/ZaidKang) |

<br>
<br>

## Development Environment and Using Library
- Development Environment
<p align="left">
<img src ="https://img.shields.io/badge/Swift-5.5-orange?logo=swift">
<img src ="https://img.shields.io/badge/Xcode-13.4-blue?logo=xcode">
<img src ="https://img.shields.io/badge/iOS-14.0-green.svg">

<br>
<br>

- Library

라이브러리 | 사용 목적 | Version | Management Tool
:---------:|:----------:|:---------: |:---------:
 Alamofire | 서버 통신 | 5.6.1 | SPM
 SnapKit | UI Layout | 5.0.0 | SPM
 Then | UI 선언 | 3.0.0 | SPM
 Kingfisher | 이미지 처리 | 7.2.4 | SPM
 Tabman | 뷰 페이저 커스텀 | 2.12.0 | SPM
 pageboy  | 뷰 페이저 커스텀 | 3.6.2 | SPM
 
 <br>

- framework

프레임워크 | 사용 목적 
:---------:|:----------:
 UIKit | UI 구현

<br>
<br>

## Coding Convention
<details>
 <summary> ✨ Git Branch Convention </summary>
 <div markdown="1">       

 ---
 
 - **Branch Naming Rule**
    - Issue 작성 후 생성되는 번호와 Issue의 간략한 설명 등을 조합하여 Branch 이름 결정
    - `<Prefix>/<#IssueNumber>-<Description>`
- **Commit Message Rule**
    - `[Prefix] : <Description>`
- **Code Review Rule**
    - 코드 리뷰는 최대한 빨리 한다.
    - 코드 리뷰는 최대한 정성껏 한다.
   
 <br>

 </div>
 </details>

 <details>
 <summary> ✨ Git Flow </summary>
 <div markdown="1">       

 ---
 
 ```
1. 작업 단위별 Issue 생성 : 담당자, 라벨, 프로젝트 연결 

2. Fork 받은 로컬 레포에서 develop 브랜치 최신화 : git pull (origin develop) 

3. Branch 생성 : git switch -c Prefix/#IssueNumber-description 
   > 예시) chore/#3-Project-Setting

4. 로컬 환경에서 작업 후 Add -> Commit -> Push -> Pull Request의 과정을 거친다.
   
   Prefix의 의미
   > [Feat] : 새로운 기능 구현
   > [Chore] : 그 이외의 잡일/ 버전 코드 수정, 패키지 구조 변경, 파일 이동, 파일이름 변경
   > [Add] : 코드 변경 없는 단순 파일 추가, 에셋 및 라이브러리 추가
   > [Fix] : 버그, 오류 해결, 코드 수정
   > [Style] : 코드 포맷팅, 코드 변경이 없는 경우, 주석 수정
   > [Docs] : README나 WIKI 등의 문서 개정
   > [Refactor] : 전면 수정이 있을 때 사용합니다
   > [Test] : 테스트 모드, 리펙토링 테스트 코드 추가

5. Pull Request 작성 
   - closed : #IssueNumber로 이슈 연결, 리뷰어 지정

6. Code Review 완료 후 Pull Request 작성자가 develop Branch로 merge하기
   - Develop Branch protection rules : Merge 전 최소 1 Approve 필요

7. 종료된 Issue와 Pull Request의 Label과 Project를 관리
```
   
 <br>

 </div>
 </details>

<details>
 <summary> ✨ Naming & Code Convention </summary>
 <div markdown="1">       

 ---
 
- 함수, 메서드 : **lowerCamelCase** 사용하고, 동사로 시작한다.
- 변수, 상수 : **lowerCamelCase** 사용한다.
- 클래스, 구조체, enum, extension 등 :  **UpperCamelCase** 사용한다.
- 기본 MVC 폴더링 구조에 따라 파일을 구분하여 사용한다.
- 파일, 메서드, 클래스 명 약어 사용 지양한다.
    - 예시) ViewController → `VC (❌)`
    - 예시) CollectionViewCell → `CVC (❌)`
    - 예시) loginButtonDidTap: UIButton  -> `loginBtnTapped (❌)`
- 초기 UI 레이아웃 잡아줄때만 **configure** 키워드를 사용하고, 이외는 **set** 키워드를 사용한다.
    - 예시) func configureUI → `func setUI (❌)`
    - 예시) func setDelegate ... → `func configureDelegate (❌)`
- 이외 기본 명명규칙은 [Swift Style Guide](https://google.github.io/swift/), [API Design Guidelines](https://www.swift.org/documentation/api-design-guidelines/) , [Swift Style Guide](https://github.com/StyleShare/swift-style-guide)를 참고한다.
- 상속받지 않는 클래스는 **final 키워드**를 붙인다.
- 단일 정의 내에서만 사용되는 특정 기능 구현은 **private 접근 제한자**를 적극 사용한다.
- 퀵헬프기능을 활용한 마크업 문법을 활용한 주석을 적극 사용한다.
- 이외는 커스텀한 **SwiftLint Rule**을 적용한다.
   - **제외사항**
   - trailing_whitespace
   - identifier_name
   - line_length
   - type_name
   
   
 <br>

 </div>
 </details>

<details>
 <summary> ✨ Project Foldering </summary>
 <div markdown="1">       

 ---
 ``` 
Happic-iOS
 ┣ Base.lproj
 ┃ ┗ Main.storyboard
 ┣ Global
 ┃ ┣ Literal
 ┃ ┣ Base
 ┃ ┣ Protocols
 ┃ ┣ Util
 ┃ ┣ Extension
 ┃ ┣ Resource
 ┃ ┃ ┣ Assets.xcassets
 ┃ ┃ ┃ ┣ AccentColor.colorset
 ┃ ┃ ┃ ┃ ┗ Contents.json
 ┃ ┃ ┃ ┣ AppIcon.appiconset
 ┃ ┃ ┃ ┃ ┗ Contents.json
 ┃ ┃ ┃ ┗ Contents.json
 ┃ ┃ ┗ Base.lproj
 ┃ ┃ ┃ ┗ LaunchScreen.storyboard
 ┃ ┣ Supports
 ┃ ┃ ┣ AppDelegate.swift
 ┃ ┃ ┗ SceneDelegate.swift
 ┃ ┗ UIComponent
 ┣ Network
 ┃ ┣ APIService
 ┃ ┣ Foundation
 ┃ ┗ Model
 ┣ Screens
 ┃ ┣ Auth
 ┃ ┣ CreateCharacter
 ┃ ┣ CreateContents
 ┃ ┣ HappicCapsule
 ┃ ┣ HappicReport
 ┃ ┣ HaruHappic
 ┃ ┣ Home
 ┃ ┣ Setting
 ┃ ┗ Tabbar
 ┗ Info.plist
```
   
 <br>

 </div>
 </details>

### 

<br>
<br>


## Task

대분류 | 기능 | 구현 여부 | 담당자
:---------:|---------|:----------:|:---------:
 온보딩 | 런치스크린 | <img width=25px src=https://user-images.githubusercontent.com/80062632/178400930-fffb094c-32ce-4b28-8901-527938888f0c.png> | 윤수빈
 &nbsp; | 온보딩 | - | 윤수빈
  회원가입 | 소셜로그인 | <img width=25px src=https://user-images.githubusercontent.com/80062632/178400930-fffb094c-32ce-4b28-8901-527938888f0c.png> | 윤수빈
  &nbsp; | 회원가입, 로그인 뷰 | <img width=25px src=https://user-images.githubusercontent.com/80062632/178400930-fffb094c-32ce-4b28-8901-527938888f0c.png> | 강승현
  &nbsp; | 캐릭터 선택 | <img width=25px src=https://user-images.githubusercontent.com/80062632/178400930-fffb094c-32ce-4b28-8901-527938888f0c.png> | 강승현
  홈 | 캐릭터 뷰 | <img width=25px src=https://user-images.githubusercontent.com/80062632/178400930-fffb094c-32ce-4b28-8901-527938888f0c.png> | 이세진
  하루해픽 | 사진, 태그 뷰 | <img width=25px src=https://user-images.githubusercontent.com/80062632/178400930-fffb094c-32ce-4b28-8901-527938888f0c.png> | 윤수빈
  &nbsp; | 게시글 작성 | <img width=25px src=https://user-images.githubusercontent.com/80062632/178400930-fffb094c-32ce-4b28-8901-527938888f0c.png> | 윤수빈
  &nbsp; | 게시글 상세보기 | <img width=25px src=https://user-images.githubusercontent.com/80062632/178400930-fffb094c-32ce-4b28-8901-527938888f0c.png> | 윤수빈
  해픽캡슐 | 캡슐뽑기 뷰 | <img width=25px src=https://user-images.githubusercontent.com/80062632/178400930-fffb094c-32ce-4b28-8901-527938888f0c.png> | 이세진
  &nbsp; | 푸시 알림 | <img width=25px src=https://user-images.githubusercontent.com/80062632/178400930-fffb094c-32ce-4b28-8901-527938888f0c.png> | 이세진
  해픽레포트 | 전체보기 | <img width=25px src=https://user-images.githubusercontent.com/80062632/178400930-fffb094c-32ce-4b28-8901-527938888f0c.png> | 이세진
  &nbsp; | 키워드 순위 | <img width=25px src=https://user-images.githubusercontent.com/80062632/178400930-fffb094c-32ce-4b28-8901-527938888f0c.png>  | 이세진
  &nbsp; | 카테고리 순위 | <img width=25px src=https://user-images.githubusercontent.com/80062632/178400930-fffb094c-32ce-4b28-8901-527938888f0c.png> | 이세진
  &nbsp; | 월 기록 횟수 | <img width=25px src=https://user-images.githubusercontent.com/80062632/178400930-fffb094c-32ce-4b28-8901-527938888f0c.png> | 이세진
  설정 | 설정 뷰 | <img width=25px src=https://user-images.githubusercontent.com/80062632/178400930-fffb094c-32ce-4b28-8901-527938888f0c.png> | 이세진



<br>
<br>

---
  
### **Be happy, Take a happic:** 

<br>

![Group 2325@3x](https://user-images.githubusercontent.com/80062632/180644073-76bc7d0f-ae17-40a8-9e13-7c99933658c3.png)
