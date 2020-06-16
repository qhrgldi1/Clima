#  Clima

## Goal
1. 위치 정보를 이용하므로 앱을 실행할 때 사용자의 위치 정보 수집 동의를 얻는다.
2. 중앙 상단의 텍스트 필드에는 도시명을 입력할 수 있다.
3. 유효한 도시명이 입력되면 해당 도시의 날씨 정보를 얻을 수 있다.(날씨 아이콘, 섭씨, 도시명)
4. 좌측 상단의 버튼은 사용자의 현재 위치를 얻을 수 있다.(위도, 경도)
5. 위도 경도에 해당되는 도시의 날씨 정보를 얻을 수 있다.(날씨 아이콘, 섭씨, 도시명)
6. 라이트 모드, 다크 모드 지원

### Condition Codes
```
switch conditionID {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud"
        default:
            return "sun.min"
        }
```

## 실행 화면
[![play](http://img.youtube.com/vi/7fKScEh6Q0/0.jpg)](https://www.youtube.com/watch?v=s7fKScEh6Q0?t=0s)

