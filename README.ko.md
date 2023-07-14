# xsd2jar

### 개요

xsd 파일을 분석해서, 각각 jar 파일로 변환해줍니다. 

`docker container` 기반으로 작동하기 때문에, 호스트 머신의 java 버전을 고려하지 않아도 됩니다.

### 사용 가이드

1. `xsd` 디렉토리 안에 변환을 원하는 파일을 배치합니다. 예시는 아래와 같습니다. 

```
./xsd
├── animals
│   ├── Cat.xsd
│   ├── Dog.xsd
├── students
    ├── Liam.xsd
    └── John.xsd
```

2. [docker](https://docs.docker.com/get-docker/)가 설치되어 있어야 합니다.

3. `xsd2jar` 프로젝트를 `clone` 받습니다.
```
git@github.com:kimjbstar/xsd2jar.git
```

3. `docker compose up` 을 통해 컨테이너를 실행시킵니다. 

4. 디렉토리와 동명의 `jar` 파일들이 생성되었는지 확인합니다.

```
./xsd
├── animals
│   ├── Cat.xsd
│   ├── Dog.xsd
├── students
│   ├── Liam.xsd
│   └── John.xsd
├── animals.jar
└── students.jar
```