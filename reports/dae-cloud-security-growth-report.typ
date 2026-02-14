// Dae (곽대형) — Cloud Security Engineer 성장 로드맵 리포트
// Generated: 2026-02-14 (UTC)

#set page(margin: 22mm)
#set text(font: "Noto Sans", size: 11pt)
#set heading(numbering: "1.")
#set par(leading: 0.35em)

= 클라우드 보안 엔지니어 성장 로드맵 리포트

== 대상
- 이름: *곽대형 (Dae)*
- 목표: *AWS / Toss / 메가존클라우드 / Big4 컨설팅* 등에서 “클라우드 보안 엔지니어(또는 클라우드 보안 컨설턴트)”로 성장

== 요약 (한 장으로)
#outline(depth: 2)

== 1. 이력서 기반 현재 포지션
=== 1.1 강점 (이미 시장에서 먹히는 것)
- *클라우드 로그/탐지 관점 경험*: CloudTrail 기반 탐지 흐름을 설계하고 Sentinel(KQL)로 헌팅·대시보드까지 구성.
- *IAM 공격/방어 이해*: 권한 상승, sts:AssumeRole, iam:PassRole, IMDSv2 등 “클라우드 특유의 공격 벡터”를 실험으로 검증.
- *IaC 기반 보안 설계 경험*: Terraform으로 VPC 분리, Endpoint, SG 최소노출, S3 Public Access Block, WAF rate-limit 등 “아키텍처 보안” 경험.
- *네트워크/엔터프라이즈 보안 운영*: 해군 전산병 경험 + CCNA/CCNP Security.
- *커뮤니티/리더십*: 동아리 CTF/워크샵 운영 (면접에서 ‘학습-공유-리딩’ 강점).

=== 1.2 보완하면 급격히 레벨업되는 영역
- *컨테이너/Kubernetes 보안*: EKS/GKE, 네트워크 정책, 이미지 스캔, 런타임, admission control 등.
- *CI/CD 보안(DevSecOps)*: 빌드 파이프라인, IaC 스캔, 시크릿 관리, SBOM, 정책 기반 배포.
- *보안 운영의 “제품화”*: 탐지룰/대응 플레이북을 코드로 관리(Detection-as-Code), 운영 지표화.
- *컴플라이언스/거버넌스 문서화*: ISO 27001, ISMS-P, PCI DSS, NIST 계열을 “클라우드 통제”로 번역해 내는 역량.

== 2. 시장 조사 요약 (공개 채용공고 기반)
#let src(url) = link(url, url)

=== 2.1 AWS (클라우드 보안 컨설팅/딜리버리)에서 보이는 요구
아래 항목들은 AWS ProServe의 Cloud Security 딜리버리 컨설턴트 공고에 명시된 내용입니다.

- 기본: *IT Security / Compliance / Risk 3+년*, 자동화/통합/구현 경험.
- 선호: *스크립트·코드로 보안 기능 구현*, *IaC로 인프라 배포*.
- 선호: *WAF/IPS/Anti-DDoS/SIEM* 등 엔터프라이즈 보안 솔루션 구현 경험.
- 선호: *CI/CD 생산환경 보안*.
- 선호: *PCI DSS / ISO 27001 / NIST* 등 표준/프레임워크 이해.
- 선호: AWS Professional 레벨 자격.
- 출처: #src("https://www.amazon.jobs/en/jobs/3177206/delivery-consultant-cloud-security-professional-services")

=== 2.2 Toss Bank (Security Analyst)에서 보이는 요구
Toss Bank의 Security Analyst 공고에 명시된 역할/요구는 “클라우드 보안 엔지니어”가 결국 가져야 할 *탐지·대응·자동화 역량*을 매우 직접적으로 요구합니다.

- 업무:
  - 보안 위협/침해사고 분석 및 대응
  - SIEM 수집 로그 기반 위협 모델링/시나리오 설계·운영
  - DDoS/IPS/IDS/WAF/AV 차단 정책 검토
  - 반복 업무 자동화로 운영 효율화
- 요구:
  - 로그/이벤트 심층 분석, TTP/IOC 이해
  - 탐지 분석 도구/보안 솔루션 기반 대응 경험
  - SIEM Correlation Rule 제작 경험(있으면 유리)
  - Python/PowerShell 자동화 경험
- 출처: #src("https://toss.im/career/job-detail?job_id=7569891003")

=== 2.3 메가존클라우드(컨설팅/운영 + 거버넌스)에서 보이는 요구
(1) 정보보안/개인정보 관리 포지션은 *정책/컴플라이언스/인증(ISMS-P, ISO 27001)* 비중이 큽니다.

- 업무:
  - 정보보호/개인정보 정책 관리
  - 컴플라이언스 검토 및 서비스 반영
  - 기관/고객사 보안점검 대응
  - ISMS-P, ISO 27001 등 인증 관리
- 요구:
  - 보안정책 운영/기획 경험
  - 관련 법(개인정보보호법/정보통신망법 등) 이해
  - 인증심사 업무/지식
- 우대:
  - CISSP/CISA/정보보안기사/CPPG 등
  - 클라우드 기반 서비스 환경 경험
- 출처: #src("https://xmukacmt.ninehire.site/job_posting/yZWzvpj0?lang=ko")

(2) Cloud Engineer(고객사 상주) 포지션은 *보안+규제 요구사항을 고려한 아키텍처 설계*를 명시합니다.

- 업무:
  - (금융)클라우드 환경 인프라 설계/구축/운영
  - 보안 및 규제 요구사항을 고려한 아키텍처 설계/제안
  - 요구사항 분석 → 기술 검토/아키텍처 제안/PoC
- 요구:
  - Windows/Linux 운영
  - 네트워크/가상화/스토리지 기본기
  - 문서화/커뮤니케이션
- 출처: #src("https://xmukacmt.ninehire.site/job_posting/b7zpZwtI?lang=ko")

== 3. 추천 성장 트랙 (선택 1개 + 보조 1개)
아래 3개는 서로 완전히 분리된 게 아니라, *주력 트랙*을 정해 포트폴리오를 집중시키는 용도입니다.

=== 3.1 Track A — Cloud Detection/Response Engineer (Blue Team)
- 누구에게 강함: Toss/금융권/대형 플랫폼의 보안관제·침해대응·탐지 엔지니어
- 핵심 키워드: SIEM, Detection-as-Code, CloudTrail/GuardDuty, IR Playbook, 자동화

=== 3.2 Track B — Cloud Security Engineer (Architecture/IaC)
- 누구에게 강함: AWS/MSP/플랫폼 엔지니어링 기반 조직
- 핵심 키워드: Landing Zone, 멀티계정, 네트워크 분리, Terraform, 정책/가드레일

=== 3.3 Track C — Cloud Security Consultant (GRC + 기술)
- 누구에게 강함: Big4/컨설팅/감사/인증 대응 조직
- 핵심 키워드: ISMS-P/ISO 27001/PCI, 통제 설계, Evidence 자동화, 문서화

== 4. 포트폴리오로 “증명”하면 강해지는 프로젝트 제안
원칙: *‘기술 데모’가 아니라 ‘운영 가능한 시스템’*을 만들어야 채용에서 강합니다.

=== 4.1 프로젝트 1: AWS 멀티계정 보안 랜딩존 (IaC)
- 목표: “보안 기본값”이 적용된 조직 구조를 코드로 재현
- 구성(추천):
  - Organization/계정 분리(Prod/Dev/Security/Log Archive)
  - CloudTrail/Config 중앙 집계
  - GuardDuty/Security Hub 중앙 관리
  - KMS, S3 bucket 정책, SCP(가능하면), VPC baseline
- 산출물:
  - Terraform repo + 아키텍처 다이어그램
  - ‘왜 이렇게 나눴는지’ 위협 모델/리스크 설명

=== 4.2 프로젝트 2: CloudTrail 기반 탐지룰 패키지 (Detection-as-Code)
- 목표: “SIEM 룰 만들 줄 안다”를 재현 가능한 형태로 증명
- 구성(추천):
  - MITRE ATT&CK 매핑된 룰 세트(예: IAM 권한 변경, AccessKey 생성, AssumeRole 체인)
  - 오탐 튜닝 가이드(필터, threshold, allowlist)
  - 대응 Runbook(1) 확인(2) 격리(3) 키 롤백/회수(4) 포렌식
- 산출물:
  - KQL 룰 + 테스트 로그 + Workbook/대시보드
  - 룰/플레이북 버전관리

=== 4.3 프로젝트 3: CI/CD 보안 파이프라인 (DevSecOps)
- 목표: AWS 공고에서 명시된 “CI/CD 보안”을 포트폴리오로 증명
- 구성(추천):
  - IaC 스캔(tfsec/trivy 등) + 정책(OPA) + 시크릿 스캔
  - 이미지 빌드 → SBOM → 서명(cosign) → 배포
  - 배포 전 정책 게이트(예: public S3, 0.0.0.0/0 SG 차단)

=== 4.4 프로젝트 4: 컨테이너/EKS 보안 (입사 후 바로 쓰는 영역)
- 목표: “클라우드 보안”을 ‘쿠버네티스 보안’까지 확장
- 구성(추천):
  - IAM Roles for Service Accounts(IRSA)
  - 네임스페이스 격리, NetworkPolicy, PodSecurity, admission 정책
  - 런타임 탐지(Falco 등)와 CloudTrail/EKS audit 연계

== 5. 12주 실행 플랜 (현실적인 시간 단위)
- Week 1–2: 멀티계정/로그 집계 baseline + 문서화 템플릿 확립
- Week 3–5: IAM 공격 시나리오 3개를 “탐지→대응”까지 자동화(룰+런북)
- Week 6–8: CI/CD 보안 파이프라인(최소 1개 서비스) 구축
- Week 9–12: EKS 보안 1회차(권한/네트워크/이미지/감사 로그)

== 6. 자격증/학습 우선순위 (선택과 집중)
- 보안 엔지니어(탐지/대응) 지향: AWS Security Specialty(가능하면) + SIEM 심화 + IR
- 아키텍처 지향: AWS SA Pro 또는 DevOps Pro + Terraform 고도화
- 컨설팅/GRC 지향: ISO 27001/ISMS-P 실무 + (장기적으로) CISA/CCSP/CISSP

== 7. 이력서/인터뷰 관점 추천 수정 포인트
- 지금 이력서는 *로그/탐지 + IAM + Terraform*이 이미 좋습니다.
- 다음을 더하면 “클라우드 보안 엔지니어”로 포지셔닝이 더 선명해집니다:
  - 각 프로젝트에 *위협 모델(가정)* + *탐지 포인트* + *완화/롤백 절차*를 3줄로 고정 템플릿화
  - 결과/성과를 수치화(룰 수, 오탐 감소율, 탐지 시간 단축 등)
  - ‘내가 만든 것’과 ‘운영 가능성(재현 방법)’을 GitHub에 연결
