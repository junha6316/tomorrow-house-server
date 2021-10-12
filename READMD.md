# 환경 세팅

* pipenv shell # 가상환경 세팅
* pipenv install # 프로젝트에 필요한 패키지 다운로드

# 실행 방법

* 루트 디렉토리에 있는 start.sh 실행
    맥의 경우 명령어 sh start.sh 
    윈도우 https://whareview.tistory.com/13
* 실행시키면 "localhost:8000"에서 서버가 돌아가고 크롬에서 localhost:8000으로 접근 가능


# 토큰 관련 API

1. 로그인
POST /api/v1/users/token/
parameter
    - username : 유저 이를
    - password : 비밀 번호

response
    - 회원정보가 제대로 입력되지 않았을 때 : HTTP 400, 회원정보가 입력되지 않았습니다.
    - 정상적으로 동작할 때 : HTTP 200, {'access_token': 'test', 'refresh_token' : 'this is test'}
    - 해당하는 회원 정보가 존재하지 않을 때: HTTP 401 UnAuthorized


2. 토큰 갱신
POST /api/v1/users/token/refresh/
parameter
    - refresh_token: 리프레쉬 토큰 

response 
    - 파라미터를 제대로 입력하지 않았다면 : HTTP 400 . 토큰이 입력되지 않았습니다.
    - 보낸 리프레쉬 토큰괴 데이터 베이스 내부의 토큰 값이 다르다면 : HTTP 400. Refresh Token is invalid
    - 리프레쉬 토큰이 만료되었다: HTTP 400, Refresh Token is Outdated
    - 보낸 정보의 유저가 존재하지 않는다면 : HTTP 400, Token is Invalid
    - 정상적인 토큰이라면: HTTP 200, {'access_token' : 'this is example'}