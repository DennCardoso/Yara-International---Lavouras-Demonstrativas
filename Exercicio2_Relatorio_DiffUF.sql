/*
O select busca a média da diferença de Produtividade por área entre os tratamentos Yara e Atual, agrupados por UF
Para isso buscamos os seguintes dados: Código da Cultura, Descrição da cultura.
Realizamos os seguinte calculo.:
- Para cada comparação no relatório, temos a produtividade do tratamento Yara e do Tratamento Atual.
- É realizado a subtração entre Prod Yara e Prod atual e esse resultado é dividido pelo TamColhido(Ha)*10000 (transformação e Hectares para Metros quadrados).
- Desta maneira temos a quantidade da diferença entre produtividade por metro quadrado (m2).
- Por fim, agrupamos a média desse valor por UF para finalmente obtermos o valor.
*/

select 
f.UF_fazenda 'UF',
avg((ty.Produtividade_tratamento - ta.Produtividade_tratamento)/l.TamColhido_lavoura*10000)  'Media da Diferença de Produtividade por áreas entre tratamento'
from Tratamento_Relatorio tr
inner join Tratamento ty
on tr.id_tratamento_yara = ty.Id_tratamento
inner join Tratamento ta
on tr.id_tratamento_atual = ta.Id_tratamento
inner join relatorio r
on tr.id_relatorio = r.Id_relatorio
inner join lavoura l
on r.id_lavoura = l.id_lavoura
inner join cultura c
on l.id_cultura_lavoura = c.Id_cultura
inner join fazenda f
on l.id_fazenda = f.id_fazenda
group by f.UF_Fazenda