# Panorama Telecom: Market Share e Penetração

Painel de Business Intelligence sobre o mercado brasileiro de **internet fixa (banda larga)**, feito em Power BI no formato de projeto (`.pbip`) e publicado no Microsoft Fabric. Mostra o mercado de banda larga e onde ainda há população sem atendimento.

Relatório publicado no Microsoft Fabric: [COLE_AQUI_O_LINK]

## Perguntas que o painel responde

- Qual a fatia de mercado (market share) da Claro no Brasil, em cada estado e, para RJ e SP, em cada cidade?
- Como variou o share de cada operadora desde janeiro, em pontos percentuais?
- Quantas conexões existem para cada 100 moradores (penetração)?
- Quais são as 5 maiores oportunidades, ou seja, cidades grandes com pouca presença da Claro?

## Como o market share é calculado

Market share = acessos da Claro ÷ total de acessos de todas as operadoras (Claro incluída), dentro do filtro escolhido e no último mês selecionado.

Acesso é uma conexão de internet fixa ativa. Como é um estoque (uma foto do mês), os meses não são somados.

Limites: mede presença em banda larga fixa, não faturamento nem celular.

## Fontes de dados

- **Anatel**: acessos de banda larga fixa por município, operadora e mês (2026).
- **IBGE**: população dos municípios (Censo 2022) e localização para o mapa.

## Modelo de dados

Esquema estrela (star schema):

| Tabela | Papel |
|---|---|
| `Acessos_Banda_Larga_Fixa_2026` | Fato: acessos por município, operadora e mês |
| `IBGE_API` | Dimensão de geografia e população |
| `dCalendario` | Dimensão de datas (meses por extenso) |
| `LocalMapa` | Tabela de apoio: estados e cidades de RJ e SP para o mapa |
| `_Medidas` | Medidas DAX |

Relacionamentos: fato → `IBGE_API` pelo código IBGE do município; fato → `dCalendario` pela data.

## Principais medidas (DAX)

Market share da Claro, total do mercado, penetração (conexões por 100 moradores), variação de share desde janeiro (em pontos percentuais), distância para o maior concorrente e ranking de oportunidades. Os subtítulos dos cartões também são medidas, para o texto acompanhar os filtros.

## Estrutura do repositório

```text
Projeto_Claro.pbip              Arquivo de entrada do projeto
Projeto_Claro.SemanticModel/    Modelo semântico (tabelas, relações, medidas) em texto
Projeto_Claro.Report/           Páginas e visuais do relatório em texto
assets/                         Imagens usadas na documentação
```

Como os arquivos são texto, o Git mostra exatamente o que mudou em cada medida DAX ou visual a cada commit.

## Tecnologias

Power BI (`.pbip`), Microsoft Fabric, DAX, Power Query (M), Git e GitHub.

## Autor

Cleyton Luis Soares de Carvalho. Engenheiro de Produção, analista de BI e dados.
LinkedIn: [COLE_AQUI] · GitHub: [engcley](https://github.com/engcley)
