# Análise dos Microdados ENEM 2021

Esse projeto tem como objetivo organizar e analisar os dados do Exame Nacional do Ensino Médio(ENEM) e retirar insights dos mesmos. Os dados estão disponíveis no [site][1] do governo, também disponibilizados os dados dos outros anos do exame.
Foi utilizado PostgreSQL para este projeto, separando as tabelas como mostrado no diagrama em [Diagrama][2], assim como as querys utilizadas nas análises disponíveis em [analises][3]. Alguns dos dados estão ainda em sua forma numérica, logo é disponibilizado um [Dicionario][4] para poder fazer a leitura correta dos dados originais. Também há uma [Dashboard interativa][5] feita no Tableau onde se pode verificar algumas das análises apresentadas nesse documento.

## Início

Nos dados há aproximadamente 3,4 milhões de inscritos, com informações sobre sexo, escolaridade, idade, cor e raça e outras informações pessoais, bem como informações sobre as notas das respectivas provas e muitos outros dados, não utlizaremos todos para esta análise. Começamos analisando os inscritos e a porcentagem dos mesmo em categorias, primeiramente iremos filtrar por sexo e então por tipo de ensino (escola pública ou privada).

### Inscritos por sexo

Podemos perceber uma maioria feminina nos inscritos do ENEM 2021, com 62%. Pode indicar um maior interesse das mulheres para qualificação profissional e em um diploma, porém precisa-se de mais estudos para que possamos afirmar isso.

<img src="https://user-images.githubusercontent.com/47762518/229629047-193fb6d1-ec01-4454-a899-b306c64fda69.png" width="380" height="320">

### Inscritos por ensino

Nesta análise vemos que 28% dos incritos são de escola pública enquanto 6% são de escola particular, porém como 66% não respondeu dificilmente conseguiríamos retirar algum insight dessa análise, pois iriam faltar dados. Podemos dizer que os inscritos preferem não divulgar de qual ensino vieram.

<img src="https://user-images.githubusercontent.com/47762518/229628304-81e6ed99-0cac-40de-919a-a8f13bc0bb1a.png" width="380" height="320">







[...em atualização]

[1]: https://www.gov.br/inep/pt-br/acesso-a-informacao/dados-abertos/microdados/enem
[2]: https://github.com/alinehafner/Projetos-An-lise-de-Dados/blob/main/Microdados%20ENEM%202021/Diagrama.jpg
[3]: https://github.com/alinehafner/Projetos-An-lise-de-Dados/blob/main/Microdados%20ENEM%202021/analises.sql
[4]: https://github.com/alinehafner/Projetos-An-lise-de-Dados/tree/main/Microdados%20ENEM%202021/Dicionario
[5]: https://public.tableau.com/app/profile/aline2459/viz/Microdados_ENEM_2021/MicrodadosENEM2021?publish=yes

