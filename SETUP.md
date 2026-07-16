# 설치 방법

1. GitHub에서 자신의 사용자명과 동일한 공개 저장소를 만듭니다.
2. 이 폴더의 파일을 저장소 최상위에 복사합니다.
3. 모든 파일에서 `YOUR_GITHUB_USERNAME`을 실제 GitHub 사용자명으로 바꿉니다.
4. `README.md`의 바로장터 설명과 링크를 원하는 내용으로 조정합니다.
5. 아래 명령으로 Codex 통계 카드를 갱신합니다.

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\update-codex-stats.ps1
```

6. 변경사항을 커밋하고 GitHub에 푸시합니다.
7. 저장소의 `Actions` 탭에서 `Generate contribution snake`를 한 번 수동 실행합니다.

## 개인정보 주의

- 학교명, 실명, 거주지, 연락처는 공개 README에 적지 않는 것을 권장합니다.
- `agentcat snapshot` 전체 JSON이나 `.codex` 폴더를 GitHub에 올리지 마세요.
- 제공된 스크립트는 토큰 개수, 스레드 수, 갱신 시각만 SVG에 기록합니다.
- Codex 통계 갱신은 개인 PC의 로컬 기록이 필요하므로 수동 실행 방식입니다.
