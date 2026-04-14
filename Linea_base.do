cd "D:\OneDrive - Ministerio de Educación\00. Paolo\Actividades\01. Evaluación PNIE\02. IE-PNIE\data"

cd "E:\OneDrive - Ministerio de Educación\00. Paolo\Actividades\01. Evaluación PNIE\02. IS-PNIE\data"
// Data_completa
use "LE_BasePr_PNIE.dta", clear

tabstat CT_grupo1 CT_grupo2 CT_grupo3 CT_grupo4 CT_grupo5 costoSAFIL ///
	COSTO_TOTAL, s(sum) format(%18.2fc)

use "BasePNIE.dta", clear

tabstat CT_grupo1 CT_grupo2 CT_grupo3 CT_grupo4 CT_grupo5 costoSAFIL ///
	COSTO_TOTAL, s(sum) format(%18.2fc)



summarize COSTO_TOTAL, d
gsort -COSTO_TOTAL
count if COSTO_TOTAL > 0 & COSTO_TOTAL != .


// GI1:
tabstat CTot_locdem CTot_edifdem, s(sum) format(%18.2fc)


tabstat CTot_refinc, s(sum) format(%18.2fc)
br CTot_refinc
gsort -CTot_refinc


tabstat CTot_icont CTot_icont_p4g8 CTot_icont_p3g1 ///
	CTot_MyE_repospar_p3, s(sum) format(%18.2fc)
tabstat CTot_icont CTot_icont_p4g8 CTot_icont_p3g1, ///
	s(sum) format(%18.2fc)
br CTot_icont_p3g1
gsort -CTot_icont_p3g1
count if CTot_icont_p3g1 > 0 & CTot_icont_p3g1 != .


tabstat CTot_MyEq_nuevoPS CTot_PS, ///
	s(sum) format(%18.2fc)
count if CTot_PS > 0 & CTot_PS != .

tabstat Ctot_cerco, ///
	s(sum) format(%18.2fc)
count if Ctot_cerco > 0 & Ctot_cerco != .


tabstat CTot_locdem CTot_edifdem CTot_refinc CTot_icont CTot_icont_p4g8 ///
	CTot_icont_p3g1 CTot_PS Ctot_cerco CT_grupo1, s(sum) format(%18.2fc)



// GI2:
tabstat ctot_i1_acs_c_modif ctot_sin_inundable, s(sum) format(%18.2fc)
tabstat ct_acc_agua ct_inundable ct_acc_saneamiento, s(sum) format(%18.2fc)
count if ctot_i1_acs_c_modif > 0 & ctot_i1_acs_c_modif != .

tabstat ctot_calidadays_aj, s(sum) format(%18.2fc)
count if ctot_calidadays_aj > 0 & ctot_calidadays_aj != .

// GI3:
tabstat CT_CalidadEle, s(sum) format(%18.2fc)
count if CT_CalidadEle > 0 & CT_CalidadEle != .

tabstat Mobiliario_E, s(sum) format(%18.2fc)
count if Mobiliario_E > 0 & Mobiliario_E != .

tabstat CTot_ENE, s(sum) format(%18.2fc)
count if CTot_ENE > 0 & CTot_ENE != .

tabstat CT_CalidadEle Mobiliario_E CTot_ENE CT_grupo3, s(sum) format(%18.2fc)


// GI4:
tabstat costoAccE_mod, s(sum) format(%18.2fc)
count if costoAccE_mod > 0 & costoAccE_mod != .

tabstat Ctot_accesibilidad, s(sum) format(%18.2fc)
count if Ctot_accesibilidad > 0 & Ctot_accesibilidad != .

tabstat CTot_ampLOC CTot_amp_sec CTot_amp_pri CTot_amp_ini ///
	CTot_amp_ist CTot_amp_isp CTot_amp_esfa CTot_amp_ebe CTot_amp_eba ///
	CTot_amp_cetpro, s(sum) format(%18.2fc)
count if CTot_amp_sec > 0 & CTot_amp_sec != .
count if CTot_amp_pri > 0 & CTot_amp_pri != .
count if CTot_amp_ini > 0 & CTot_amp_ini != .
count if CTot_amp_ist > 0 & CTot_amp_ist != .
count if CTot_amp_isp > 0 & CTot_amp_isp != .
count if CTot_amp_ebe > 0 & CTot_amp_ebe != .
count if CTot_amp_eba > 0 & CTot_amp_eba != .
count if CTot_amp_cetpro > 0 & CTot_amp_cetpro != .

tabstat CTot_refconv, s(sum) format(%18.2fc)
count if CTot_refconv > 0 & CTot_refconv != .

tabstat Ctot_MyE_IEDEM CTot_edifdem CTot_repo_edifdem, ///
	s(sum) format(%18.2fc)
count if CTot_repo_edifdem > 0 & CTot_repo_edifdem != .

tabstat CTot_icont_p4g8, s(sum) format(%18.2fc)
count if CTot_icont_p4g8 > 0 & CTot_icont_p4g8 != .

tabstat CTot_locdem CTot_repLOC, s(sum) format(%18.2fc)
count if CTot_repLOC > 0 & CTot_repLOC != .

// ET
tabstat costoSAFIL, s(sum) format(%18.2fc)
count if costoSAFIL > 0 & costoSAFIL != .


use "LE_BasePr.dta", clear

use "LE_BasePr_2021", clear

tabstat b_1 b_2 b_3 b_4 b_5 b_safil, s(sum) format(%18.2fc)



// PADRON 2012
import dbase using "Padron_2012.dbf", clear case(lower)

replace codlocal = "" if cod_mod == codlocal

bys gestion: distinct codlocal, missing
distinct codlocal if gestion == "1" | gestion == "2", missing

bys formas: distinct codlocal if gestion == "1" | gestion == "2", missing


// PADRON 2013
import dbase using "Padron_2013.dbf", clear case(lower)

bys gestion: distinct codlocal, missing
distinct codlocal if gestion == "1" | gestion == "2", missing


import dbase using "Padlocal.dbf", clear case(lower)

distinct codlocal
tab ges_loc, m
tab ges_ie, m


bys ges_ie: distinct codlocal


// PADRON 2014
import dbase using "Padron_2014.dbf", clear case(lower)

bys gestion: distinct codlocal, missing
distinct codlocal if gestion == "1" | gestion == "2", missing






// Meta: 49,516 MINEDU | INEI 46,159



