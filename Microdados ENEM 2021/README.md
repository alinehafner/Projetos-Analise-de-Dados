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

### Inscritos por Cor e Raça

Observamos a disparidade em nessa análise, enquanto inscritos declarados Brancos e Pardos estão nas maiores porcentagens com 40% e 43% respectivamente, vemos Pretos como o terceiro mais alto porém com uma grande diferença, somente 12% sendo a menor porcentagem os Indígenas. Atráves dessa consulta podemos ver que há um longo caminho a percorrer em relação a inclusividade. Para podermos ver a desigualdade teríamos que fazer um estudo mais profundo, porém esta análise poderia ser uma indicaçã desse fato.

<img src="https://user-images.githubusercontent.com/47762518/229630190-f44127be-e75b-4781-8239-55e14579ee0a.png" width="680" height="400">

### Inscritos por Idade

Como é de se imaginar as maiores porcentagens de inscritos estão entre 17 e 19 anos, que é o período de conclusão do Ensino Médio, dos 20 anos em diantes há uma decadência de inscritos quanto maior a idade, vemos um aumentos entre 26 e 30 anos, porém estamos analisando um total de 4 anos nessa barra em específico, por isso há esse aumento de 7%, se fizermos uma média o valor estaria por volta de 1,75% o que mantém a queda gradativa da procura pelo ENEM.

<img src="https://user-images.githubusercontent.com/47762518/229631785-544de9e6-3f78-4850-9091-538362b8e9e0.png" width="680" height="450">

### Inscritos por Conclusão do Ensino Médio

Nossa próxima consulta será por conclusão do ensino médio, vemos que a maior porcentagem de 53% se dá aos inscritos que já concluíram o Ensino Médio, seguido dos que irão concluir no mesmo ano da prova. Já a porcentagem de 13% são daqueles que ainda estão cursando e irão concluir o Ensino Médio após 2021, muitos inscritos fazem a prova para treinar e praticar, podemos ver isso na próxima consulta.

<img src="https://user-images.githubusercontent.com/47762518/229635066-260e733f-b837-46f8-9efc-68c7566ee3fa.png" width="680" height="400">

Nessa consulta a legenda Sim representa a porcentagem de inscritos que estão fazendo a prova para fins de prática e treinamento, a porcentagem é aproximadamente a mesma dos inscritos que ainda não concluíram o Ensino Médio e irão concluir após a data da prova, sendo mais um forte indicativo que esses alunos estão treinando para os próximos anos.

<img src="https://user-images.githubusercontent.com/47762518/229635076-90c9d7cf-b40d-4c51-bd7f-1cd0faf929ff.png" width="380" height="320">









[...em atualização]

[1]: https://www.gov.br/inep/pt-br/acesso-a-informacao/dados-abertos/microdados/enem
[2]: https://github.com/alinehafner/Projetos-An-lise-de-Dados/blob/main/Microdados%20ENEM%202021/Diagrama.jpg
[3]: https://github.com/alinehafner/Projetos-An-lise-de-Dados/blob/main/Microdados%20ENEM%202021/analises.sql
[4]: https://github.com/alinehafner/Projetos-An-lise-de-Dados/tree/main/Microdados%20ENEM%202021/Dicionario
[5]: https://public.tableau.com/app/profile/aline2459/viz/Microdados_ENEM_2021/MicrodadosENEM2021?publish=yes

