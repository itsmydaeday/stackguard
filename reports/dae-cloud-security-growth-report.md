# 클라우드 보안 엔지니어 성장 로드맵 리포트 (Dae / 곽대형)

생성: 2026-02-14 (UTC)

## 0) 결론 요약
- Dae는 이미 **CloudTrail 기반 탐지/헌팅(Sentinel/KQL)**, **IAM 권한상승 실험**, **Terraform 기반 보안 아키텍처** 경험이 있어서 “클라우드 보안” 포지셔닝이 가능합니다.
- 다음 레벨로 올라가려면 포트폴리오를 3개 축으로 확장하는 게 효율적입니다.
  - (1) **Detection/Response(탐지→대응)** 를 “운영 가능한 형태(룰+런북+자동화)”로
  - (2) **멀티계정 랜딩존 + 가드레일** 을 IaC로
  - (3) **CI/CD 보안 + Kubernetes(EKS) 보안** 으로 범위를 확장

---

## 1) 이력서 기반 강점
- **로그/탐지 역량**: CloudTrail 로그를 Sentinel로 수집하고 KQL 헌팅, 룰/워크북까지 구성.
- **IAM 공격/방어 이해**: sts:AssumeRole, iam:PassRole, AccessKey 생성, IMDSv2 등 공격 시나리오 재현.
- **IaC 기반 보안 설계**: VPC 분리, Endpoint, SG 최소노출, WAF rate-limit, S3 Public Access Block.
- **운영/네트워크 기반**: 해군 전산병 경험 + CCNP Security.

## 2) 시장조사(공개 채용공고에서 뽑은 요구사항)
### 2.1 AWS (Cloud Security Delivery/Consulting)
AWS ProServe Cloud Security 공고에서 요구/우대가 명시된 항목(요약):
- **보안/컴플라이언스/리스크 3+년**
- **자동화/통합/구현 경험**
- **코드/스크립트로 보안 기능 구현 + IaC 배포**
- **WAF/IPS/Anti-DDoS/SIEM** 등 엔터프라이즈 보안 솔루션 경험
- **CI/CD 보안**
- **PCI DSS / ISO 27001 / NIST** 이해
- 출처: https://www.amazon.jobs/en/jobs/3177206/delivery-consultant-cloud-security-professional-services

### 2.2 Toss Bank (Security Analyst)
Toss Bank Security Analyst 공고에서 요구되는 핵심(요약):
- **보안 위협/침해사고 분석 및 대응**
- **SIEM 로그 기반 위협 모델링/시나리오 설계·운영**
- **DDoS/IPS/IDS/WAF/AV 정책 검토**
- **Python/PowerShell 자동화**, SIEM correlation rule 제작 경험 우대
- 출처: https://toss.im/career/job-detail?job_id=7569891003

### 2.3 메가존클라우드 (GRC/보안관리 + 클라우드 운영)
- 정보보안/개인정보 관리자 포지션은 **ISMS-P/ISO27001, 법/정책, 보안점검 대응** 비중이 큼
  - 출처: https://xmukacmt.ninehire.site/job_posting/yZWzvpj0?lang=ko
- Cloud Engineer 포지션은 **보안 및 규제 요구사항 고려한 아키텍처 설계/제안**을 명시
  - 출처: https://xmukacmt.ninehire.site/job_posting/b7zpZwtI?lang=ko

---

## 3) 어떤 프로젝트를 하면 좋은가 (추천 4종)
### 프로젝트 1) AWS 멀티계정 보안 랜딩존(IaC)
- 목표: “보안 기본값(가드레일)”이 적용된 AWS 조직을 코드로 재현
- 포함하면 좋은 것:
  - 계정 분리(Prod/Dev/Security/Log Archive)
  - CloudTrail/Config 중앙 집계
  - GuardDuty/Security Hub 중앙 관리
  - KMS/S3 정책/SCP(가능하면) + VPC baseline
- 산출물: Terraform repo + 다이어그램 + 위협모델/설계 근거 문서

### 프로젝트 2) CloudTrail 기반 Detection-as-Code 패키지
- 목표: “룰 만들고 튜닝하고 운영한다”를 증명
- 포함하면 좋은 것:
  - IAM 권한 변경/AccessKey 생성/AssumeRole 체인 등 룰
  - 오탐 튜닝(필터/threshold/allowlist) 가이드
  - 대응 Runbook(확인→격리→키 롤백/회수→포렌식)

### 프로젝트 3) CI/CD 보안 파이프라인(DevSecOps)
- 목표: 공고에서 자주 나오는 “CI/CD 보안”을 포트폴리오로 증명
- 포함하면 좋은 것:
  - IaC 스캔 + 시크릿 스캔 + 정책 게이트(OPA)
  - 이미지 스캔/서명(cosign)/SBOM

### 프로젝트 4) EKS/Kubernetes 보안
- 목표: 클라우드 보안을 컨테이너까지 확장
- 포함하면 좋은 것:
  - IRSA, 네임스페이스 격리, NetworkPolicy, PodSecurity
  - 런타임 탐지(Falco 등) + 클라우드 로그 연계

---

## 4) 12주 실행 플랜(현실 버전)
- 1–2주: 멀티계정/로그 집계 baseline + 문서 템플릿 고정
- 3–5주: IAM 공격 시나리오 3개를 “탐지→대응”까지(룰+런북+자동화)
- 6–8주: CI/CD 보안 파이프라인 1개 서비스 구축
- 9–12주: EKS 보안 1회차(권한/네트워크/이미지/감사로그)

## 5) 자격증/학습 우선순위(선택과 집중)
- 탐지/대응 지향: AWS Security Specialty(가능하면) + SIEM/IR 심화
- 아키텍처 지향: SA Pro 또는 DevOps Pro + Terraform 고도화
- 컨설팅/GRC 지향: ISO/ISMS-P 실무 + (장기) CISA/CCSP/CISSP
