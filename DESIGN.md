# GitHub Profile Design System

## 1. Atmosphere & Identity

GitHub의 기본 문서 흐름에 자연스럽게 섞이는 절제된 개발자 프로필. 별도 배경 헤더나 대형 자기소개 타이포를 사용하지 않고, 짧은 한국어 소개와 실제 활동 데이터로 정체성을 보여준다.

## 2. Color

| Role | Token | Value | Usage |
|---|---|---|---|
| Canvas | `night` | `#0D1026` | 헤더와 카드 바탕 |
| Surface | `glass` | `#FFFFFF / 0.2` | 반투명 패널 |
| Text | `white` | `#FFFFFF` | 기본 문구 |
| Muted | `lavender` | `#BEBBDA` | 보조 문구 |
| Accent | `pink` | `#FF7BCB` | 그라데이션 블롭 |
| Accent | `blue` | `#6EA8FF` | 그라데이션 블롭 |
| Accent | `lime` | `#B7F88A` | 수치와 상태 |

## 3. Typography

- Display: `Pretendard`, `Arial`, sans-serif, 700
- Body: GitHub 기본 sans-serif, 400–600
- Data: `ui-monospace`, monospace, tabular figures
- 문장은 짧고 평서형으로 쓴다. 영어 슬로건과 과도한 감탄사는 사용하지 않는다.

## 4. Spacing & Layout

- Base unit: 4px
- SVG canvas: 900 × 280px
- Outer safe area: 48px
- README는 GitHub 기본 단일 열 흐름을 유지한다.
- 큰 이미지 사이에는 Markdown 섹션 간격을 사용한다.

## 5. Components

### Usage card
- Structure: 제목, 갱신 시각, 다섯 개 수치
- Variants: 로컬 데이터 갱신
- States: 정적 이미지
- Accessibility: SVG `role=img`, 명시적 `aria-label`

### Contribution animation
- Structure: 밝은/어두운 테마용 SVG source
- States: OS 테마에 따라 전환
- Accessibility: 의미가 드러나는 alt text

## 6. Motion & Interaction

- 잔디 뱀 애니메이션만 사용한다.
- 배경 헤더, 타이핑 효과, 장식 목적의 반복 모션은 사용하지 않는다.

## 7. Depth & Surface

- Strategy: mixed
- 블러 메시, 반투명 패널, 1px 하이라이트 라인으로 깊이를 만든다.
- 둥근 패널 안에 곡선과 원형 블롭을 겹친다.

## 8. Accessibility Constraints & Accepted Debt

- 본문 수준 대비는 WCAG AA 4.5:1 이상을 목표로 한다.
- SVG 텍스트가 보이지 않아도 README 본문에서 같은 정보를 읽을 수 있다.
- Accepted debt: 외부 GitHub 통계 서비스가 일시적으로 표시되지 않을 수 있다.
