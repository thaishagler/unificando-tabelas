# 📊 Marketing Performance SQL Project

Esta query tem como objetivo centralizar, integrar e analisar dados de performance de campanhas digitais provenientes de diversas plataformas de marketing, como **Facebook Ads**, **Google Ads** e **Google Analytics**.

A consolidação de dados é essencial para uma análise de funis de marketing e visualizações de desempenho multicanal por meio de SQL.

---

## 🧱 Estrutura do Banco de Dados

O projeto é composto por três tabelas principais que representam diferentes fontes de tráfego e dados de marketing:

### 🔵 facebook_ads

Contém dados de campanhas veiculadas no Facebook Ads.

| Coluna             | Tipo      | Descrição                        |
|--------------------|-----------|----------------------------------|
| account            | nvarchar  | Nome da conta                    |
| account_id         | int       | ID da conta                      |
| medium             | nvarchar  | Canal de marketing (e.g. CPC)    |
| source             | nvarchar  | Origem do tráfego (e.g. facebook)|
| campaign_id        | int       | ID da campanha                   |
| campaign_name      | nvarchar  | Nome da campanha                 |
| adset_name         | nvarchar  | Nome do conjunto de anúncios     |
| ad_name            | nvarchar  | Nome do anúncio                  |
| date               | date      | Data da métrica                  |
| cost               | decimal   | Custo da campanha                |
| clicks             | int       | Número de cliques                |
| impressions        | int       | Impressões geradas               |
| conversions        | int       | Conversões registradas           |
| conversions_value  | int       | Valor total das conversões       |

---

### 🔴 google_ads

Contém dados de campanhas do Google Ads.

| Coluna             | Tipo      | Descrição                        |
|--------------------|-----------|----------------------------------|
| account_name       | nvarchar  | Nome da conta                    |
| account_id         | int       | ID da conta                      |
| medium             | nvarchar  | Canal de marketing               |
| source             | nvarchar  | Origem do tráfego (e.g. google)  |
| campaign_id        | int       | ID da campanha                   |
| campaign_name      | nvarchar  | Nome da campanha                 |
| date               | date      | Data da métrica                  |
| cost               | decimal   | Custo da campanha                |
| clicks             | int       | Número de cliques                |
| impressions        | int       | Impressões geradas               |
| conversions        | int       | Conversões registradas           |
| conversions_value  | int       | Valor das conversões             |

---

### 🟢 google_analytics

Registra eventos do site vinculados a campanhas, como sessões e ações de e-commerce.

| Coluna             | Tipo      | Descrição                            |
|--------------------|-----------|--------------------------------------|
| date               | date      | Data                                 |
| source             | nvarchar  | Origem do tráfego                    |
| medium             | nvarchar  | Canal de marketing                   |
| campaign_id        | nvarchar  | ID da campanha                       |
| conversions_ga     | int       | Conversões registradas no GA         |
| receita_ga         | decimal   | Receita total                        |
| add_to_cart_ga     | int       | Eventos de adicionar ao carrinho     |
| sessions_ga        | int       | Sessões iniciadas                    |

---

## 📂 Conteúdo do Repositório

| Arquivo                    | Descrição                                        |
|----------------------------|--------------------------------------------------|
| `tabela_consolidada.sql`  | Script SQL para consolidação dos dados das 3 fontes |

---

## ▶️ Como Usar

### 1. Clone o Repositório

```bash
git clone https://github.com/seu-usuario/marketing-performance-sql.git
cd marketing-performance-sql
