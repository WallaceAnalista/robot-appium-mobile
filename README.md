# 📱 Robot Framework + Appium · Android e iOS

![Android](https://github.com/WallaceAnalista/robot-appium-mobile/actions/workflows/android.yml/badge.svg)
![iOS](https://github.com/WallaceAnalista/robot-appium-mobile/actions/workflows/ios.yml/badge.svg)
![Robot Framework](https://img.shields.io/badge/Robot%20Framework-000000?logo=robotframework&logoColor=white)
![Appium](https://img.shields.io/badge/Appium-662CB3?logo=appium&logoColor=white)

Automação mobile do [My Demo App](https://github.com/saucelabs/my-demo-app-rn) da Sauce Labs (React Native) com **Robot Framework + Appium**. **A mesma suíte roda em Android e iOS**: só a navegação, que é diferente em cada sistema, fica isolada em um arquivo por plataforma.

## 🧪 Cenários

| Suíte | Cenários |
| --- | --- |
| `login.robot` | Login válido, usuário bloqueado, senha incorreta e campos obrigatórios (template orientado a dados) |
| `catalogo.robot` | Listagem, ordenação por nome e preço (template) e detalhe do produto |
| `carrinho.robot` | Adicionar produto com quantidade, conferir total e remover item |

## 🏗️ Arquitetura

```
├── config/capabilities.py          # capabilities do Appium por plataforma (variable file)
├── resources
│   ├── base.resource               # keywords comuns (abrir app, tocar, preencher, validar)
│   ├── pages/                      # Page Objects: login, catálogo, produto e carrinho
│   └── platforms/
│       ├── android.resource        # menu lateral e carrinho no cabeçalho
│       └── ios.resource            # barra de abas inferior
├── tests/                          # suítes em linguagem de negócio
└── .github/workflows/              # Android (emulador) e iOS (simulador)
```

- **Page Objects em keywords** de alto nível: os testes leem como especificação de negócio.
- **Uma suíte, duas plataformas**: o `resource` de navegação é escolhido pela variável `PLATFORM` no momento da execução.
- **Locators por accessibility id**, estáveis e iguais nos dois sistemas.
- **Testes isolados**: cada teste abre uma sessão nova com o estado do app limpo.
- **Templates** para cenários orientados a dados.
- **Evidências**: screenshot automático em caso de falha e log do Appium no relatório.
- **CI**: Android em emulador (`android-emulator-runner`) e iOS em simulador no runner macOS, com *dry run* validando a sintaxe antes.

## ▶️ Como rodar localmente

Pré-requisitos: Python 3.10+, Node.js, [Appium 2+](https://appium.io) e um emulador Android ou simulador iOS (este último só no macOS).

```bash
pip install -r requirements.txt
npm install -g appium
appium driver install uiautomator2   # Android
appium driver install xcuitest       # iOS
appium                               # deixe rodando
```

Baixe o app da [página de releases](https://github.com/saucelabs/my-demo-app-rn/releases) para a pasta `apps/` e rode:

```bash
# Android
robot -V config/capabilities.py:android -d results tests

# iOS
robot -V config/capabilities.py:ios -d results tests

# só os testes de fumaça
robot -V config/capabilities.py:android -i smoke -d results tests
```

Caminho do app, dispositivo e versão podem ser trocados por variáveis de ambiente: `APP_PATH`, `DEVICE_NAME`, `PLATFORM_VERSION` e `APPIUM_URL`.

O relatório fica em `results/report.html`.

---

Feito por [**Wallace Rodrigues de Oliveira**](https://www.linkedin.com/in/wallaceoliveira86/) · Especialista em Testes / QA Sênior
