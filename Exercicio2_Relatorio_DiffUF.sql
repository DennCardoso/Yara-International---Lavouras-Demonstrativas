/*
O select busca a média da diferença de Produtividade relativa por área entre os tratamentos Yara e Atual, agrupados por UF
Para isso buscamos os seguinte dado: Descrição da UF
Realizamos os seguinte calculo.:
- Total de Produvidade (sacas/m2) = (Produtividade Tratamento Yara + Produtividade tratamento Atual)/(Tamanho da Colheita*10000m2)
- Diferença da Produtividade (sacas)  = (Produtividade Tratamento Yara - Produtividade tratamento Atual)/(Tamanho da Colheita*10000m2)
- Diferença da Produtividade relativa (entre 0.00 a 1.00) = Diferença da Produtividade/Total de Produvidade
- Media da Diferença da Produtividade Relativa (percentual) = Funcão Média (Diferença da Produtividade Relativa) * 100
- Desta maneira, temos a Média da Diferença da Produtividade Relativa, arredondado para duas casas decimais
- Por fim, agrupamos a média desse valor por UF
*/

select 
		f.UF_fazenda 'UF',
		ROUND(avg((ty.Produtividade_tratamento - ta.Produtividade_tratamento)/(ty.Produtividade_tratamento + ta.Produtividade_tratamento))*100,2) 'media_Diff_Prod_Relativa_UF'
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
Group by f.UF_fazenda