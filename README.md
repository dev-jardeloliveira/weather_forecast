# 🌤️ Weather Forecast App

![Flutter](https://img.shields.io/badge/Flutter-3.12+-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-3.0+-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Riverpod](https://img.shields.io/badge/Riverpod-3.x-00A67E?style=for-the-badge&logo=flutter&logoColor=white)
![Clean Architecture](https://img.shields.io/badge/Architecture-Clean-blue?style=for-the-badge)
![MVVM](https://img.shields.io/badge/Pattern-MVVM-orange?style=for-the-badge)

Uma aplicação móvel de previsão do tempo de nível profissional, construída com **Flutter**, projetada sob os pilares de **Clean Architecture** e **MVVM**. O projeto consome dados em tempo real da [WeatherAPI](https://www.weatherapi.com/) e foca em escalabilidade, testabilidade e separação estrita de responsabilidades.

---

## 🎥 Demonstração em Vídeo

https://github.com/user-attachments/assets/1228595911

> **Nota:** Se o player acima não carregar, assista diretamente no [Vimeo](https://vimeo.com/1228595911).

---

## 📸 Screenshots

| Home (Light) | Home (Dark) | Detalhes |
| :---: | :---: | :---: |
| *[Insira o print da tela inicial aqui]* | *[Insira o print do modo escuro aqui]* | *[Insira o print de detalhes aqui]* |

> **Nota:** Substitua os placeholders acima pelas imagens reais do app. Dica: use ferramentas como o [Screenmock](https://screenmock.com/) ou o próprio emulador para gerar os prints.

---

## 🏗️ Arquitetura e Design Patterns

Este projeto não é apenas um "app que funciona", mas sim uma base de código sustentável. A arquitetura foi desenhada para isolar o domínio da aplicação de frameworks e detalhes de implementação.

### Clean Architecture
A divisão de camadas segue rigorosamente o fluxo de dependência (de fora para dentro):

- **Domain (Core):** O coração da aplicação. Contém as *Entities*, *Use Cases* e contratos de *Repositories*. Puramente Dart, sem dependência de Flutter ou bibliotecas externas.
- **Data:** Implementação dos contratos. Contém os *Models* (com `fromJson`/`toJson`), *Data Sources* (API via Dio e Cache local via SharedPreferences) e a implementação dos *Repositories*.
- **Presentation:** Camada de UI. Consome os *Use Cases* através de *ViewModels* (gerenciados pelo Riverpod) e renderiza o *Widget tree*.

### MVVM (Model-View-ViewModel)
- **View:** Widgets "burros" (StatelessWidgets focados em UI) que observam o estado do ViewModel.
- **ViewModel:** Gerencia o estado da tela, orquestra os *Use Cases* e expõe dados reativos via `StateNotifier` ou `AsyncNotifier` (Riverpod 3.x).
- **Model:** Entidades de domínio e DTOs de dados.

### Injeção de Dependência
Utilizamos o **Get_it** como *Service Locator* para gerenciar instâncias de classes de forma centralizada e desacoplada, facilitando a substituição de implementações em ambiente de testes.

---

## 🚀 Tecnologias e Pacotes

A stack foi selecionada visando performance, segurança de tipos e experiência de desenvolvimento (DX):

| Categoria | Pacote | Propósito |
| :--- | :--- | :--- |
| **Gerenciamento de Estado** | `flutter_riverpod` (3.x) | Reatividade, injeção de dependência e imutabilidade de estados. |
| **Rede** | `dio` | Cliente HTTP robusto com interceptors para logging e tratamento de erros. |
| **Injeção de Dependência** | `get_it` | Desacoplamento de instâncias e facilitação de Mocks. |
| **Geolocalização** | `geolocator` + `geocoding` | Obtenção de coordenadas e conversão para endereços legíveis. |
| **Permissões** | `permission_handler` | Tratamento elegante de permissões de localização em runtime. |
| **Persistência Local** | `shared_preferences` | Cache de dados e preferências do usuário (ex: tema, última cidade). |
| **UI/UX** | `google_fonts`, `cupertino_icons` | Tipografia moderna e ícones nativos. |
| **Configuração** | `flutter_dotenv` | Gerenciamento de variáveis de ambiente (API Keys) fora do versionamento. |
| **Utilitários** | `intl`, `logger` | Formatação de datas/idiomas e logs estruturados para debug. |
| **Build** | `flutter_launcher_icons` | Geração automatizada de ícones para Android e iOS. |

---

## ⚙️ Configuração do Ambiente

### Pré-requisitos
- Flutter SDK `3.12` ou superior.
- Dart SDK `3.0` ou superior.
- Chave de API válida da [WeatherAPI](https://www.weatherapi.com/).

### Passo a Passo

1. **Clone o repositório:**
   ```bash
   git clone https://github.com/dev-jardeloliveira/weather_forecast.git
   cd weather_forecast
