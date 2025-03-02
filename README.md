# 레포지토리 이름

## 강의 정보

### 주제
{ }

### 영상 링크
{ }

---
### FVM(Flutter Version Management) 설정

1. FVM 설치
```bash
# macOS & Linux
brew tap leoafarias/fvm
brew install fvm

# Windows
choco install fvm

# 또는 dart pub으로 설치
dart pub global activate fvm
```

2. Flutter 버전 설치 및 설정
```bash
# 프로젝트 디렉토리로 이동
cd your_project_directory

# 프로젝트에 지정된 Flutter 버전 설치
fvm install

# 현재 프로젝트에 Flutter 버전 적용
fvm use

# (선택사항) 전역 Flutter 버전 설정
fvm global {version}
```

3. IDE 설정 ( 문제가 발생하는 경우에만 )
    - VS Code: FVM 확장 프로그램 설치
    - Android Studio: Flutter SDK 경로를 .fvm/flutter_sdk로 설정

### 프로젝트 실행

```bash
# 의존성 설치
fvm flutter pub get

# 개발 모드로 실행
fvm flutter run
```

---

## 📝 라이센스

본 저장소의 모든 교육 자료는 MIT 라이센스 하에 제공됩니다. 다음과 같은 활동이 가능합니다:

- 자유로운 사용
- 수정 및 재배포
- 상업적 활용

---

## 🤝 기여하기

우리는 커뮤니티의 기여를 환영합니다:

1. 새로운 교육 자료 제작
2. 기존 자료 개선 및 업데이트
3. 오류 수정
4. 번역 작업

기여하시려면 Pull Request를 보내주세요.