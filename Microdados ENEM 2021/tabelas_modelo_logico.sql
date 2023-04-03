-- criação das tabelas do modelo lógico mostradas no diagrama

-- participantes
SELECT
	"NU_INSCRICAO" AS NU_inscricao,
	"NU_ANO" AS nu_ano,
	"TP_FAIXA_ETARIA" AS tp_faixa_etaria,
	"TP_SEXO" AS tp_sexo,
	"TP_ESTADO_CIVIL" AS tp_estado_civil,
	"TP_COR_RACA" AS tp_cor_raca,
	"TP_NACIONALIDADE" AS tp_nacionalidade,
	"TP_ST_CONCLUSAO" AS tp_st_conclusao,
	"TP_ANO_CONCLUIU" AS tp_ano_concluiu,
	"TP_ESCOLA" AS tp_escola,
	"TP_ENSINO"	AS tp_ensino,
	"IN_TREINEIRO" AS in_treineiro
	INTO enem.participantes
FROM
	enem.microdados_enem_2021

-- presenca
SELECT
	"NU_INSCRICAO" AS nu_inscricao,
	"TP_PRESENCA_CN" AS tp_presenca_cn,
	"TP_PRESENCA_CH" AS tp_presenca_ch,
	"TP_PRESENCA_LC" AS tp_presenca_lc,
	"TP_PRESENCA_MT" AS tp_presenca_mt
	INTO enem.presenca
FROM
	enem.microdados_enem_2021

-- escolaridade
SELECT
	"NU_INSCRICAO" AS nu_inscricao,
	"CO_MUNICIPIO_ESC" AS co_municipio_esc,
	"NO_MUNICIPIO_ESC" AS no_municipio_esc,
	"CO_UF_ESC" AS CO_UF_ESC,
	"SG_UF_ESC" AS sg_uf_esc,
	"TP_DEPENDENCIA_ADM_ESC" AS tp_dependencia_adm_esc,
	"TP_LOCALIZACAO_ESC" AS tp_localizacao_esc,
	"TP_SIT_FUNC_ESC" AS tp_sit_func_esc
	INTO enem.escolaridade
FROM
	enem.microdados_enem_2021

-- notas
SELECT
	"NU_INSCRICAO" AS nu_inscricao,
	"NU_NOTA_CN" AS nu_nota_cn,
	"NU_NOTA_CH" AS nu_nota_ch,
	"NU_NOTA_LC" AS nu_nota_lc,
	"NU_NOTA_MT " AS nu_nota_mt
	INTO enem.notas
	
FROM
	enem.microdados_enem_2021
	
-- aplicacao
SELECT
	"NU_INSCRICAO" AS nu_inscricao,
	"CO_MUNICIPIO_PROVA" AS co_municipio_prova,
	"NO_MUNICIPIO_PROVA " AS no_municipio_prova,
	"CO_UF_PROVA" AS co_uf_prova,
	"SG_UF_PROVA" AS sg_uf_prova
	INTO enem.aplicacao
FROM
	enem.microdados_enem_2021

-- redacao
SELECT
	"NU_INSCRICAO" AS nu_inscricao,
	"TP_STATUS_REDACAO" AS tp_status_redacao,
	"NU_NOTA_COMP1" AS nu_nota_comp1,
	"NU_NOTA_COMP2" AS nu_nota_comp2,
	"NU_NOTA_COMP3" AS nu_nota_comp3,
	"NU_NOTA_COMP4" AS nu_nota_comp4,
	"NU_NOTA_COMP5" AS nu_nota_comp5,
	"NU_NOTA_REDACAO" AS nu_nota_redacao
	INTO enem.redacao
FROM
	enem.microdados_enem_2021

-- questionario
SELECT
	"NU_INSCRICAO" AS nu_inscricao,
	"Q001" AS q_001,
	"Q002" AS q_002,
	"Q003" AS q_003,
	"Q004" AS q_004,
	"Q005" AS q_005,
	"Q006" AS q_006,
	"Q007" AS q_007,
	"Q008" AS q_008,
	"Q009" AS q_009,
	"Q010" AS q_010,
	"Q011" AS q_011,
	"Q012" AS q_012,
	"Q013" AS q_013,
	"Q014" AS q_014,
	"Q015" AS q_015,
	"Q016" AS q_016,
	"Q017" AS q_017,
	"Q018" AS q_018,
	"Q019" AS q_019,
	"Q020" AS q_020,
	"Q021" AS q_021,
	"Q022" AS q_022,
	"Q023" AS q_023,
	"Q024" AS q_024,
	"Q025" AS q_025
	INTO enem.questionario
FROM
	enem.microdados_enem_2021


