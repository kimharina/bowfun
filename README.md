# Bowfun
    애견용품 쇼핑몰 사이트를 AWS로 인프라 및 CI/CD를 구축하고 
    S3에 게시글 파일이나 이미지가 업로드 되도록 연결했습니다. 
    세일이나 소비자들이 몰릴 때를 대비해 CloudWatch를 통해 AutoScale되도록 구성하였습니다.

**진행기간**

     2023/11/20 → 2023/12/01

**사용스킬**

      AWS codepipeline, MariaDB


# **1. 프로젝트 구성**

<aside>
  
📌 **RDS** : MariaDB를 채택함에 따라 기존 Oracle → MariaDB로 변경

**CI/CD** : AWS codepipeline

**Route 53** : 도메인(boufun.link)을 통해 연결되도록 구성

**Auto Scaling** : 소비자들이 몰릴 때를 대비해 CloudWatch를 통해 AutoScale되도록 구성          

**S3** : 게시글에  파일이나 이미지가 업로드 되도록 연결

</aside>

### ✔️ **나의 담당 기능**

- AWS codepipeline
- AWS cloudwatch

### ✔️codepipeline yml 파일

- buildspec.yml

```yaml
version: 0.2

phases:
  install:
    runtime-versions:
      java: corretto17

  build:
    commands:
      - echo "Build started on `date`"
      - cd $CODEBUILD_SRC_DIR
      - mvn clean package -f bowfun/pom.xml
  post_build:
    commands:
      - echo "Build completed on `date`"
      - cd $CODEBUILD_SRC_DIR/bowfun
      - ls -R
artifacts:
  files:
    - bowfun/target/bowfun-0.0.1-SNAPSHOT.war
    - bowfun/appspec.yml  # CodeDeploy 추가
    - bowfun/scripts/**   # CodeDeploy 추가
  discard-paths: yes
  
cache:
  paths:
    - '/root/.m2/**/*'
```

- appspec.yml

```yaml
version: 0.0  # CodeDeploy 버전
os: linux
files:    
  - source: bowfun-0.0.1-SNAPSHOT.war
    destination: /home/ubuntu  # source에서 지정된 파일을 받을 위치

permissions: # CodeDeploy에서 EC2서버로 넘겨준 파일들은 모두 ec2-user권한을 갖도록 설정
  - object: /
    pattern: "**"
    owner: tomcat
    group: tomcat
    
hooks:
  AfterInstall:  # 배포를 완료한 후 실행되는 스크립트
    - location: restart.sh
      timeout: 60
      runas: root
```

## 3. 보완점 및 느낀점

pipeline을 위한 yaml 파일 작성을 처음 해보다 보니 많은 시간이 걸렸는데 오류 로그들을 찾아가면서 하나씩 수정해나가다 보니 해결할 수 있었습니다. yaml파일을 작성하는 것이 정말 중요하다는 것을 알게 되었습니다. 앞으로 좀 더 다양한 방식으로 작성해볼 수 있도록 시도해보고 싶습니다. 

프로젝트 기간이  짧아서 좀 더 많은 AWS기능들을 적용하지 못한 것이 아쉬웠습니다. WAF  같은 기능들도 좀 더 넣고 보안 쪽으로도 더 강화해보고 싶습니다.
