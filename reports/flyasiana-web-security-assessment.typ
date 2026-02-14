// Flyasiana.com — Web Security Assessment Report (Template)
// Primary format: Typst

#set page(margin: 22mm)
#set text(font: "Noto Sans", size: 11pt)
#set heading(numbering: "1.")
#set par(leading: 0.35em)

= Web Security Assessment Report

== Engagement overview
- Target: *flyasiana.com* (and authorized subdomains)
- Testing window: 22:00–04:00 UTC
- Constraints: see Appendix A (RoE)
- Evidence: Authorization screenshot stored in repo under `pentest/flyasiana/evidence/authorization-2026-02-14.png`

== Executive summary (English)
=== Objectives
- Identify exposed subdomains and reachable services.
- Review TLS posture and HTTP security headers.
- Perform low-impact automated scanning within agreed rate limits.
- Verify authentication rate limiting (max 10 attempts/account).

=== High-level results
- Overall risk rating: *TBD*
- Total findings: *TBD*
  - Critical: TBD
  - High: TBD
  - Medium: TBD
  - Low: TBD
  - Informational: TBD

=== Key recommendations
- TBD

== Scope
- In scope: `*.flyasiana.com` subdomain enumeration and testing where authorized.
- Out of scope / prohibited: DoS/DDoS, phishing/social engineering, credential stuffing, data exfiltration.

== Methodology
- Passive reconnaissance
- DNS enumeration + resolution
- Service discovery (HTTP/S)
- TLS configuration review
- HTTP header inspection
- Limited automated scanning (rate controlled)
- Auth rate-limit verification

== Findings
// For each finding, include: impact, affected assets, evidence, reproduction (safe), remediation, references.

=== Finding 1 — Title (Severity)
*Status:* Open / Fixed / Accepted risk

*Affected assets:*
- 

*Description:*
- 

*Impact:*
- 

*Evidence:*
- 

*Remediation:*
- 

== Appendix A — Rules of Engagement (RoE)
- Paste the finalized RoE here.

== Appendix B — Asset inventory (preliminary)
This section will be finalized once raw exports (subdomains/DNS/live endpoints) are ingested.

=== Observed hostnames (from provided screenshot)
- `flyasiana.com`
- `www.flyasiana.com`
- `weblog.flyasiana.com`
- `promo.flyasiana.com`
- `eum.flyasiana.com`
- `asiana350.flyasiana.com`
- `supersale.flyasiana.com`
- `msupersale.flyasiana.com`
- `dreamfare.flyasiana.com`
- `amfare.flyasiana.com`

=== Observed IPs (from provided screenshot)
> Note: IP ownership/CDN provider not asserted in this report without corroborating evidence.

- 23.205.247.12
- 95.101.203.245
- 23.222.54.97
- 23.54.9.24
- 104.70.95.193
- 23.67.131.84
- 104.64.31.100
- 23.207.123.47
- 23.212.223.99
- 23.199.221.196
- 23.54.109.104
- 104.102.58.201
- 23.2.237.44
- 23.2.237.212
- 2.20.22.142
- 104.111.238.198

=== Raw data export
- Link/attach `pentest/flyasiana/RAW_DATA_EXPORT.md`
