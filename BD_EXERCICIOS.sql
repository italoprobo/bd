SELECT NOME FROM HOSPEDE WHERE COD_HOSP>1;

SELECT NOME FROM HOSPEDE WHERE DT_NASC BETWEEN '2002-01-01' AND '2003-12-31';

SELECT NOME FROM HOSPEDE WHERE NOME ILIKE '%N%';

SELECT NOME FROM HOSPEDE WHERE COD_HOSP IN (SELECT COD_HOSP FROM HOSPEDAGEM WHERE DT_ENTRADA = '2023-01-10');

SELECT COD_HOSP, NOME FROM HOSPEDE WHERE COD_HOSP IN 
(SELECT COD_HOSP FROM HOSPEDAGEM WHERE NUM IN (SELECT NUM FROM APARTAMENTO WHERE COD_CAT = 2));

SELECT COD_HOSP, NOME FROM HOSPEDE WHERE COD_HOSP IN 
(SELECT COD_HOSP FROM HOSPEDAGEM WHERE NUM IN
(SELECT NUM FROM APARTAMENTO WHERE COD_CAT IN 
(SELECT COD_CAT FROM CATEGORIA WHERE NOME = 'LUXO')));

SELECT COD_HOSP, NOME FROM HOSPEDE WHERE COD_HOSP IN 
(SELECT COD_HOSP FROM HOSPEDAGEM WHERE NUM IN 
(SELECT NUM FROM APARTAMENTO WHERE COD_CAT IN 
(SELECT COD_CAT FROM CATEGORIA WHERE NOME = 'LUXO')) 
OR COD_HOSPEDA IN (SELECT COD_HOSPEDA FROM SOLICITACAO WHERE COD_SERV =3))

SELECT NOME FROM HOSPEDE WHERE COD_HOSP IN (SELECT COD_HOSP FROM HOSPEDAGEM WHERE DT_ENTRADA =
(SELECT MIN(DT_ENTRADA) FROM HOSPEDAGEM WHERE
DT_ENTRADA BETWEEN '2022-01-01' AND '2023-12-31'));
