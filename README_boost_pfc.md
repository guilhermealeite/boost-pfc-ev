#  Conversor Boost PFC para Estações de Carregamento de Veículos Elétricos
**Boost PFC Converter for Electric Vehicle Charging Stations**

---

## Descrição / Description
**PT-BR:**  
Este projeto implementa e simula um conversor **CA–CC do tipo Boost** com **Correção Ativa do Fator de Potência (PFC)**, operando em **modo DCM**, voltado para estações de carregamento rápido de veículos elétricos.  
A proposta é baseada no Trabalho de Conclusão de Curso de Guilherme Leite (2025) e visa melhorar a eficiência energética, reduzir distorções harmônicas e garantir conformidade com normas internacionais de qualidade de energia.

**EN:**  
This project implements and simulates an **AC–DC Boost Converter** with **Active Power Factor Correction (PFC)** operating in **DCM mode**, designed for fast electric vehicle charging stations.  
The design is based on Guilherme Leite's 2025 undergraduate thesis and aims to improve energy efficiency, reduce harmonic distortion, and ensure compliance with international power quality standards.

---

## Funcionalidades / Features
-  Operação em Modo DCM / DCM Mode operation
-  Correção ativa de fator de potência (FP ~ 1) / Active power factor correction (PF ~ 1)
-  Cálculo e exibição de **FP** e **THD**
-  Dimensionamento parametrizável para diferentes potências / Adjustable design for different power levels
-  Simulações completas em **MATLAB/Simulink + PLECS**

---

## Diagrama de Blocos / Block Diagram
**PT-BR:** Representação simplificada do sistema PFC Boost integrado à estação de carregamento.  
**EN:** Simplified representation of the Boost PFC system integrated into the charging station.

![Diagrama de Blocos](docs/diagrama.png)

---

## Estrutura do Repositório / Repository Structure
- `src/` — Arquivos de simulação no PLECS/Simulink (ex.: `.psc`, `.slx`, scripts de pós-processamento).
- `docs/` — Diagramas, imagens e documentação (ex.: `diagrama.png`, PDF do TCC).
- `results/` — Gráficos e dados de saída (ex.: `fp_vs_power.png`, CSVs exportados do PLECS/MATLAB).
- `LICENSE` — Arquivo de licença (recomendo MIT para portfólio).
- `README.md` — Este arquivo.

---

##  Tecnologias / Technologies
- **MATLAB/Simulink** (modelagem e análise)
- **PLECS** (simulação detalhada do conversor e controle)
- **Git / GitHub** (controle de versão e portfólio)

---

## Parâmetros de Exemplo / Example Parameters
| Parâmetro / Parameter | Valor / Value |
|-----------------------:|:-------------|
| Vin_rms               | 220 V         |
| fs                    | 50 kHz        |
| Po_max                | 20 kW         |
| L                     | 1.2 mH        |
| C                     | 470 µF        |

---

## Instruções de Uso / Usage Instructions

**PT-BR:**

1. Clone o repositório:
```
git clone https://github.com/seuusuario/boost-pfc-ev.git
```
2. Copie os arquivos de simulação PLECS para a pasta do repositório clonado.
3. Abra o arquivo no PLECS e certifique-se de que o MATLAB/PLECS estejam instalados e licenciados.
4. Execute a simulação diretamente no PLECS/Simulink.
5. Exporte os sinais desejados (tensões, correntes, THD, FP) para CSV se quiser pós-processar no MATLAB. Salve gráficos em `results/`.

**EN:**

1. Clone the repository:
```
git clone https://github.com/yourusername/boost-pfc-ev.git
```
2. Copy your PLECS simulation files into the folder of the cloned repo.
3. Open the file in PLECS and ensure MATLAB/PLECS are installed and licensed.
4. Run the simulation directly in PLECS.
5. Export signals (voltages, currents, THD, PF) to CSV for further processing in MATLAB. Save plots to `results/`.

---

## 📈 Resultados / Results
Exemplo de gráfico de Fator de Potência (FP) vs Potência de saída:  
Example of Power Factor (PF) vs Output Power graph:

![FP vs Potência](results/fp_vs_power.png)

---

## 📌 Possíveis Expansões / Possible Extensions
- Implementação do controle em **DSP** (TI C2000) ou microcontrolador (STM32).  
- Integração com sistemas de monitoramento via rede (IIoT) — ex.: Modbus/TCP.  
- Interface HMI para ajuste de parâmetros e visualização em tempo real.  
- Protótipo físico com PCB e testes em bancada (com proteções adequadas).

---

## Autor / Author
**Guilherme Leite** — Eng. Elétrica | Automação & Eletrônica de Potência  
📧 guilhermealeite2002@icloud.com  
🌐 www.linkedin.com/in/guilhermeanleite/
