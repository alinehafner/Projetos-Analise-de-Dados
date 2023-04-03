-- Análise por inscritos

-- Sexo
SELECT
	CASE WHEN tp_sexo = 'F' THEN 'Feminino'
		WHEN tp_sexo = 'M' THEN 'Masculino'
		END AS sexo,
	COUNT(nu_inscricao) AS quantidade,
	(COUNT(nu_inscricao)::numeric/(SELECT
							COUNT(*)
						FROM
							enem.participantes)) AS porcentagem
FROM
	enem.participantes
GROUP BY
	sexo

-- Escolaridade
SELECT
	CASE WHEN tp_escola = 1 THEN 'Não respondeu'
	WHEN tp_escola = 2 THEN 'Pública'
	WHEN tp_escola = 3 THEN 'Privada'
	END AS escola,
	COUNT(nu_inscricao) AS quantidade,
	(COUNT(nu_inscricao)::numeric/(SELECT
							COUNT(*)
						FROM
							enem.participantes)) AS porcentagem
FROM
	enem.participantes
GROUP BY
	escola

-- Faixa Etária 
SELECT
	tp_faixa_etaria AS ordem,
	CASE WHEN tp_faixa_etaria = 1 THEN 'Menor de 17 anos'
	WHEN tp_faixa_etaria = 2 THEN '17 anos'
	WHEN tp_faixa_etaria = 3 THEN '18 anos'
	WHEN tp_faixa_etaria = 4 THEN '19 anos'
	WHEN tp_faixa_etaria = 5 THEN '20 anos'
	WHEN tp_faixa_etaria = 6 THEN '21 anos'
	WHEN tp_faixa_etaria = 7 THEN '22 anos'
	WHEN tp_faixa_etaria = 8 THEN '23 anos'
	WHEN tp_faixa_etaria = 9 THEN '24 anos'
	WHEN tp_faixa_etaria = 10 THEN	'25 anos'
	WHEN tp_faixa_etaria = 11 THEN 'Entre 26 e 30 anos'
	WHEN tp_faixa_etaria = 12 THEN 'Entre 31 e 35 anos'
	WHEN tp_faixa_etaria = 13 THEN 'Entre 36 e 40 anos'
	WHEN tp_faixa_etaria = 14 THEN 'Entre 41 e 45 anos'
	WHEN tp_faixa_etaria = 15 THEN 'Entre 46 e 50 anos'
	WHEN tp_faixa_etaria = 16 THEN 'Entre 51 e 55 anos'
	WHEN tp_faixa_etaria = 17 THEN 'Entre 56 e 60 anos'
	WHEN tp_faixa_etaria = 18 THEN 'Entre 61 e 65 anos'
	WHEN tp_faixa_etaria = 19 THEN 'Entre 66 e 70 anos'
	WHEN tp_faixa_etaria = 20 THEN 'Maior de 70 anos'
	END AS "faixa etária",
	COUNT(nu_inscricao) AS quantidade,
	(COUNT(nu_inscricao)*100/(SELECT
							COUNT(*)
						FROM
							enem.participantes)) AS porcentagem
FROM
	enem.participantes
GROUP BY
	ordem,
	"faixa etária"

-- Cor e Raça
SELECT
	tp_cor_raca AS ordem,
	CASE WHEN tp_cor_raca = 0 THEN 'Não declarado'
	WHEN tp_cor_raca = 1 THEN 'Branca'
	WHEN tp_cor_raca = 2 THEN 'Preta'
	WHEN tp_cor_raca = 3 THEN 'Parda'
	WHEN tp_cor_raca = 4 THEN 'Amarela'
	WHEN tp_cor_raca = 5 THEN 'Indígena'
	WHEN tp_cor_raca = 6 THEN 'Não dispõe da informação'	
	END AS "cor_raça",
	COUNT(nu_inscricao) AS quantidade,
	(COUNT(nu_inscricao)*100/(SELECT
							COUNT(*)
						FROM
							enem.participantes)) AS porcentagem
FROM
	enem.participantes
GROUP BY
	ordem,
	"cor_raça"

-- Conclusão Ensino Médio
SELECT
	tp_st_conclusao AS ordem,
	CASE WHEN tp_st_conclusao = 1 THEN 'Já concluí o Ensino Médio'
	WHEN tp_st_conclusao = 2 THEN 'Estou cursando e concluirei o Ensino Médio em 2021'
	WHEN tp_st_conclusao = 3 THEN 'Estou cursando e concluirei o Ensino Médio após 2021'
	WHEN tp_st_conclusao = 4 THEN 'Não concluí e não estou cursando o Ensino Médio'	
	END AS "Conclusao do Ensino Médio",
	COUNT(nu_inscricao) AS quantidade,
	(COUNT(nu_inscricao)*100/(SELECT
							COUNT(*)
						FROM
							enem.participantes)) AS porcentagem
FROM
	enem.participantes
GROUP BY
	ordem,
	"Conclusao do Ensino Médio"
	
-- Análise por notas

-- Presença
SELECT	
	CASE WHEN tp_presenca_cn = 1 AND tp_presenca_ch = 1 AND tp_presenca_lc = 1 AND tp_presenca_mt = 1 THEN 'Presente na prova'		 
		 WHEN tp_presenca_ch = 1 AND tp_presenca_lc = 1 AND tp_presenca_cn = 0 AND tp_presenca_mt = 0 THEN 'Faltou segundo dia'
		 WHEN tp_presenca_ch = 0 AND tp_presenca_lc = 0 AND tp_presenca_cn = 1 AND tp_presenca_mt = 1 THEN 'Faltou primeiro dia'
		 WHEN tp_presenca_cn = 0 AND tp_presenca_ch = 0 AND tp_presenca_lc = 0 AND tp_presenca_mt = 0 THEN 'Faltou'
		 WHEN tp_presenca_cn = 2 OR tp_presenca_ch = 2 OR tp_presenca_lc = 2 OR tp_presenca_mt = 2 THEN 'Eliminado na prova'
		 END AS "presença",
	COUNT(nu_inscricao),
	COUNT(nu_inscricao)*100/(SELECT
							COUNT(nu_inscricao)
						FROM
							enem.presenca) AS porcentagem
FROM
	enem.presenca
GROUP BY
	"presença"

-- Notas
SELECT
	AVG(notas.nu_nota_cn)::float AS "Ciências da Natureza",
	AVG(notas.nu_nota_ch)::float AS "Ciências Humanas",
	AVG(notas.nu_nota_lc)::float AS "Linguagens e Códigos",
	AVG(notas.nu_nota_mt)::float AS "Matemática"	
FROM
	enem.presenca AS pre
	LEFT JOIN enem.notas AS notas
	ON pre.nu_inscricao = notas.nu_inscricao

-- Ciências da Natureza
SELECT
	CASE WHEN notas.nu_nota_cn <= 500 THEN 'Menos que 500'	
	WHEN notas.nu_nota_cn BETWEEN 500 AND 750 THEN 'Entre 500 e 750'
	WHEN notas.nu_nota_cn >= 750 THEN 'Mais que 750'
	END AS "Notas Ciências da Natureza",	
	COUNT(notas.nu_nota_cn)/1000 AS "quantidade(k)",
	COUNT(notas.nu_inscricao)*100/(SELECT
							COUNT(nu_inscricao)
						FROM
							enem.presenca
						WHERE							
							tp_presenca_cn = 1) 
							AS porcentagem,																			
	CASE WHEN notas.nu_nota_cn <= 500 THEN 0	
	WHEN notas.nu_nota_cn BETWEEN 500 AND 750 THEN 1
	WHEN notas.nu_nota_cn >= 750 THEN 2
	END AS ordem
FROM
	enem.presenca AS pre
	LEFT JOIN enem.notas AS notas
	ON pre.nu_inscricao = notas.nu_inscricao
WHERE
	tp_presenca_cn = 1
GROUP BY
	ordem,
	"Notas Ciências da Natureza"

-- Ciências Humanas
SELECT
	CASE WHEN notas.nu_nota_ch <= 500 THEN 'Menos que 500'	
	WHEN notas.nu_nota_ch BETWEEN 500 AND 750 THEN 'Entre 500 e 750'
	WHEN notas.nu_nota_ch >= 750 THEN 'Mais que 750'
	END AS "Notas Ciências Humanas",	
	COUNT(notas.nu_nota_ch)/1000 AS "quantidade(k)",
	COUNT(notas.nu_inscricao)*100/(SELECT
							COUNT(nu_inscricao)
						FROM
							enem.presenca
						WHERE							
							tp_presenca_ch = 1) 
							AS porcentagem,																			
	CASE WHEN notas.nu_nota_ch <= 500 THEN 0	
	WHEN notas.nu_nota_ch BETWEEN 500 AND 750 THEN 1
	WHEN notas.nu_nota_ch >= 750 THEN 2
	END AS ordem
FROM
	enem.presenca AS pre
	LEFT JOIN enem.notas AS notas
	ON pre.nu_inscricao = notas.nu_inscricao
WHERE
	tp_presenca_ch = 1
GROUP BY
	ordem,
	"Notas Ciências Humanas"

-- Linguagens e Códigos
SELECT
	CASE WHEN notas.nu_nota_lc <= 500 THEN 'Menos que 500'	
	WHEN notas.nu_nota_lc BETWEEN 500 AND 750 THEN 'Entre 500 e 750'
	WHEN notas.nu_nota_lc>= 750 THEN 'Mais que 750'
	END AS "Notas Linguagens e Códigos",	
	COUNT(notas.nu_nota_lc)/1000 AS "quantidade(k)",
	COUNT(notas.nu_inscricao)*100/(SELECT
							COUNT(nu_inscricao)
						FROM
							enem.presenca
						WHERE							
							tp_presenca_lc = 1) 
							AS porcentagem,																			
	CASE WHEN notas.nu_nota_lc <= 500 THEN 0	
	WHEN notas.nu_nota_lc BETWEEN 500 AND 750 THEN 1
	WHEN notas.nu_nota_lc >= 750 THEN 2
	END AS ordem
FROM
	enem.presenca AS pre
	LEFT JOIN enem.notas AS notas
	ON pre.nu_inscricao = notas.nu_inscricao
WHERE
	tp_presenca_lc = 1
GROUP BY
	ordem,
	"Notas Linguagens e Códigos"

-- Matemática
SELECT
	CASE WHEN notas.nu_nota_mt <= 500 THEN 'Menos que 500'	
	WHEN notas.nu_nota_mt BETWEEN 500 AND 750 THEN 'Entre 500 e 750'
	WHEN notas.nu_nota_mt >= 750 THEN 'Mais que 750'
	END AS "Matemática",	
	COUNT(notas.nu_nota_mt)/1000 AS "quantidade(k)",
	COUNT(notas.nu_inscricao)*100/(SELECT
							COUNT(nu_inscricao)
						FROM
							enem.presenca
						WHERE							
							tp_presenca_mt = 1) 
							AS porcentagem,																			
	CASE WHEN notas.nu_nota_mt <= 500 THEN 0	
	WHEN notas.nu_nota_mt BETWEEN 500 AND 750 THEN 1
	WHEN notas.nu_nota_mt >= 750 THEN 2
	END AS ordem
FROM
	enem.presenca AS pre
	LEFT JOIN enem.notas AS notas
	ON pre.nu_inscricao = notas.nu_inscricao
WHERE
	tp_presenca_mt = 1
GROUP BY
	ordem,
	"Matemática"

-- Redacao por competencia 
SELECT
	AVG(nu_nota_comp1) AS comp_1,
	AVG(nu_nota_comp2) AS comp_2,
	AVG(nu_nota_comp3) AS comp_3,
	AVG(nu_nota_comp4) AS comp_4,
	AVG(nu_nota_comp5) AS comp_5,
	AVG(nu_nota_redacao) AS nota_redacao
FROM
	enem.redacao
WHERE
	tp_status_redacao IS NOT NULL

-- Redação Nota
SELECT
	CASE WHEN red.nu_nota_redacao <= 500 THEN 'Menos que 500'	
	WHEN red.nu_nota_redacao BETWEEN 500 AND 750 THEN 'Entre 500 e 750'
	WHEN red.nu_nota_redacao >= 750 THEN 'Mais que 750'
	END AS "Redação",	
	COUNT(red.nu_nota_redacao)/1000 AS "quantidade(k)",
	COUNT(red.nu_inscricao)*100/(SELECT
							COUNT(nu_inscricao)
						FROM
							enem.redacao
						WHERE							
							tp_status_redacao = 1) 
							AS porcentagem,																			
	CASE WHEN red.nu_nota_redacao <= 500 THEN 0	
	WHEN red.nu_nota_redacao BETWEEN 500 AND 750 THEN 1
	WHEN red.nu_nota_redacao>= 750 THEN 2	
	END AS ordem
FROM
	enem.presenca AS pre
	LEFT JOIN enem.redacao AS red
	ON pre.nu_inscricao = red.nu_inscricao
WHERE
	red.tp_status_redacao = 1
GROUP BY
	ordem,
	"Redação"