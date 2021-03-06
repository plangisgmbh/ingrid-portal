---
-- **************************************************-
-- Ingrid Portal Base
-- ==================================================
-- Copyright (C) 2014 wemove digital solutions GmbH
-- ==================================================
-- Licensed under the EUPL, Version 1.1 or – as soon they will be
-- approved by the European Commission - subsequent versions of the
-- EUPL (the "Licence");
-- 
-- You may not use this work except in compliance with the Licence.
-- You may obtain a copy of the Licence at:
-- 
-- http://ec.europa.eu/idabc/eupl5
-- 
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the Licence is distributed on an "AS IS" basis,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the Licence for the specific language governing permissions and
-- limitations under the Licence.
-- **************************************************#
---
INSERT INTO ingrid_partner (id, ident, name, sortkey) VALUES (1, 'bund', 'Bund', 1);
INSERT INTO ingrid_partner (id, ident, name, sortkey) VALUES (2, 'bw', 'Baden-W�rttemberg', 2);
INSERT INTO ingrid_partner (id, ident, name, sortkey) VALUES (3, 'by', 'Bayern', 3);
INSERT INTO ingrid_partner (id, ident, name, sortkey) VALUES (4, 'be', 'Berlin', 4);
INSERT INTO ingrid_partner (id, ident, name, sortkey) VALUES (5, 'bb', 'Brandenburg', 5);
INSERT INTO ingrid_partner (id, ident, name, sortkey) VALUES (6, 'hb', 'Bremen', 6);
INSERT INTO ingrid_partner (id, ident, name, sortkey) VALUES (7, 'hh', 'Hamburg', 7);
INSERT INTO ingrid_partner (id, ident, name, sortkey) VALUES (8, 'he', 'Hessen', 8);
INSERT INTO ingrid_partner (id, ident, name, sortkey) VALUES (9, 'mv', 'Mecklenburg-Vorpommern', 9);
INSERT INTO ingrid_partner (id, ident, name, sortkey) VALUES (10, 'ni', 'Niedersachsen', 10);
INSERT INTO ingrid_partner (id, ident, name, sortkey) VALUES (11, 'nw', 'Nordrhein-Westfalen', 11);
INSERT INTO ingrid_partner (id, ident, name, sortkey) VALUES (12, 'rp', 'Rheinland-Pfalz', 12);
INSERT INTO ingrid_partner (id, ident, name, sortkey) VALUES (13, 'sl', 'Saarland', 13);
INSERT INTO ingrid_partner (id, ident, name, sortkey) VALUES (14, 'sn', 'Sachsen', 14);
INSERT INTO ingrid_partner (id, ident, name, sortkey) VALUES (15, 'st', 'Sachsen-Anhalt', 15);
INSERT INTO ingrid_partner (id, ident, name, sortkey) VALUES (16, 'sh', 'Schleswig-Holstein', 16);
INSERT INTO ingrid_partner (id, ident, name, sortkey) VALUES (17, 'th', 'Th�ringen', 17);

INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (1, 'bu_bmu', 'Bundesministerium f�r Umwelt, Naturschutz und Reaktorsicherheit', 'http://www.bmu.de/', 1, 1);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (2, 'bu_uba', 'Umweltbundesamt', 'http://www.umweltbundesamt.de/', 2, 1);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (3, 'bu_bfn', 'Bundesamt f�r Naturschutz', 'http://www.bfn.de/', 3, 1);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (4, 'bu_bfs', 'Bundesamt f�r Strahlenschutz', 'http://www.bfs.de/', 4, 1);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (5, 'bu_bmf', 'Bundesministerium der Finanzen', 'http://www.bundesfinanzministerium.de/', 5, 1);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (6, 'bu_bmbf', 'Bundesministerium f�r Bildung und Forschung', 'http://www.bmbf.de/', 6, 1);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (7, 'bu_bmelv', 'Bundesministerium f�r Ern�hrung, Landwirtschaft und Verbraucherschutz', 'http://www.bmelv.de/cln_044/DE/00-Home/__Homepage__node.html__nnn=true', 7, 1);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (8, 'bu_bmz', 'Bundesministerium f�r wirtschaftliche Zusammenarbeit und Entwicklung', 'http://www.bmz.de/', 8, 1);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (9, 'bu_aa', 'Ausw�rtiges Amt', 'http://www.auswaertiges-amt.de/', 10, 1);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (10, 'bu_bsh', 'Bundesamt f�r Seeschifffahrt und Hydrographie', 'http://www.bsh.de/', 11, 1);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (11, 'bu_bvl', 'Bundesamt f�r Verbraucherschutz und Lebensmittelsicherheit', 'http://www.bvl.bund.de/', 12, 1);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (12, 'bu_bgr', 'Bundesanstalt f�r Geowissenschaften und Rohstoffe', 'http://www.bgr.bund.de/', 13, 1);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (13, 'bu_bfg', 'Bundesanstalt f�r Gew�sserkunde', 'http://www.bafg.de/', 14, 1);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (14, 'bu_nokis', 'Bundesanstalt f�r Wasserbau - Dienststelle Hamburg', 'http://www.hamburg.baw.de/', 15, 1);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (15, 'bu_bfr', 'Bundesinstitut f�r Risikobewertung', 'http://www.bfr.bund.de/', 16, 1);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (16, 'bu_bka', 'Bundeskriminalamt', 'http://www.bka.de/', 17, 1);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (17, 'bu_rki', 'Robert-Koch-Institut', 'http://www.rki.de/', 18, 1);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (18, 'bu_stba', 'Statistisches Bundesamt', 'http://www.destatis.de/', 19, 1);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (19, 'bu_ble', 'Bundesanstalt f�r Landwirtschaft und Ern�hrung', 'http://www.ble.de', 20, 1);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (20, 'bu_bpb', 'Bundeszentrale f�r politische Bildung', 'http://www.bpb.de/', 21, 1);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (21, 'bu_gtz', 'Deutsche Gesellschaft f�r Technische Zusammenarbeit (GTZ) GmbH', 'http://www.gtz.de/', 22, 1);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (22, 'bu_dwd', 'Deutscher Wetterdienst', 'http://www.dwd.de/', 23, 1);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (23, 'bu_dlr', 'Deutsches Zentrum f�r Luft- und Raumfahrt DLR e.V.', 'http://www.dlr.de/', 24, 1);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (24, 'bu_kug', 'Koordinierungsstelle PortalU', 'http://www.kst.portalu.de/', 25, 1);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (25, 'bu_labo', 'L�nderarbeitsgemeinschaft Boden LABO', 'http://www.labo-deutschland.de/', 26, 1);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (26, 'bu_lawa', 'L�nderarbeitsgemeinschaft Wasser', 'http://www.lawa.de/', 27, 1);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (27, 'bu_laofdh', 'Leitstelle des Bundes f�r Abwassertechnik, Boden- und Grundwasserschutz, Kampfmittelr�umung und das Liegenschaftsinformationssystem Au�enanlagen LISA', 'http://www.ofd-hannover.de/la/', 28, 1);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (28, 'bu_bpa', 'Presse- und Informationsamt der Bundesregierung', 'http://www.bundesregierung.de/', 29, 1);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (29, 'bu_blauerengel', 'RAL/Umweltbundesamt Umweltzeichen "Blauer Engel"', 'http://www.blauer-engel.de/', 30, 1);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (30, 'bu_sru', 'Rat von Sachverst�ndigen f�r Umweltfragen (SRU)', 'http://www.umweltrat.de/', 31, 1);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (31, 'bu_ssk', 'Strahlenschutzkommission', 'http://www.ssk.de/', 32, 1);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (32, 'bu_umk', 'Umweltministerkonferenz', 'http://www.umweltministerkonferenz.de/', 33, 1);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (33, 'bu_wbgu', 'Wissenschaftlicher Beirat der Bundesregierung Globale Umweltver�nderungen - WBGU', 'http://www.wbgu.de/', 34, 1);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (34, 'bu_agenda', 'Agenda-Transfer. Agentur f�r Nachhaltigkeit GmbH', 'http://www.agenda-transfer.de/', 35, 1);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (35, 'bu_uga', 'Umweltgutachterausschuss (UGA)', 'http://www.uga.de/', 36, 1);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (36, 'bu_co2', 'co2online gGmbH Klimaschutzkampagne', 'http://www.co2online.de/', 37, 1);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (37, 'bu_dekade', 'Weltdekade �Bildung f�r nachhaltige Entwicklung�', 'http://www.dekade.org/index.htm', 38, 1);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (38, 'bw_um', 'Umweltministerium Baden-W�rttemberg', 'http://www.um.baden-wuerttemberg.de/', 1, 2);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (39, 'bw_mi', 'Innenministerium Baden-W�rttemberg', 'http://www.innenministerium.baden-wuerttemberg.de/', 2, 2);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (40, 'bw_mlr', 'Ministerium f�r Ern�hrung und L�ndlichen Raum Baden-W�rttemberg', 'http://www.mlr.baden-wuerttemberg.de/', 3, 2);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (41, 'bw_mw', 'Wirtschaftsministerium Baden-W�rttemberg', 'http://www.wm.baden-wuerttemberg.de/', 4, 2);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (42, 'bw_lu', 'Landesanstalt f�r Umwelt, Messungen und Naturschutz Baden-W�rttemberg', 'http://www.lubw.baden-wuerttemberg.de/', 5, 2);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (43, 'bw_lgrb', 'Regierungspr�sidium Freiburg - Abt. 9 Landesamt f�r Geologie, Rohstoffe und Boden', 'http://www.lgrb.uni-freiburg.de/lgrb/home/index_html', 6, 2);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (44, 'bw_lvm', 'Landesvermessungsamt Baden-W�rttemberg', 'http://www.lv-bw.de/lvshop2/index.htm', 7, 2);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (45, 'bw_lel', 'Informationsdienst der Landwirtschaftsverwaltung Baden-W�rttemberg', 'http://www.landwirtschaft-mlr.baden-wuerttemberg.de/servlet/PB/-s/153h2f7ajcsu0yhrl7ib9karcotj9kv/menu/1034707_l1/index.html', 8, 2);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (46, 'bw_gaa', 'Staatliche Gewerbeaufsicht Baden-W�rttemberg', 'http://www.gewerbeaufsicht.baden-wuerttemberg.de/', 9, 2);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (47, 'bw_stla', 'Statistisches Landesamt Baden-W�rttemberg', 'http://www.statistik-bw.de/', 10, 2);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (48, 'bw_fzk', 'Forschungszentrum Karlsruhe GmbH', 'http://www.fzk.de/', 11, 2);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (49, 'by_sugv', 'Bayerisches Staatsministerium f�r Umwelt, Gesundheit und Verbraucherschutz', 'http://www.stmugv.bayern.de/', 1, 3);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (50, 'by_gla', 'Bayerisches Geologisches Landesamt', 'http://www.geologie.bayern.de/', 2, 3);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (51, 'by_lfstad', 'Bayerisches Landesamt f�r Statistik und Datenverarbeitung', 'http://www.statistik.bayern.de/', 3, 3);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (52, 'by_lfu', 'Bayerisches Landesamt f�r Umweltschutz', 'http://www.bayern.de/lfu/', 4, 3);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (53, 'by_lfw', 'Bayerisches Landesamt f�r Wasserwirtschaft', 'http://www.bayern.de/lfw', 5, 3);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (54, 'by_brrhoen', 'Biosph�renreservat Rh�n', 'http://www.biosphaerenreservat-rhoen.de/', 6, 3);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (55, 'by_npbayw', 'Nationalpark Bayerischer Wald', 'http://www.nationalpark-bayerischer-wald.de/', 7, 3);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (56, 'by_npbg', 'Nationalpark Berchtesgaden', 'http://www.nationalpark-berchtesgaden.de/', 8, 3);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (57, 'be_senst', 'Senatsverwaltung f�r Stadtentwicklung', 'http://www.stadtentwicklung.berlin.de/umwelt/', 1, 4);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (58, 'be_snb', 'Stiftung Naturschutz Berlin', 'http://www.stiftung-naturschutz.de/', 2, 4);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (59, 'be_uacw', 'Amt f�r Umwelt, Natur und Verkehr Charlottenburg-Wilmersdorf', 'http://www.charlottenburg-wilmersdorf.de/umweltamt', 3, 4);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (60, 'bb_mluv', 'Ministerium f�r L�ndliche Entwicklung, Umwelt und Verbraucherschutz des Landes Brandenburg', 'http://www.mluv.brandenburg.de/', 1, 5);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (61, 'hb_sbu', 'Senator f�r Bau und Umwelt Bremen', 'http://www.umwelt.bremen.de/buisy/scripts/buisy.asp', 1, 6);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (62, 'hh_su', 'Beh�rde f�r Stadtentwicklung und Umwelt Hamburg', 'http://fhh.hamburg.de/stadt/Aktuell/behoerden/stadtentwicklung-umwelt/start.html', 1, 7);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (63, 'hh_wa', 'Beh�rde f�r Wirtschaft und Arbeit Hamburg', 'http://fhh.hamburg.de/stadt/Aktuell/behoerden/wirtschaft-arbeit/start.html', 2, 7);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (64, 'hh_bsg', 'Beh�rde f�r Soziales, Familie, Gesundheit und Verbraucherschutz', 'http://fhh.hamburg.de/stadt/Aktuell/behoerden/bsg/start.html', 3, 7);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (65, 'hh_lgv', 'Landesbetrieb Geoinformation und Vermessung Hamburg', 'http://fhh.hamburg.de/stadt/Aktuell/weitere-einrichtungen/landesbetrieb-geoinformation-und-vermessung', 4, 7);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (66, 'hh_npwatt', 'Nationalpark Hamburgisches Wattenmeer', 'http://fhh1.hamburg.de/Behoerden/Umweltbehoerde/nphw/', 5, 7);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (67, 'hh_argeelbe', 'Arbeitsgemeinschaft f�r die Reinhaltung der Elbe', 'http://www.arge-elbe.de/', 6, 7);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (68, 'hh_sth', 'Statistisches Amt f�r Hamburg und Schleswig-Holstein', 'http://www.statistik-nord.de/index.php?id=32', 7, 7);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (69, 'he_hmulv', 'Hessisches Ministerium f�r Umwelt, l�ndlichen Raum und Verbraucherschutz', 'http://www.hmulv.hessen.de/', 1, 8);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (70, 'he_hlug', 'Hessisches Landesamt f�r Umwelt und Geologie', 'http://www.hlug.de/', 2, 8);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (71, 'he_umwelt', 'Umweltatlas Hessen', 'http://atlas.umwelt.hessen.de/', 3, 8);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (72, 'mv_um', 'Umweltministerium Mecklenburg-Vorpommern', 'http://www.um.mv-regierung.de/', 1, 9);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (73, 'mv_sm', 'Sozialministerium Mecklenburg-Vorpommern', 'http://www.sozial-mv.de/', 2, 9);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (74, 'mv_lung', 'Landesamt f�r Umwelt, Naturschutz und Geologie Mecklenburg-Vorpommern (LUNG)', 'http://www.lung.mv-regierung.de/', 3, 9);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (75, 'mv_lfmv', 'Landesforst Mecklenburg-Vorpommern A�R', 'http://www.wald-mv.de/', 4, 9);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (76, 'mv_schaalsee', 'Amt f�r das Biosph�renreservat Schaalsee', 'http://www.schaalsee.de/', 5, 9);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (77, 'mv_npmueritz', 'Nationalparkamt M�ritz', 'http://www.nationalpark-mueritz.de/', 6, 9);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (78, 'mv_nvblmv', 'Nationalparkamt Vorpommersche Boddenlandschaft', 'http://www.nationalpark-vorpommersche-bodde/nlandschaft.de/', 7, 9);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (79, 'mv_fhstr', 'Fachhochschule Stralsund', 'http://www.fh-stralsund.de/', 8, 9);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (80, 'mv_fhnb', 'Hochschule Neubrandenburg', 'http://www.fh-nb.de/', 9, 9);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (81, 'mv_hswi', 'Hochschule Wismar', 'http://www.hs-wismar.de/', 10, 9);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (82, 'mv_iow', 'Institut f�r Ostseeforschung Warnem�nde', 'http://www.io-warnemuende/.de/', 11, 9);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (83, 'mv_unigr', 'Universit�t Greifswald', 'http://www.uni-greifswald.de/', 12, 9);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (84, 'mv_uniro', 'Universit�t Rostock', 'http://www.uni-rostock.de/', 13, 9);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (85, 'ni_mu', 'Nieders�chsisches Umweltministerium', 'http://www.mu.niedersachsen.de/', 1, 10);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (86, 'ni_mw', 'Nieders�chsisches Ministerium f�r Wirtschaft, Arbeit und Verkehr', 'http://www.mw.niedersachsen.de/', 2, 10);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (87, 'ni_ms', 'Nieders�chsisches Ministerium f�r Soziales, Frauen, Familie und Gesundheit', 'http://www.ms.niedersachsen.de/', 3, 10);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (88, 'ni_mi', 'Nieders�chsisches Ministerium f�r Inneres und Sport', 'http://www.mi.niedersachsen.de/', 4, 10);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (89, 'ni_ml', 'Nieders�chsisches Ministerium f�r den l�ndlichen Raum, Ern�hrung, Landwirtschaft und Verbraucherschutz', 'http://www.ml.niedersachsen.de/', 5, 10);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (90, 'ni_nlwkn', 'Nieders�chsischer Landesbetrieb f�r Wasserwirtschaft, K�sten- und Naturschutz', 'http://www.nlwkn.de/', 6, 10);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (91, 'ni_lbeg', 'Landesamt f�r Bergbau, Energie und Geologie', 'http://www.lbeg.niedersachsen.de/master/C17456312_L20_D0.html', 7, 10);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (92, 'ni_nls', 'Nieders�chsisches Landesamt f�r Statistik', 'http://www.nls.niedersachsen.de/', 8, 10);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (93, 'ni_laves', 'Nieders�chsisches Landesamt f�r Verbraucherschutz und Lebensmittelsicherheit', 'http://www.laves.niedersachsen.de/', 9, 10);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (94, 'ni_lga', 'Nieders�chsisches Landesgesundheitsamt', 'http://www.nlga.niedersachsen.de/', 10, 10);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (95, 'ni_sbv', 'Nieders�chsische Landesbeh�rde f�r Stra�enbau und Verkehr', 'http://www.strassenbau.niedersachsen.de/', 11, 10);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (96, 'ni_nna', 'Alfred Toepfer Akademie f�r Naturschutz', 'http://www.nna.de/', 12, 10);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (97, 'ni_gll', 'Beh�rden f�r Geoinformation, Landentwicklung und Liegenschaften Niedersachsen', 'http://www.gll.niedersachsen.de', 13, 10);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (98, 'ni_gga', 'Institut f�r Geowissenschaftliche Gemeinschaftsaufgaben ', 'http://www.gga-hannover.de', 14, 10);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (99, 'ni_lgn', 'Landesvermessung und Geobasisinformation Niedersachsen', 'http://www.lgn.niedersachsen.de/', 15, 10);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (100, 'ni_lwkh', 'Landwirtschaftskammer Hannover', 'http://www.lwk-hannover.de/', 16, 10);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (101, 'ni_npwatt', 'Nationalpark Wattenmeer', 'http://www.nationalpark-wattenmeer.niedersachsen.de/master/C5912120_L20_D0.html', 17, 10);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (102, 'ni_npharz', 'Nationalparkverwaltung Harz', 'http://www.nationalpark-harz.de/', 18, 10);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (103, 'ni_gaa', 'Nieders�chsische Gewerbeaufsicht', 'http://www.gewerbeaufsicht.niedersachsen.de/master/C1717445_N1717446_L20_D0_I1717444.html', 19, 10);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (104, 'ni_elbtal', 'Biosph�renreservat Elbtalaue', 'http://www.elbtalaue.niedersachsen.de/master/C6933729_L20_D0.html', 20, 10);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (105, 'nw_munlv', 'Ministerium f�r Umwelt und Naturschutz, Landwirtschaft und Verbraucherschutz des Landes Nordrhein-Westfalen', 'http://www.munlv.nrw.de/', 1, 11);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (106, 'nw_lua', 'Landesumweltamt Nordrhein-Westfalen', 'http://www.lua.nrw.de/', 2, 11);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (107, 'nw_loebf', 'Landesanstalt f�r �kologie, Bodenordnung und Forsten des Landes Nordrhein-Westfalen (L�BF)', 'http://www.loebf.nrw.de/', 3, 11);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (108, 'nw_gd', 'Geologischer Dienst Nordrhein-Westfalen', 'http://www.gd.nrw.de/', 4, 11);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (109, 'nw_stuaha', 'Staatliches Umweltamt Hagen', 'http://www.stua-ha.nrw.de/', 5, 11);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (110, 'nw_stualp', 'Staatliches Umweltamt Lippstadt', 'http://www.stua-lp.nrw.de/', 6, 11);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (111, 'nw_ldvst', 'Landesamt f�r Datenverarbeitung und Statistik Nordrhein-Westfalen', 'http://www.ugrdl.de/index.html', 7, 11);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (112, 'rp_mufv', 'Ministerium f�r Umwelt, Forsten und Verbraucherschutz des Landes Rheinland-Pfalz', 'http://www.mufv.rlp.de/', 1, 12);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (113, 'rp_lfug', 'Landesamt f�r Umweltschutz und Gewerbeaufsicht Rheinland-Pfalz', 'http://www.luft-rlp.de/aktuell/messwerte/', 2, 12);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (114, 'rp_hmz', 'Landesamt f�r Wasserwirtschaft Rheinland-Pfalz', 'http://www.hochwasser-rlp.de/', 3, 12);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (115, 'rp_forst', 'Landesforstverwaltung Rheinland-Pfalz', 'http://www.wald-rlp.de/', 4, 12);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (116, 'rp_lzu', 'Landeszentrale f�r Umweltaufkl�rung Rheinland-Pfalz', 'http://www.umdenken.de/', 5, 12);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (117, 'sl_mfu', 'Ministerium f�r Umwelt Saarland', 'http://www.umwelt.saarland.de/', 1, 13);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (118, 'sl_lua', 'Landesamt f�r Umwelt- und Arbeitsschutz Saarland', 'http://www.lua.saarland.de/', 2, 13);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (119, 'sn_smul', 'S�chsisches Staatsministerium f�r Umwelt und Landwirtschaft', 'http://www.umwelt.sachsen.de/de/wu/umwelt/index.html', 1, 14);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (120, 'sn_lfug', 'S�chsisches Landesamt f�r Umwelt und Geologie', 'http://www.umwelt.sachsen.de/lfug/', 2, 14);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (121, 'sn_lanu', 'S�chsische Landesstiftung Natur und Umwelt', 'http://www.lanu.de/templates/intro.php', 3, 14);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (122, 'st_mlu', 'Ministerium f�r Landwirtschaft und Umwelt Sachsen-Anhalt', 'http://www.sachsen-anhalt.de/rcs/LSA/pub/Ch1/fld8311011390180834/mainfldmtgpollxof/pgnotsi64lb6/index.jsp', 1, 15);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (123, 'st_lau', 'Landesamt f�r Umweltschutz Sachsen-Anhalt', 'http://www.mu.sachsen-anhalt.de/lau/de/fault.htm', 2, 15);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (124, 'st_lue', 'Luft�berwachungssystem Sachsen-Anhalt', 'http://www.mu.sachsen-anhalt.de/lau/luesa/', 3, 15);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (125, 'st_unimd', 'Otto-von-Guericke Universit�t Magdeburg', 'http://www.uni-magde/burg.de/', 4, 15);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (126, 'sh_munl', 'Ministerium f�r Landwirtschaft, Umwelt und l�ndliche R�ume des Landes Schleswig-Holstein', 'http://www.umwelt.schleswig-holstein.de/servlet/is/154/', 1, 16);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (127, 'sh_lanu', 'Landesamt f�r Natur und Umwelt Schleswig-Holstein', 'http://www.lanu.landsh.de/', 2, 16);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (128, 'sh_luesh', 'Lufthygienische �berwachung Schleswig-Holstein', 'http://www.umwelt.schleswig-holstein.de/?196', 3, 16);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (129, 'sh_kfue', 'Kernreaktorfern�berwachung Schleswig-Holstein', 'http://www.kfue-sh.de/', 4, 16);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (130, 'sh_umweltaka', 'Akademie f�r Natur und Umwelt des Landes Schleswig-Holstein', 'http://www.umweltakademie-sh.de/', 5, 16);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (131, 'sh_npa', 'Nationalpark Schleswig-Holsteinisches Wattenmeer', 'http://www.wattenmeer-nationalpark.de/', 6, 16);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (132, 'th_tmlnu', 'Th�ringer Ministerium f�r Landwirtschaft, Naturschutz und Umwelt', 'http://www.thueringen.de/de/tmlnu/', 1, 17);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (133, 'th_tlug', 'Th�ringer Landesanstalt f�r Umwelt und Geologie', 'http://www.tlug-jena.de/index.html', 2, 17);
INSERT INTO ingrid_provider (id, ident, name, url, sortkey, sortkey_partner) VALUES (134, 'ni_geomdk', 'geoMDK Niedersachsen', 'http://www.geomdk.niedersachsen.de/', 21, 10);

INSERT INTO ingrid_env_topic (id, form_value, query_value, sortkey) VALUES (1, 'abf', 'abfall', 1);
INSERT INTO ingrid_env_topic (id, form_value, query_value, sortkey) VALUES (2, 'alt', 'altlasten', 2);
INSERT INTO ingrid_env_topic (id, form_value, query_value, sortkey) VALUES (3, 'bau', 'bauen', 3);
INSERT INTO ingrid_env_topic (id, form_value, query_value, sortkey) VALUES (4, 'bod', 'boden', 4);
INSERT INTO ingrid_env_topic (id, form_value, query_value, sortkey) VALUES (5, 'che', 'chemikalien', 5);
INSERT INTO ingrid_env_topic (id, form_value, query_value, sortkey) VALUES (6, 'ene', 'energie', 6);
INSERT INTO ingrid_env_topic (id, form_value, query_value, sortkey) VALUES (7, 'for', 'forstwirtschaft', 7);
INSERT INTO ingrid_env_topic (id, form_value, query_value, sortkey) VALUES (8, 'gen', 'gentechnik', 8);
INSERT INTO ingrid_env_topic (id, form_value, query_value, sortkey) VALUES (9, 'geo', 'geologie', 9);
INSERT INTO ingrid_env_topic (id, form_value, query_value, sortkey) VALUES (10, 'ges', 'gesundheit', 10);
INSERT INTO ingrid_env_topic (id, form_value, query_value, sortkey) VALUES (11, 'lae', 'laermerschuetterung', 11);
INSERT INTO ingrid_env_topic (id, form_value, query_value, sortkey) VALUES (12, 'lan', 'landwirtschaft', 12);
INSERT INTO ingrid_env_topic (id, form_value, query_value, sortkey) VALUES (13, 'luf', 'luftklima', 13);
INSERT INTO ingrid_env_topic (id, form_value, query_value, sortkey) VALUES (14, 'nac', 'nachhaltigeentwicklung', 14);
INSERT INTO ingrid_env_topic (id, form_value, query_value, sortkey) VALUES (15, 'nat', 'naturlandschaft', 15);
INSERT INTO ingrid_env_topic (id, form_value, query_value, sortkey) VALUES (16, 'str', 'strahlung', 16);
INSERT INTO ingrid_env_topic (id, form_value, query_value, sortkey) VALUES (17, 'tie', 'tierschutz', 17);
INSERT INTO ingrid_env_topic (id, form_value, query_value, sortkey) VALUES (18, 'uin', 'umweltinformation', 18);
INSERT INTO ingrid_env_topic (id, form_value, query_value, sortkey) VALUES (19, 'uwi', 'umweltwirtschaft', 19);
INSERT INTO ingrid_env_topic (id, form_value, query_value, sortkey) VALUES (20, 'ver', 'verkehr', 20);
INSERT INTO ingrid_env_topic (id, form_value, query_value, sortkey) VALUES (21, 'was', 'wasser', 21);

INSERT INTO ingrid_env_funct_category (id, form_value, query_value, sortkey) VALUES (1, 'rec', 'rechtliches', 1);
INSERT INTO ingrid_env_funct_category (id, form_value, query_value, sortkey) VALUES (2, 'kon', 'konzeptionelles', 2);
INSERT INTO ingrid_env_funct_category (id, form_value, query_value, sortkey) VALUES (3, 'sta', 'statusberichte', 3);
INSERT INTO ingrid_env_funct_category (id, form_value, query_value, sortkey) VALUES (4, 'umw', 'umweltzustand', 4);
INSERT INTO ingrid_env_funct_category (id, form_value, query_value, sortkey) VALUES (5, 'dat', 'datenkarten', 5);
INSERT INTO ingrid_env_funct_category (id, form_value, query_value, sortkey) VALUES (6, 'ris', 'risikobewertungen', 6);

INSERT INTO ingrid_service_rubric (id, form_value, query_value, sortkey) VALUES (1, 'pre', 'press', 1);
INSERT INTO ingrid_service_rubric (id, form_value, query_value, sortkey) VALUES (2, 'pub', 'publication', 2);
INSERT INTO ingrid_service_rubric (id, form_value, query_value, sortkey) VALUES (3, 'ver', 'event', 3);

INSERT INTO ingrid_measures_rubric (id, form_value, query_value, sortkey) VALUES (1, 'str', 'radiation', 1);
INSERT INTO ingrid_measures_rubric (id, form_value, query_value, sortkey) VALUES (2, 'luf', 'air', 2);
INSERT INTO ingrid_measures_rubric (id, form_value, query_value, sortkey) VALUES (3, 'was', 'water', 3);
INSERT INTO ingrid_measures_rubric (id, form_value, query_value, sortkey) VALUES (4, 'wei', 'misc', 4);

INSERT INTO ingrid_chron_eventtypes (id, form_value, query_value, sortkey) VALUES (1, 'ini', 'initiative', 1);
INSERT INTO ingrid_chron_eventtypes (id, form_value, query_value, sortkey) VALUES (2, 'his', 'historical', 2);
INSERT INTO ingrid_chron_eventtypes (id, form_value, query_value, sortkey) VALUES (3, 'law', 'law', 3);
INSERT INTO ingrid_chron_eventtypes (id, form_value, query_value, sortkey) VALUES (4, 'ins', 'institution', 4);
INSERT INTO ingrid_chron_eventtypes (id, form_value, query_value, sortkey) VALUES (5, 'dis', 'disaster', 5);
INSERT INTO ingrid_chron_eventtypes (id, form_value, query_value, sortkey) VALUES (6, 'cfe', 'conference', 6);
INSERT INTO ingrid_chron_eventtypes (id, form_value, query_value, sortkey) VALUES (7, 'cve', 'convention', 7);
INSERT INTO ingrid_chron_eventtypes (id, form_value, query_value, sortkey) VALUES (8, 'yea', 'ofTheYear', 8);
INSERT INTO ingrid_chron_eventtypes (id, form_value, query_value, sortkey) VALUES (9, 'pub', 'publication', 9);
INSERT INTO ingrid_chron_eventtypes (id, form_value, query_value, sortkey) VALUES (10, 'gui', 'guideline', 10);
INSERT INTO ingrid_chron_eventtypes (id, form_value, query_value, sortkey) VALUES (11, 'mar', 'marineAccident', 11);
INSERT INTO ingrid_chron_eventtypes (id, form_value, query_value, sortkey) VALUES (12, 'ind', 'industrialAccident', 12);

INSERT INTO ingrid_rss_source (id, provider, description, url, lang, categories) VALUES (1, 'UBA', 'RSS-UBA', 'http://www.uba.de/rss/ubapresseinfo.xml', 'de', 'all');
INSERT INTO ingrid_rss_source (id, provider, description, url, lang, categories) VALUES (2, 'BFN', 'BFN-UBA', 'http://www.bfn.de/6.100.html', 'de', 'all');
INSERT INTO ingrid_rss_source (id, provider, description, url, lang, categories) VALUES (3, 'MUF RLP', 'MUF RLP', 'http://www.muf.rlp.de/rss/rss_1_20.xml', 'de', 'all');
INSERT INTO ingrid_rss_source (id, provider, description, url, lang, categories) VALUES (4, 'BFN', 'BfN-Skripten', 'http://www.bfn.de/rss/skripten.xml', 'de', 'all');
INSERT INTO ingrid_rss_source (id, provider, description, url, lang, categories) VALUES (5, 'NI_MU', 'MU_aktuell_PI_GB', 'http://www.niedersachsen.de/rss/rss_19947156_598_20.rss', 'de', 'all');
INSERT INTO ingrid_rss_source (id, provider, description, url, lang, categories) VALUES (6, 'MBU', 'BMU', 'http://www.bmu.de/allgemein/rss/35401.rss', 'de', 'all');
INSERT INTO ingrid_rss_source (id, provider, description, url, lang, categories) VALUES (7, 'MU SACHSEN', 'MU SACHSEN', 'http://www.medienservice.sachsen.de/app/WebObjects/mspublic.woa/wa/rssFeed', 'de', 'umwelt,landwirtschaft/forst');
INSERT INTO ingrid_rss_source (id, provider, description, url, lang, categories) VALUES (8, 'LfUG Sachsen', 'LfUG Sachsen', 'http://www.umwelt.sachsen.de/de/wu/umwelt/lfug/lfug-internet/start.xml', 'de', 'all');
INSERT INTO ingrid_rss_source (id, provider, description, url, lang, categories) VALUES (9, 'MLUV Brandenburg', 'RSS MLUV Brandenburg', 'http://www.mluv.brandenburg.de/cms/list.php/mluv_presse_rss', 'de', 'all');

INSERT INTO ingrid_codelist VALUES (100, 'Raumbezugssystem (EPSG)', 1, 1);
INSERT INTO ingrid_codelist VALUES (101, 'Vertikales Datum', 1, 1);
INSERT INTO ingrid_codelist VALUES (102, 'H�he', 1, 1);
INSERT INTO ingrid_codelist VALUES (502, 'Zeitbezug des Datensatzes (Typ)', 1, 1);
INSERT INTO ingrid_codelist VALUES (505, 'Adresse', 1, 1);
INSERT INTO ingrid_codelist VALUES (510, 'Zeichensatz', 1, 1);
INSERT INTO ingrid_codelist VALUES (515, 'Vektorformat (Geometrie)', 1, 1);
INSERT INTO ingrid_codelist VALUES (517, 'Schl�sselwort', 1, 1);
INSERT INTO ingrid_codelist VALUES (518, 'Periodizit�t', 1, 1);
INSERT INTO ingrid_codelist VALUES (520, 'Medium', 1, 1);
INSERT INTO ingrid_codelist VALUES (523, 'Status', 1, 1);
INSERT INTO ingrid_codelist VALUES (525, 'Datensatz/Datenserie', 1, 1);
INSERT INTO ingrid_codelist VALUES (526, 'Digitale Repr�sentation', 1, 1);
INSERT INTO ingrid_codelist VALUES (527, 'Klassifikation', 1, 1);
INSERT INTO ingrid_codelist VALUES (528, 'Vektorformat (Topologie)', 1, 1);
INSERT INTO ingrid_codelist VALUES (99999999, 'Sprache', 1, 0);

INSERT INTO ingrid_codelist_domain VALUES (100, 4178, 94, 'EPSG:4178 / Pulkovo 1942(83) / geographisch', 'Pulkovo 1942(83) / geographisch', 0);
INSERT INTO ingrid_codelist_domain VALUES (100, 4178, 121, 'EPSG:4178 / Pulkovo 1942(83) / geographisch', 'Pulkovo 1942(83) / geographisch', 0);
INSERT INTO ingrid_codelist_domain VALUES (100, 4230, 94, 'EPSG:4230 / ED50 / geographisch', 'ED50 / geographisch', 0);
INSERT INTO ingrid_codelist_domain VALUES (100, 4230, 121, 'EPSG:4230 / ED50 / geographisch', 'ED50 / geographisch', 0);
INSERT INTO ingrid_codelist_domain VALUES (100, 4258, 94, 'EPSG:4258 / ETRS89 / geographisch', 'ETRS89 / geographisch', 0);
INSERT INTO ingrid_codelist_domain VALUES (100, 4258, 121, 'EPSG:4258 / ETRS89 / geographisch', 'ETRS89 / geographisch', 0);
INSERT INTO ingrid_codelist_domain VALUES (100, 4284, 94, 'EPSG:4284 / Pulkovo 1942 / geographisch', 'Pulkovo 1942 / geographisch', 0);
INSERT INTO ingrid_codelist_domain VALUES (100, 4284, 121, 'EPSG:4284 / Pulkovo 1942 / geographisch', 'Pulkovo 1942 / geographisch', 0);
INSERT INTO ingrid_codelist_domain VALUES (100, 4314, 94, 'EPSG:4314 / DHDN / geographisch', 'DHDN / geographisch', 0);
INSERT INTO ingrid_codelist_domain VALUES (100, 4314, 121, 'EPSG:4314 / DHDN / geographisch', 'DHDN / geographisch', 0);
INSERT INTO ingrid_codelist_domain VALUES (100, 4326, 94, 'EPSG:4326 / WGS 84 / geographisch', 'WGS 84 / geographisch', 0);
INSERT INTO ingrid_codelist_domain VALUES (100, 4326, 121, 'EPSG:4326 / WGS 84 / geographisch', 'WGS 84 / geographisch', 0);
INSERT INTO ingrid_codelist_domain VALUES (100, 23031, 94, 'EPSG:23031 / ED50 / UTM Zone 31N', 'ED50 / UTM Zone 31N', 0);
INSERT INTO ingrid_codelist_domain VALUES (100, 23031, 121, 'EPSG:23031 / ED50 / UTM Zone 31N', 'ED50 / UTM Zone 31N', 0);
INSERT INTO ingrid_codelist_domain VALUES (100, 23032, 94, 'EPSG:23032 / ED50 / UTM Zone 32N', 'ED50 / UTM Zone 32N', 0);
INSERT INTO ingrid_codelist_domain VALUES (100, 23032, 121, 'EPSG:23032 / ED50 / UTM Zone 32N', 'ED50 / UTM Zone 32N', 0);
INSERT INTO ingrid_codelist_domain VALUES (100, 23033, 94, 'EPSG:23033 / ED50 / UTM Zone 33N', 'ED50 / UTM Zone 33N', 0);
INSERT INTO ingrid_codelist_domain VALUES (100, 23033, 121, 'EPSG:23033 / ED50 / UTM Zone 33N', 'ED50 / UTM Zone 33N', 0);
INSERT INTO ingrid_codelist_domain VALUES (100, 23631, 94, 'EPSG:32631 / WGS 84 / UTM Zone 31N', 'WGS 84 / UTM Zone 31N', 0);
INSERT INTO ingrid_codelist_domain VALUES (100, 23631, 121, 'EPSG:32631 / WGS 84 / UTM Zone 31N', 'WGS 84 / UTM Zone 31N', 0);
INSERT INTO ingrid_codelist_domain VALUES (100, 23632, 94, 'EPSG:32632 / WGS 84 / UTM Zone 32N/33N', 'WGS 84 / UTM Zone 32N/33N', 0);
INSERT INTO ingrid_codelist_domain VALUES (100, 23632, 121, 'EPSG:32632 / WGS 84 / UTM Zone 32N/33N', 'WGS 84 / UTM Zone 32N/33N', 0);
INSERT INTO ingrid_codelist_domain VALUES (100, 25831, 94, 'EPSG:25831 / ETRS89 / UTM Zone 31N', 'ETRS89 / UTM Zone 31N', 0);
INSERT INTO ingrid_codelist_domain VALUES (100, 25831, 121, 'EPSG:25831 / ETRS89 / UTM Zone 31N', 'ETRS89 / UTM Zone 31N', 0);
INSERT INTO ingrid_codelist_domain VALUES (100, 25832, 94, 'EPSG:25832 / ETRS89 / UTM Zone 32N', 'ETRS89 / UTM Zone 32N', 0);
INSERT INTO ingrid_codelist_domain VALUES (100, 25832, 121, 'EPSG:25832 / ETRS89 / UTM Zone 32N', 'ETRS89 / UTM Zone 32N', 0);
INSERT INTO ingrid_codelist_domain VALUES (100, 25833, 94, 'EPSG:25833 / ETRS89 / UTM Zone 33N', 'ETRS89 / UTM Zone 33N', 0);
INSERT INTO ingrid_codelist_domain VALUES (100, 25833, 121, 'EPSG:25833 / ETRS89 / UTM Zone 33N', 'ETRS89 / UTM Zone 33N', 0);
INSERT INTO ingrid_codelist_domain VALUES (100, 28463, 94, 'EPSG:28463 / Pulkovo 1942 / Gauss-Kr�ger 2N/3N', 'Pulkovo 1942 / Gauss-Kr�ger 2N/3N', 0);
INSERT INTO ingrid_codelist_domain VALUES (100, 28463, 121, 'EPSG:28463 / Pulkovo 1942 / Gauss-Kr�ger 2N/3N', 'Pulkovo 1942 / Gauss-Kr�ger 2N/3N', 0);
INSERT INTO ingrid_codelist_domain VALUES (100, 31281, 94, 'EPSG:31281 / MGI (Ferro) / Austria West Zone', '-', 0);
INSERT INTO ingrid_codelist_domain VALUES (100, 31281, 121, 'EPSG:31281 / MGI (Ferro) / Austria West Zone', '-', 0);
INSERT INTO ingrid_codelist_domain VALUES (100, 31282, 94, 'EPSG:31282 / MGI (Ferro) / Austria Central Zone', '-', 0);
INSERT INTO ingrid_codelist_domain VALUES (100, 31282, 121, 'EPSG:31282 / MGI (Ferro) / Austria Central Zone', '-', 0);
INSERT INTO ingrid_codelist_domain VALUES (100, 31283, 94, 'EPSG:31283 / MGI (Ferro) / Austria East Zone', '-', 0);
INSERT INTO ingrid_codelist_domain VALUES (100, 31283, 121, 'EPSG:31283 / MGI (Ferro) / Austria East Zone', '-', 0);
INSERT INTO ingrid_codelist_domain VALUES (100, 31284, 94, 'EPSG:31284 / MGI / M28', '-', 0);
INSERT INTO ingrid_codelist_domain VALUES (100, 31284, 121, 'EPSG:31284 / MGI / M28', '-', 0);
INSERT INTO ingrid_codelist_domain VALUES (100, 31285, 94, 'EPSG:31285 / MGI / M31', '-', 0);
INSERT INTO ingrid_codelist_domain VALUES (100, 31285, 121, 'EPSG:31285 / MGI / M31', '-', 0);
INSERT INTO ingrid_codelist_domain VALUES (100, 31286, 94, 'EPSG:31286 / MGI / M34', '-', 0);
INSERT INTO ingrid_codelist_domain VALUES (100, 31286, 121, 'EPSG:31286 / MGI / M34', '-', 0);
INSERT INTO ingrid_codelist_domain VALUES (100, 31287, 94, 'EPSG:31287 / MGI / Austria Lambert', '-', 0);
INSERT INTO ingrid_codelist_domain VALUES (100, 31287, 121, 'EPSG:31287 / MGI / Austria Lambert', '-', 0);
INSERT INTO ingrid_codelist_domain VALUES (100, 31288, 94, 'EPSG:31288 / MGI (Ferro) / M28', '-', 0);
INSERT INTO ingrid_codelist_domain VALUES (100, 31288, 121, 'EPSG:31288 / MGI (Ferro) / M28', '-', 0);
INSERT INTO ingrid_codelist_domain VALUES (100, 31289, 94, 'EPSG:31289 / MGI (Ferro) / M31', '-', 0);
INSERT INTO ingrid_codelist_domain VALUES (100, 31289, 121, 'EPSG:31289 / MGI (Ferro) / M31', '-', 0);
INSERT INTO ingrid_codelist_domain VALUES (100, 31290, 94, 'EPSG:31290 / MGI (Ferro) / M34', '-', 0);
INSERT INTO ingrid_codelist_domain VALUES (100, 31290, 121, 'EPSG:31290 / MGI (Ferro) / M34', '-', 0);
INSERT INTO ingrid_codelist_domain VALUES (100, 31291, 94, 'EPSG:31291 / MGI (Ferro) / Austria West Zone', '-', 0);
INSERT INTO ingrid_codelist_domain VALUES (100, 31291, 121, 'EPSG:31291 / MGI (Ferro) / Austria West Zone', '-', 0);
INSERT INTO ingrid_codelist_domain VALUES (100, 31292, 94, 'EPSG:31292 / MGI (Ferro) / Austria Central Zone', '-', 0);
INSERT INTO ingrid_codelist_domain VALUES (100, 31292, 121, 'EPSG:31292 / MGI (Ferro) / Austria Central Zone', '-', 0);
INSERT INTO ingrid_codelist_domain VALUES (100, 31293, 94, 'EPSG:31293 / MGI (Ferro) / Austria East Zone', '-', 0);
INSERT INTO ingrid_codelist_domain VALUES (100, 31293, 121, 'EPSG:31293 / MGI (Ferro) / Austria East Zone', '-', 0);
INSERT INTO ingrid_codelist_domain VALUES (100, 31466, 94, 'EPSG:31466 / DHDN / Gauss-Kr�ger Zone 2', 'DHDN / Gauss-Kr�ger Zone 2', 0);
INSERT INTO ingrid_codelist_domain VALUES (100, 31466, 121, 'EPSG:31466 / DHDN / Gauss-Kr�ger Zone 2', 'DHDN / Gauss-Kr�ger Zone 2', 0);
INSERT INTO ingrid_codelist_domain VALUES (100, 31467, 94, 'EPSG:31467 /DHDN / Gauss-Kr�ger Zone 3', 'DHDN / Gauss-Kr�ger Zone 3', 0);
INSERT INTO ingrid_codelist_domain VALUES (100, 31467, 121, 'EPSG:31467 /DHDN / Gauss-Kr�ger Zone 3', 'DHDN / Gauss-Kr�ger Zone 3', 0);
INSERT INTO ingrid_codelist_domain VALUES (100, 31468, 94, 'EPSG:31468 / DHDN / Gauss-Kr�ger Zone 4', 'DHDN / Gauss-Kr�ger Zone 4', 0);
INSERT INTO ingrid_codelist_domain VALUES (100, 31468, 121, 'EPSG:31468 / DHDN / Gauss-Kr�ger Zone 4', 'DHDN / Gauss-Kr�ger Zone 4', 0);
INSERT INTO ingrid_codelist_domain VALUES (100, 31469, 94, 'EPSG:31469 / DHDN / Gauss-Kr�ger Zone 5', 'DHDN / Gauss-Kr�ger Zone 5', 0);
INSERT INTO ingrid_codelist_domain VALUES (100, 31469, 121, 'EPSG:31469 / DHDN / Gauss-Kr�ger Zone 5', 'DHDN / Gauss-Kr�ger Zone 5', 0);
INSERT INTO ingrid_codelist_domain VALUES (100, 31491, 94, 'EPSG:31491 / DHDN / Germany zone 1', 'DHDN / Germany zone 1', 0);
INSERT INTO ingrid_codelist_domain VALUES (100, 31491, 121, 'EPSG:31491 / DHDN / Germany zone 1', 'DHDN / Germany zone 1', 0);
INSERT INTO ingrid_codelist_domain VALUES (100, 31492, 94, 'EPSG:31492 /DHDN / Germany zone 2', 'DHDN / Germany zone 2', 0);
INSERT INTO ingrid_codelist_domain VALUES (100, 31492, 121, 'EPSG:31492 /DHDN / Germany zone 2', 'DHDN / Germany zone 2', 0);
INSERT INTO ingrid_codelist_domain VALUES (100, 31493, 94, 'EPSG:31493 / DHDN / Germany zone 3', 'DHDN / Germany zone 3', 1);
INSERT INTO ingrid_codelist_domain VALUES (100, 31493, 121, 'EPSG:31493 / DHDN / Germany zone 3', 'DHDN / Germany zone 3', 1);
INSERT INTO ingrid_codelist_domain VALUES (100, 31494, 94, 'EPSG:31494 / DHDN / Germany zone 4', 'DHDN / Germany zone 4', 0);
INSERT INTO ingrid_codelist_domain VALUES (100, 31494, 121, 'EPSG:31494 / DHDN / Germany zone 4', 'DHDN / Germany zone 4', 0);
INSERT INTO ingrid_codelist_domain VALUES (100, 31495, 94, 'EPSG:31495 / DHDN / Germany zone 5', 'DHDN / Germany zone 5', 0);
INSERT INTO ingrid_codelist_domain VALUES (100, 31495, 121, 'EPSG:31495 / DHDN / Germany zone 5', 'DHDN / Germany zone 5', 0);
INSERT INTO ingrid_codelist_domain VALUES (100, 9000001, 94, 'DE_42/83 / GK_3', 'Datum 42/83 with Gauss-Kr�ger-System', 0);
INSERT INTO ingrid_codelist_domain VALUES (100, 9000001, 121, 'DE_42/83 / GK_3', 'Datum 42/83 with Gauss-Kr�ger-System', 0);
INSERT INTO ingrid_codelist_domain VALUES (100, 9000002, 94, 'DE_DHDN / GK_3', 'Datum DHDN with Gauss-Kr�ger-System (also known as Rauenberg or Potsdam Datum)', 0);
INSERT INTO ingrid_codelist_domain VALUES (100, 9000002, 121, 'DE_DHDN / GK_3', 'Datum DHDN with Gauss-Kr�ger-System (also known as Rauenberg or Potsdam Datum)', 0);
INSERT INTO ingrid_codelist_domain VALUES (100, 9000003, 94, 'DE_ETRS89 / UTM', 'Datum ETRS89 for Federal State Brandenburg with UTM Projection (one zone extended)', 0);
INSERT INTO ingrid_codelist_domain VALUES (100, 9000003, 121, 'DE_ETRS89 / UTM', 'Datum ETRS89 for Federal State Brandenburg with UTM Projection (one zone extended)', 0);
INSERT INTO ingrid_codelist_domain VALUES (100, 9000004, 94, 'DE_PD/83 / GK_3', 'Datum PD/83 with Gauss-Kr�ger-System (realisation of Postdam Datum for Federal State Th�ringen)', 0);
INSERT INTO ingrid_codelist_domain VALUES (100, 9000005, 121, 'DE_PD/83 / GK_3', 'Datum PD/83 with Gauss-Kr�ger-System (realisation of Postdam Datum for Federal State Th�ringen)', 0);
INSERT INTO ingrid_codelist_domain VALUES (100, 9000006, 94, 'DE_RD/83 / GK_3', 'Datum RD/83 with Gauss-Kr�ger-System (realisation of Rauenberg Datum for Federal State Sachsen)', 0);
INSERT INTO ingrid_codelist_domain VALUES (100, 9000006, 121, 'DE_RD/83 / GK_3', 'Datum RD/83 with Gauss-Kr�ger-System (realisation of Rauenberg Datum for Federal State Sachsen)', 0);
INSERT INTO ingrid_codelist_domain VALUES (101, 62, 94, 'Mean Sea Level', '-', 0);
INSERT INTO ingrid_codelist_domain VALUES (101, 62, 121, 'Mean Sea Level', '-', 0);
INSERT INTO ingrid_codelist_domain VALUES (101, 63, 94, 'Ordnance Datum Newlyn', '-', 0);
INSERT INTO ingrid_codelist_domain VALUES (101, 63, 121, 'Ordnance Datum Newlyn', '-', 0);
INSERT INTO ingrid_codelist_domain VALUES (101, 64, 94, 'National Geodetic Vertical Datum 1929', '26 tide gauges in the US and Canada.', 0);
INSERT INTO ingrid_codelist_domain VALUES (101, 64, 121, 'National Geodetic Vertical Datum 1929', '26 tide gauges in the US and Canada.', 0);
INSERT INTO ingrid_codelist_domain VALUES (101, 65, 94, 'North American Vertical Datum 1988', 'Father''s Point, Rimouski, Quebec.', 0);
INSERT INTO ingrid_codelist_domain VALUES (101, 65, 121, 'North American Vertical Datum 1988', 'Father''s Point, Rimouski, Quebec.', 0);
INSERT INTO ingrid_codelist_domain VALUES (101, 5105, 94, 'Baltic Sea', 'Average water level at Kronshtadt', 0);
INSERT INTO ingrid_codelist_domain VALUES (101, 5105, 121, 'Baltic Sea', 'Average water level at Kronshtadt', 0);
INSERT INTO ingrid_codelist_domain VALUES (101, 5107, 94, 'Nivellement general de la France', 'Mean sea level at Marseille', 0);
INSERT INTO ingrid_codelist_domain VALUES (101, 5107, 121, 'Nivellement general de la France', 'Mean sea level at Marseille', 0);
INSERT INTO ingrid_codelist_domain VALUES (101, 5109, 94, 'Normaal Amsterdams Peil', 'wird in alten Bundesl�ndern genutzt', 1);
INSERT INTO ingrid_codelist_domain VALUES (101, 5109, 121, 'Amsterdamer Pegel (NN)', 'wird in alten Bundesl�ndern genutzt', 1);
INSERT INTO ingrid_codelist_domain VALUES (101, 5110, 94, 'Oostende', 'Mean low water during 1958', 0);
INSERT INTO ingrid_codelist_domain VALUES (101, 5110, 121, 'Oostende', 'Mean low water during 1958', 0);
INSERT INTO ingrid_codelist_domain VALUES (101, 5113, 94, 'Sea Level', '-', 0);
INSERT INTO ingrid_codelist_domain VALUES (101, 5113, 121, 'Sea Level', '-', 0);
INSERT INTO ingrid_codelist_domain VALUES (101, 5114, 94, 'Canadian Vertical Datum of 1928', '-', 0);
INSERT INTO ingrid_codelist_domain VALUES (101, 5114, 121, 'Canadian Vertical Datum of 1928', '-', 0);
INSERT INTO ingrid_codelist_domain VALUES (101, 5115, 94, 'Piraeus Harbour 1986', 'MSL determined during 1986.', 0);
INSERT INTO ingrid_codelist_domain VALUES (101, 5115, 121, 'Piraeus Harbour 1986', 'MSL determined during 1986.', 0);
INSERT INTO ingrid_codelist_domain VALUES (101, 5116, 94, 'Helsinki 1960', 'MSL at Helsinki during 1960.', 0);
INSERT INTO ingrid_codelist_domain VALUES (101, 5116, 121, 'Helsinki 1960', 'MSL at Helsinki during 1960.', 0);
INSERT INTO ingrid_codelist_domain VALUES (101, 5117, 94, 'Rikets hojdsystem 1970', '-', 0);
INSERT INTO ingrid_codelist_domain VALUES (101, 5117, 121, 'Rikets hojdsystem 1970', '-', 0);
INSERT INTO ingrid_codelist_domain VALUES (101, 5118, 94, 'Nivellement general de la France - Lalle', 'Mean sea level at Marseille.', 0);
INSERT INTO ingrid_codelist_domain VALUES (101, 5118, 121, 'Nivellement general de la France - Lalle', 'Mean sea level at Marseille.', 0);
INSERT INTO ingrid_codelist_domain VALUES (101, 5119, 94, 'Nivellement general de la France - IGN69', 'Mean sea level at Marseille.', 0);
INSERT INTO ingrid_codelist_domain VALUES (101, 5119, 121, 'Nivellement general de la France - IGN69', 'Mean sea level at Marseille.', 0);
INSERT INTO ingrid_codelist_domain VALUES (101, 5120, 94, 'Nivellement general de la France - IGN78', '-', 0);
INSERT INTO ingrid_codelist_domain VALUES (101, 5120, 121, 'Nivellement general de la France - IGN78', '-', 0);
INSERT INTO ingrid_codelist_domain VALUES (101, 5123, 94, 'PDO Height Datum 1993', '-', 0);
INSERT INTO ingrid_codelist_domain VALUES (101, 5123, 121, 'PDO Height Datum 1993', '-', 0);
INSERT INTO ingrid_codelist_domain VALUES (101, 5127, 94, 'Landesnivellement 1902', 'Origin at Repere Pierre du Niton (RPN) 373.6 metres above msl derived at Marseille.', 0);
INSERT INTO ingrid_codelist_domain VALUES (101, 5127, 121, 'Landesnivellement 1902', 'Origin at Repere Pierre du Niton (RPN) 373.6 metres above msl derived at Marseille.', 0);
INSERT INTO ingrid_codelist_domain VALUES (101, 5128, 94, 'Landeshohennetz 1995', 'Origin at Repere Pierre du Niton (RPN) 373.6 metres above msl derived at Marseille.', 0);
INSERT INTO ingrid_codelist_domain VALUES (101, 5128, 121, 'Landeshohennetz 1995', 'Origin at Repere Pierre du Niton (RPN) 373.6 metres above msl derived at Marseille.', 0);
INSERT INTO ingrid_codelist_domain VALUES (101, 5129, 94, 'European Vertical Reference Frame 2000', 'Geopotential number at Normaal Amsterdams Peil is zero.', 0);
INSERT INTO ingrid_codelist_domain VALUES (101, 5129, 121, 'European Vertical Reference Frame 2000', 'Geopotential number at Normaal Amsterdams Peil is zero.', 0);
INSERT INTO ingrid_codelist_domain VALUES (101, 5130, 94, 'Malin Head', 'Mean sea level between January 1960 and December 1969.', 0);
INSERT INTO ingrid_codelist_domain VALUES (101, 5130, 121, 'Malin Head', 'Mean sea level between January 1960 and December 1969.', 0);
INSERT INTO ingrid_codelist_domain VALUES (101, 5131, 94, 'Belfast Lough', 'Mean sea level between 1951 and 1956 at Clarendon Dock, Belfast.', 0);
INSERT INTO ingrid_codelist_domain VALUES (101, 5131, 121, 'Belfast Lough', 'Mean sea level between 1951 and 1956 at Clarendon Dock, Belfast.', 0);
INSERT INTO ingrid_codelist_domain VALUES (101, 5132, 94, 'Dansk Normal Nul', '-', 0);
INSERT INTO ingrid_codelist_domain VALUES (101, 5132, 121, 'Dansk Normal Nul', '-', 0);
INSERT INTO ingrid_codelist_domain VALUES (101, 5138, 94, 'Ordnance Datum Newlyn (Orkney Isles)', '-', 0);
INSERT INTO ingrid_codelist_domain VALUES (101, 5138, 121, 'Ordnance Datum Newlyn (Orkney Isles)', '-', 0);
INSERT INTO ingrid_codelist_domain VALUES (101, 5139, 94, 'Fair Isle', '-', 0);
INSERT INTO ingrid_codelist_domain VALUES (101, 5139, 121, 'Fair Isle', '-', 0);
INSERT INTO ingrid_codelist_domain VALUES (101, 5140, 94, 'Lerwick', '-', 0);
INSERT INTO ingrid_codelist_domain VALUES (101, 5140, 121, 'Lerwick', '-', 0);
INSERT INTO ingrid_codelist_domain VALUES (101, 5141, 94, 'Foula', '-', 0);
INSERT INTO ingrid_codelist_domain VALUES (101, 5141, 121, 'Foula', '-', 0);
INSERT INTO ingrid_codelist_domain VALUES (101, 5142, 94, 'Sule Skerry', '-', 0);
INSERT INTO ingrid_codelist_domain VALUES (101, 5142, 121, 'Sule Skerry', '-', 0);
INSERT INTO ingrid_codelist_domain VALUES (101, 5143, 94, 'North Rona', '-', 0);
INSERT INTO ingrid_codelist_domain VALUES (101, 5143, 121, 'North Rona', '-', 0);
INSERT INTO ingrid_codelist_domain VALUES (101, 5144, 94, 'Stornoway', '-', 0);
INSERT INTO ingrid_codelist_domain VALUES (101, 5144, 121, 'Stornoway', '-', 0);
INSERT INTO ingrid_codelist_domain VALUES (101, 5145, 94, 'St. Kilda', '-', 0);
INSERT INTO ingrid_codelist_domain VALUES (101, 5145, 121, 'St. Kilda', '-', 0);
INSERT INTO ingrid_codelist_domain VALUES (101, 5146, 94, 'Flannan Isles', '-', 0);
INSERT INTO ingrid_codelist_domain VALUES (101, 5146, 121, 'Flannan Isles', '-', 0);
INSERT INTO ingrid_codelist_domain VALUES (101, 5147, 94, 'St. Marys', '-', 0);
INSERT INTO ingrid_codelist_domain VALUES (101, 5147, 121, 'St. Marys', '-', 0);
INSERT INTO ingrid_codelist_domain VALUES (101, 5148, 94, 'Douglas', '-', 0);
INSERT INTO ingrid_codelist_domain VALUES (101, 5148, 121, 'Douglas', '-', 0);
INSERT INTO ingrid_codelist_domain VALUES (101, 5149, 94, 'Fao', '-', 0);
INSERT INTO ingrid_codelist_domain VALUES (101, 5149, 121, 'Fao', '-', 0);
INSERT INTO ingrid_codelist_domain VALUES (101, 5151, 94, 'Nivellement General Nouvelle Caledonie', '-', 0);
INSERT INTO ingrid_codelist_domain VALUES (101, 5151, 121, 'Nivellement General Nouvelle Caledonie', '-', 0);
INSERT INTO ingrid_codelist_domain VALUES (101, 900001, 94, 'Kronst�dter Pegel (HN)', 'wird in neuen Bundesl�ndern genutzt', 0);
INSERT INTO ingrid_codelist_domain VALUES (101, 900001, 121, 'Kronst�dter Pegel (HN)', 'wird in neuen Bundesl�ndern genutzt', 0);
INSERT INTO ingrid_codelist_domain VALUES (101, 900002, 94, 'DE_AMST / NH', 'normal heights referred to tide gauge Amsterdam (also known as DHHN92)', 0);
INSERT INTO ingrid_codelist_domain VALUES (101, 900002, 121, 'DE_AMST / NH', 'normal heights referred to tide gauge Amsterdam (also known as DHHN92)', 0);
INSERT INTO ingrid_codelist_domain VALUES (101, 900003, 94, 'DE_AMST / NOH', 'normal-orthometric heights referred to tide gauge Amsterdam (also known as DHHN85)', 0);
INSERT INTO ingrid_codelist_domain VALUES (101, 900003, 121, 'DE_AMST / NOH', 'normal-orthometric heights referred to tide gauge Amsterdam (also known as DHHN85)', 0);
INSERT INTO ingrid_codelist_domain VALUES (101, 900004, 94, 'DE_KRON / NH', 'normal heights referred to tide gauge Kronstadt (also known as SNN76)', 0);
INSERT INTO ingrid_codelist_domain VALUES (101, 900004, 121, 'DE_KRON / NH', 'normal heights referred to tide gauge Kronstadt (also known as SNN76)', 0);
INSERT INTO ingrid_codelist_domain VALUES (102, 4, 94, 'Zoll', 'Zoll', 0);
INSERT INTO ingrid_codelist_domain VALUES (102, 4, 121, 'Inch', 'Inch', 0);
INSERT INTO ingrid_codelist_domain VALUES (102, 9001, 94, 'Metre', 'Metre', 1);
INSERT INTO ingrid_codelist_domain VALUES (102, 9001, 121, 'Meter', 'Meter', 1);
INSERT INTO ingrid_codelist_domain VALUES (102, 9002, 94, 'Foot', 'Foot', 0);
INSERT INTO ingrid_codelist_domain VALUES (102, 9002, 121, 'Fuss', 'Fuss', 0);
INSERT INTO ingrid_codelist_domain VALUES (102, 9036, 94, 'Kilometre', 'Kilometre', 0);
INSERT INTO ingrid_codelist_domain VALUES (102, 9036, 121, 'Kilometer', 'Kilometer', 0);
INSERT INTO ingrid_codelist_domain VALUES (502, 1, 94, 'creation', 'date identifies when the resource was brought into existence', 1);
INSERT INTO ingrid_codelist_domain VALUES (502, 1, 121, 'Erstellung', 'Datum, wann die Quelle geschaffen wurde', 1);
INSERT INTO ingrid_codelist_domain VALUES (502, 2, 94, 'publication', 'date identifies when the resource was issued', 0);
INSERT INTO ingrid_codelist_domain VALUES (502, 2, 121, 'Publikation', 'Dateum, wann die Quelle publiziert wurde', 0);
INSERT INTO ingrid_codelist_domain VALUES (502, 3, 94, 'revision', 'date identifies when the resource was examined or re-examined and improved or amended', 0);
INSERT INTO ingrid_codelist_domain VALUES (502, 3, 121, 'letzte �nderung', 'Datum, wann eine Revision durchgef�hrt wurde', 0);
INSERT INTO ingrid_codelist_domain VALUES (505, 1, 94, 'Provider', 'Party that supplies the resource', 0);
INSERT INTO ingrid_codelist_domain VALUES (505, 1, 121, 'Anbieter', 'Anbieter der Datenquelle', 0);
INSERT INTO ingrid_codelist_domain VALUES (505, 2, 94, 'Custodian', 'Party that accepts accountability and responsibility for the data and ensures appropriate care and maintenance of the resource', 0);
INSERT INTO ingrid_codelist_domain VALUES (505, 2, 121, 'Datenverantwortung', 'Verantworlicher f�r die Datenquelle und deren Pflege', 0);
INSERT INTO ingrid_codelist_domain VALUES (505, 3, 94, 'Owner', 'Party that owns the resource', 0);
INSERT INTO ingrid_codelist_domain VALUES (505, 3, 121, 'Halter', 'Halter der Datenquelle', 0);
INSERT INTO ingrid_codelist_domain VALUES (505, 4, 94, 'User', 'Party who uses the resource', 0);
INSERT INTO ingrid_codelist_domain VALUES (505, 4, 121, 'Benutzer', 'Benutzer der Datenquelle', 0);
INSERT INTO ingrid_codelist_domain VALUES (505, 5, 94, 'Distributor', 'Party who distributes the resource', 0);
INSERT INTO ingrid_codelist_domain VALUES (505, 5, 121, 'Vertrieb', 'Vertreiber der Datenquelle', 0);
INSERT INTO ingrid_codelist_domain VALUES (505, 6, 94, 'Originator', 'Party who created the resource', 0);
INSERT INTO ingrid_codelist_domain VALUES (505, 6, 121, 'Herkunft', 'Ersteller der Datenquelle', 0);
INSERT INTO ingrid_codelist_domain VALUES (505, 7, 94, 'Point of Contact', 'Party who can be contacted for acquiring knowledge about or acquisition of the resource', 1);
INSERT INTO ingrid_codelist_domain VALUES (505, 7, 121, 'Auskunft', 'Kontaktperson, die Informationen �ber die Datenqulle geben kann', 1);
INSERT INTO ingrid_codelist_domain VALUES (505, 8, 94, 'Principal Investigator', 'Key party responsible for gathering information and conducting research', 0);
INSERT INTO ingrid_codelist_domain VALUES (505, 8, 121, 'Datenerfassung', 'Verantworlicher f�r die Zusammenstellung der Informationen und Durchf�hrung von Forschung', 0);
INSERT INTO ingrid_codelist_domain VALUES (505, 9, 94, 'Processor', 'Party who has processed the data in a manner such that the resource has been modified', 0);
INSERT INTO ingrid_codelist_domain VALUES (505, 9, 121, 'Auswertung', 'Bearbeiter der Daten in einer Art, dass die Quelle modifiziert wurde.', 0);
INSERT INTO ingrid_codelist_domain VALUES (505, 10, 94, 'Publisher', 'Party who published the resource', 0);
INSERT INTO ingrid_codelist_domain VALUES (505, 10, 121, 'Herausgeber', 'Phblizierer der Datenquelle', 0);
INSERT INTO ingrid_codelist_domain VALUES (510, 1, 94, 'ucs2', '16-bit fixed size Universal Character Set, based on ISO/IEC 10646', 0);
INSERT INTO ingrid_codelist_domain VALUES (510, 1, 121, 'ucs2', '16-bit fixierte Gr��e Universal Character Set, basierend auf ISO/IEC 10646', 0);
INSERT INTO ingrid_codelist_domain VALUES (510, 2, 94, 'ucs4', '32-bit fixed size Universal Character Set, based on ISO/IEC 10646', 0);
INSERT INTO ingrid_codelist_domain VALUES (510, 2, 121, 'ucs4', '32-bit fixierte Gr��e Universal Character Set, basierend auf ISO/IEC 10646', 0);
INSERT INTO ingrid_codelist_domain VALUES (510, 3, 94, 'utf7', '7-bit variable size UCS Transfer Format, based on ISO/IEC 10646', 0);
INSERT INTO ingrid_codelist_domain VALUES (510, 3, 121, 'utf7', '7-bit variable Gr��e UCS Transfer Format, basierend auf ISO/IEC 10646', 0);
INSERT INTO ingrid_codelist_domain VALUES (510, 4, 94, 'utf8', '8-bit variable size UCS Transfer Format, based on ISO/IEC 10646', 0);
INSERT INTO ingrid_codelist_domain VALUES (510, 4, 121, 'utf8', '8-bit variable Gr��e UCS Transfer Format, basierend auf ISO/IEC 10646', 0);
INSERT INTO ingrid_codelist_domain VALUES (510, 5, 94, 'utf16', '16-bit variable size UCS Transfer Format, based on ISO/IEC 10646', 0);
INSERT INTO ingrid_codelist_domain VALUES (510, 5, 121, 'utf16', '16-bit variable Gr��e UCS Transfer Format, basierend auf ISO/IEC 10646', 0);
INSERT INTO ingrid_codelist_domain VALUES (510, 6, 94, '8859part1', 'latin-1, west European', 0);
INSERT INTO ingrid_codelist_domain VALUES (510, 6, 121, '8859part1', 'latin-1, Westeurop�ischer', 0);
INSERT INTO ingrid_codelist_domain VALUES (510, 7, 94, '8859part2', 'latin-2, central European', 0);
INSERT INTO ingrid_codelist_domain VALUES (510, 7, 121, '8859part2', 'latin-2, Zentraleurop�ischer', 0);
INSERT INTO ingrid_codelist_domain VALUES (510, 8, 94, '8859part3', 'latin-3, south European', 0);
INSERT INTO ingrid_codelist_domain VALUES (510, 8, 121, '8859part3', 'latin-3, S�deurop�ischer', 0);
INSERT INTO ingrid_codelist_domain VALUES (510, 9, 94, '8859part4', 'latin-4, north European', 0);
INSERT INTO ingrid_codelist_domain VALUES (510, 9, 121, '8859part4', 'latin-4, Nordeurop�ischer', 0);
INSERT INTO ingrid_codelist_domain VALUES (510, 10, 94, '8859part5', 'cyrillic code set', 0);
INSERT INTO ingrid_codelist_domain VALUES (510, 10, 121, '8859part5', 'Cyrillisch', 0);
INSERT INTO ingrid_codelist_domain VALUES (510, 11, 94, '8859part6', 'arabic code set', 0);
INSERT INTO ingrid_codelist_domain VALUES (510, 11, 121, '8859part6', 'Arabisch', 0);
INSERT INTO ingrid_codelist_domain VALUES (510, 12, 94, '8859part7', 'greek code set', 0);
INSERT INTO ingrid_codelist_domain VALUES (510, 12, 121, '8859part7', 'Griechisch', 0);
INSERT INTO ingrid_codelist_domain VALUES (510, 13, 94, '8859part8', 'hebrew code set', 0);
INSERT INTO ingrid_codelist_domain VALUES (510, 13, 121, '8859part8', 'Hebr�isch', 0);
INSERT INTO ingrid_codelist_domain VALUES (510, 14, 94, '8859part9', 'latin-5, Turkish code set', 0);
INSERT INTO ingrid_codelist_domain VALUES (510, 14, 121, '8859part9', 'latin-5, T�rkisch', 0);
INSERT INTO ingrid_codelist_domain VALUES (510, 15, 94, '8859part11', 'thai code set', 0);
INSERT INTO ingrid_codelist_domain VALUES (510, 15, 121, '8859part11', 'Tail�ndisch', 0);
INSERT INTO ingrid_codelist_domain VALUES (510, 16, 94, '8859part14', 'latin-8 code set', 0);
INSERT INTO ingrid_codelist_domain VALUES (510, 16, 121, '8859part14', 'latin-8', 0);
INSERT INTO ingrid_codelist_domain VALUES (510, 17, 94, '8859part15', 'latin-9 code set', 0);
INSERT INTO ingrid_codelist_domain VALUES (510, 17, 121, '8859part15', 'latin-9', 0);
INSERT INTO ingrid_codelist_domain VALUES (510, 18, 94, 'Jis', 'japanese code set used for electronic transmission', 0);
INSERT INTO ingrid_codelist_domain VALUES (510, 18, 121, 'Jis', 'Japanisch', 0);
INSERT INTO ingrid_codelist_domain VALUES (510, 19, 94, 'ShiftJIS', 'japanese code set used on MS-DOS based machines', 0);
INSERT INTO ingrid_codelist_domain VALUES (510, 19, 121, 'ShiftJIS', 'Japanisch (MS-DOS)', 0);
INSERT INTO ingrid_codelist_domain VALUES (510, 20, 94, 'EucJP', 'japanese code set used on UNIX based machines', 0);
INSERT INTO ingrid_codelist_domain VALUES (510, 20, 121, 'EucJP', 'Japanisch (UNIX)', 0);
INSERT INTO ingrid_codelist_domain VALUES (510, 21, 94, 'UsAscii', 'united states ASCII code set (ISO 646 US)', 0);
INSERT INTO ingrid_codelist_domain VALUES (510, 21, 121, 'UsAscii', 'USA ASCII', 0);
INSERT INTO ingrid_codelist_domain VALUES (510, 22, 94, 'Ebcdic', 'ibm mainframe code set', 0);
INSERT INTO ingrid_codelist_domain VALUES (510, 22, 121, 'Ebcdic', 'IBM Mainfraime', 0);
INSERT INTO ingrid_codelist_domain VALUES (510, 23, 94, 'EucKR', 'korean code set', 0);
INSERT INTO ingrid_codelist_domain VALUES (510, 23, 121, 'EucKR', 'Koreanisch', 0);
INSERT INTO ingrid_codelist_domain VALUES (510, 24, 94, 'big5', 'taiwanese code set', 0);
INSERT INTO ingrid_codelist_domain VALUES (510, 24, 121, 'big5', 'Tawainesisch', 0);
INSERT INTO ingrid_codelist_domain VALUES (515, 1, 94, 'complexes', 'set of geometric primitives such that their boundaries can be represented as a union of other primitives', 0);
INSERT INTO ingrid_codelist_domain VALUES (515, 1, 121, 'Komplex', 'Satz geometrischer Primitiver, wobei deren Grenzen durch ein Zusammenschluss anderer Primitiver gebildet werden k�nnen', 0);
INSERT INTO ingrid_codelist_domain VALUES (515, 2, 94, 'composites', 'connected set of curves, solids or surfaces', 0);
INSERT INTO ingrid_codelist_domain VALUES (515, 2, 121, 'Verbund', 'verbundener Satz von Kurven, K�rpern oder Oberfl�chen', 0);
INSERT INTO ingrid_codelist_domain VALUES (515, 3, 94, 'curve', 'bounded, 1-dimensional geometric primitive, representing the continuous image of a line', 0);
INSERT INTO ingrid_codelist_domain VALUES (515, 3, 121, 'Kurve', 'beschr�nkte, 1-D geometrische Primitive, die ein continuierliches Bild einer Linie darstellt', 0);
INSERT INTO ingrid_codelist_domain VALUES (515, 4, 94, 'point', 'zero-dimensional geometric primitive, representing a position but not having an extent', 0);
INSERT INTO ingrid_codelist_domain VALUES (515, 4, 121, 'Punkt', '0-D geometrische Primitive, welche eine Position beschreibt ohne eine Ausdehnung zu haben', 0);
INSERT INTO ingrid_codelist_domain VALUES (515, 5, 94, 'solid', 'bounded, connected 3-dimensional geometric primitive, representing the continuous image of a region of space', 0);
INSERT INTO ingrid_codelist_domain VALUES (515, 5, 121, 'K�rper', 'begrenzte, verbundene 3-D geometrische Primitive, welche ein kontinuierliches Bild eines Raumes beschreibt', 0);
INSERT INTO ingrid_codelist_domain VALUES (515, 6, 94, 'surface', 'bounded, connected 2-dimensional geometric, representing the continuous image of a region of a plane', 0);
INSERT INTO ingrid_codelist_domain VALUES (515, 6, 121, 'Oberfl�che', 'begrenzte, verbundene 2-D geometrische Primitive, welche ein kontinuierliches Bild einer Ebene oder Region beschreibt', 0);
INSERT INTO ingrid_codelist_domain VALUES (517, 1, 94, 'Discipline', 'keyword identifies a branch of instruction or specialized learning', 0);
INSERT INTO ingrid_codelist_domain VALUES (517, 1, 121, 'Wissenszweig', 'Zweig einer Ausbildung oder spezialisierten Lernens', 0);
INSERT INTO ingrid_codelist_domain VALUES (517, 2, 94, 'Place', 'keyword identifies a location', 0);
INSERT INTO ingrid_codelist_domain VALUES (517, 2, 121, 'Ortsangabe', 'Ortsangabe', 0);
INSERT INTO ingrid_codelist_domain VALUES (517, 3, 94, 'Stratum', 'keyword identifies the layer(s) of any deposited substance', 0);
INSERT INTO ingrid_codelist_domain VALUES (517, 3, 121, 'Schicht', 'Schichten einer hinterlegten Substanz', 0);
INSERT INTO ingrid_codelist_domain VALUES (517, 4, 94, 'Temporal', 'keyword identifies a time period related to the dataset', 0);
INSERT INTO ingrid_codelist_domain VALUES (517, 4, 121, 'Zeitraum', 'Zeitraum in Bezug auf den Datensatz', 0);
INSERT INTO ingrid_codelist_domain VALUES (517, 5, 94, 'Theme', 'keyword identifies a particular subject or topic', 0);
INSERT INTO ingrid_codelist_domain VALUES (517, 5, 121, 'Themenbereich', 'Spezielles Fachgebiet oder Thema', 0);
INSERT INTO ingrid_codelist_domain VALUES (518, 1, 94, 'continual', 'data is repeatedly and frequently updated', 1);
INSERT INTO ingrid_codelist_domain VALUES (518, 1, 121, 'kontinuierlich', 'Datenupdate  h�ufig', 1);
INSERT INTO ingrid_codelist_domain VALUES (518, 2, 94, 'daily', 'Data is updated each day', 0);
INSERT INTO ingrid_codelist_domain VALUES (518, 2, 121, 't�glich', 'Datenupdate t�glich', 0);
INSERT INTO ingrid_codelist_domain VALUES (518, 3, 94, 'weekly', 'Ddata is updated on a weekly basis', 0);
INSERT INTO ingrid_codelist_domain VALUES (518, 3, 121, 'w�chentlich', 'Datenupdate w�chentlich', 0);
INSERT INTO ingrid_codelist_domain VALUES (518, 4, 94, 'fortnightly', 'Data is updated every two weeks', 0);
INSERT INTO ingrid_codelist_domain VALUES (518, 4, 121, 'vierzehnt�gig', 'Datenupdate alle 2 Wochen', 0);
INSERT INTO ingrid_codelist_domain VALUES (518, 5, 94, 'monthly', 'Data is updated each month', 0);
INSERT INTO ingrid_codelist_domain VALUES (518, 5, 121, 'monatlich', 'Datenupdate monatlich', 0);
INSERT INTO ingrid_codelist_domain VALUES (518, 6, 94, 'quarterly', 'Data is updated every three months', 0);
INSERT INTO ingrid_codelist_domain VALUES (518, 6, 121, 'viertelj�hrlich', 'Datenupdate alle 3 Monate', 0);
INSERT INTO ingrid_codelist_domain VALUES (518, 7, 94, 'biannually', 'Data is updated twice each year', 0);
INSERT INTO ingrid_codelist_domain VALUES (518, 7, 121, 'halbj�hrlich', 'Datenupdate halbj�hrlich', 0);
INSERT INTO ingrid_codelist_domain VALUES (518, 8, 94, 'annually', 'Data is updated every year', 0);
INSERT INTO ingrid_codelist_domain VALUES (518, 8, 121, 'j�hrlich', 'Datenupdate j�hrlich', 0);
INSERT INTO ingrid_codelist_domain VALUES (518, 9, 94, 'as Needed', 'Data is updated as deemed necessary', 0);
INSERT INTO ingrid_codelist_domain VALUES (518, 9, 121, 'bei Bedarf', 'Datenupdate wenn n�tig', 0);
INSERT INTO ingrid_codelist_domain VALUES (518, 10, 94, 'irregular', 'Data is updated in intervals that are uneven in duration', 0);
INSERT INTO ingrid_codelist_domain VALUES (518, 10, 121, 'unregelm��ig', 'Datenupdate in unregelm��igen Abst�nden', 0);
INSERT INTO ingrid_codelist_domain VALUES (518, 11, 94, 'notPlanned', 'There are no plans to update the data', 0);
INSERT INTO ingrid_codelist_domain VALUES (518, 11, 121, 'einmalig', 'Datenupdate nicht geplant', 0);
INSERT INTO ingrid_codelist_domain VALUES (518, 12, 94, 'unknown', 'Frequency of maintenance for the data is not known', 0);
INSERT INTO ingrid_codelist_domain VALUES (518, 12, 121, 'unbekannt', 'Datenupdate unbekannt', 0);
INSERT INTO ingrid_codelist_domain VALUES (520, 1, 94, 'CD Rom', 'CD Rom', 0);
INSERT INTO ingrid_codelist_domain VALUES (520, 1, 121, 'CD-ROM', 'CD-ROM', 0);
INSERT INTO ingrid_codelist_domain VALUES (520, 2, 94, 'dvd', 'dvd', 0);
INSERT INTO ingrid_codelist_domain VALUES (520, 2, 121, 'DVD', 'DVD', 0);
INSERT INTO ingrid_codelist_domain VALUES (520, 3, 94, 'dvd Rom', 'dvd Rom', 0);
INSERT INTO ingrid_codelist_domain VALUES (520, 3, 121, 'DVD-ROM', 'DVD-ROM', 0);
INSERT INTO ingrid_codelist_domain VALUES (520, 4, 94, '3.5-inch diskette', '3'''' Floppy', 0);
INSERT INTO ingrid_codelist_domain VALUES (520, 4, 121, '3,5-Zoll Diskette', '3¿¿ Floppy', 0);
INSERT INTO ingrid_codelist_domain VALUES (520, 5, 94, '5.25-inch diskette', '5 ¼¿¿ Floppy', 0);
INSERT INTO ingrid_codelist_domain VALUES (520, 5, 121, '5,25-Zoll Diskette', '5 ¼¿¿ Floppy', 0);
INSERT INTO ingrid_codelist_domain VALUES (520, 6, 94, '7 trackTape', '7 trackTape', 0);
INSERT INTO ingrid_codelist_domain VALUES (520, 6, 121, '7 Spur Band', '7 Spur Tape', 0);
INSERT INTO ingrid_codelist_domain VALUES (520, 7, 94, '9 track Tape', '9 track Tape', 0);
INSERT INTO ingrid_codelist_domain VALUES (520, 7, 121, '9 Spur Band', '9 Spur Tape', 0);
INSERT INTO ingrid_codelist_domain VALUES (520, 8, 94, '3480 Cartridge', '3480Cartridge', 0);
INSERT INTO ingrid_codelist_domain VALUES (520, 8, 121, '3480 Bandkassette', '3480 Cartridge', 0);
INSERT INTO ingrid_codelist_domain VALUES (520, 9, 94, '3490 Cartridge', '3490 Cartridge', 0);
INSERT INTO ingrid_codelist_domain VALUES (520, 9, 121, '3490 Bandkassette', '3490 Cartridge', 0);
INSERT INTO ingrid_codelist_domain VALUES (520, 10, 94, '3580 Cartridge', '3580Cartridge', 0);
INSERT INTO ingrid_codelist_domain VALUES (520, 10, 121, '3580 Bandkassette', '3580 Cartridge', 0);
INSERT INTO ingrid_codelist_domain VALUES (520, 11, 94, '4mm Cartridge Tape', '4mm Cartridge Tape', 0);
INSERT INTO ingrid_codelist_domain VALUES (520, 11, 121, '4mm Bandkassette', '4mm Cartridge Tape', 0);
INSERT INTO ingrid_codelist_domain VALUES (520, 12, 94, '8mm Cartridge Tape', '8mm Cartridge Tape', 0);
INSERT INTO ingrid_codelist_domain VALUES (520, 12, 121, '8mm Bandkassette', '8mm Cartridge Tape', 0);
INSERT INTO ingrid_codelist_domain VALUES (520, 13, 94, '0.25-inch Cartridge Tape', '¼ `¿ Cartridge Tape', 0);
INSERT INTO ingrid_codelist_domain VALUES (520, 13, 121, '1/4-Zoll Bandkassette', '¼ `¿ Cartridge Tape', 0);
INSERT INTO ingrid_codelist_domain VALUES (520, 14, 94, 'Digital Linear Tape', 'digital Linear Tape', 0);
INSERT INTO ingrid_codelist_domain VALUES (520, 14, 121, 'Digitales Band', 'Digitales Tape', 0);
INSERT INTO ingrid_codelist_domain VALUES (520, 15, 94, 'Online', 'online', 0);
INSERT INTO ingrid_codelist_domain VALUES (520, 15, 121, 'Online Link', 'Online Link', 0);
INSERT INTO ingrid_codelist_domain VALUES (520, 16, 94, 'Satellite', 'Satellite', 0);
INSERT INTO ingrid_codelist_domain VALUES (520, 16, 121, 'Satellitenverbindung', 'Satellitenverbindung', 0);
INSERT INTO ingrid_codelist_domain VALUES (520, 17, 94, 'Telephone Link', 'telephone Link', 0);
INSERT INTO ingrid_codelist_domain VALUES (520, 17, 121, 'Telefon', 'Telefonverbindung', 0);
INSERT INTO ingrid_codelist_domain VALUES (520, 18, 94, 'Hardcopy', 'hardcopy', 1);
INSERT INTO ingrid_codelist_domain VALUES (520, 18, 121, 'Papier', 'Kopie (Papier), Druckerzeugnisse usw.', 1);
INSERT INTO ingrid_codelist_domain VALUES (520, 900001, 94, 'unknown', '-', 0);
INSERT INTO ingrid_codelist_domain VALUES (520, 900001, 121, 'unbekannt (*)', 'f�r Altdaten�bernahme', 0);
INSERT INTO ingrid_codelist_domain VALUES (520, 900002, 94, 'faxback', 'faxback', 0);
INSERT INTO ingrid_codelist_domain VALUES (520, 900002, 121, 'Faxabruf', 'Faxabruf', 0);
INSERT INTO ingrid_codelist_domain VALUES (520, 900003, 94, 'mobile radio', 'mobile radio', 0);
INSERT INTO ingrid_codelist_domain VALUES (520, 900003, 121, 'Mobilfunk', 'Mobilfunk', 0);
INSERT INTO ingrid_codelist_domain VALUES (520, 900004, 94, 'broadcast', 'broadcast', 0);
INSERT INTO ingrid_codelist_domain VALUES (520, 900004, 121, 'Rundfunk', 'Rundfunk und Fernsehen', 0);
INSERT INTO ingrid_codelist_domain VALUES (520, 900005, 94, 'video text', 'video text', 0);
INSERT INTO ingrid_codelist_domain VALUES (520, 900005, 121, 'Videotext', 'Videotext', 0);
INSERT INTO ingrid_codelist_domain VALUES (520, 900006, 94, 'Analog Photography', '-', 0);
INSERT INTO ingrid_codelist_domain VALUES (520, 900006, 121, 'analoge Fotografie', '-', 0);
INSERT INTO ingrid_codelist_domain VALUES (520, 900007, 94, 'microfilm', '-', 0);
INSERT INTO ingrid_codelist_domain VALUES (520, 900007, 121, 'Mikrofilm', '-', 0);
INSERT INTO ingrid_codelist_domain VALUES (520, 900008, 94, 'Zip Drive', '-', 0);
INSERT INTO ingrid_codelist_domain VALUES (520, 900008, 121, 'ZIP-Laufwerk', '-', 0);
INSERT INTO ingrid_codelist_domain VALUES (520, 900009, 94, 'e-mail', '-', 0);
INSERT INTO ingrid_codelist_domain VALUES (520, 900009, 121, 'E-Mail', '-', 0);
INSERT INTO ingrid_codelist_domain VALUES (520, 900010, 94, 'Info Kiosk', '-', 0);
INSERT INTO ingrid_codelist_domain VALUES (520, 900010, 121, 'Infokiosk', '-', 0);
INSERT INTO ingrid_codelist_domain VALUES (523, 1, 94, 'completed', 'production of the data has been completed', 1);
INSERT INTO ingrid_codelist_domain VALUES (523, 1, 121, 'abgeschlossen', 'Datenproduktion ist abgeschlossen', 1);
INSERT INTO ingrid_codelist_domain VALUES (523, 2, 94, 'historicalArchive', 'Data has been stored in an offline storage facility', 0);
INSERT INTO ingrid_codelist_domain VALUES (523, 2, 121, 'archiviert', 'Die Daten sind in einem Archiv abgelegt', 0);
INSERT INTO ingrid_codelist_domain VALUES (523, 3, 94, 'obsolete', 'Data is no longer relevant', 0);
INSERT INTO ingrid_codelist_domain VALUES (523, 3, 121, 'obsolet', 'Die Daten sind nicht mehr l�nger relevant', 0);
INSERT INTO ingrid_codelist_domain VALUES (523, 4, 94, 'onGoing', 'Data is continually being updated', 0);
INSERT INTO ingrid_codelist_domain VALUES (523, 4, 121, 'kontinuierlich', 'Daten werden kontinuierlich erneuert', 0);
INSERT INTO ingrid_codelist_domain VALUES (523, 5, 94, 'planned', 'fixed date has been established upon or by which the data will be created or updated', 0);
INSERT INTO ingrid_codelist_domain VALUES (523, 5, 121, 'geplant', 'Ein Zeitpunkt wurde festgelegt, an dem die Daten kreiert werden', 0);
INSERT INTO ingrid_codelist_domain VALUES (523, 6, 94, 'required', 'Data needs to be generated or updated', 0);
INSERT INTO ingrid_codelist_domain VALUES (523, 6, 121, 'ben�tigt', 'Die Daten m�ssen generiert bzw. erneuert werden', 0);
INSERT INTO ingrid_codelist_domain VALUES (523, 7, 94, 'underdevelopment', 'Data is currently in the process of being created', 0);
INSERT INTO ingrid_codelist_domain VALUES (523, 7, 121, 'in Erstellung', 'Die Daten werden gerade kreiert', 0);
INSERT INTO ingrid_codelist_domain VALUES (523, 900001, 94, 'inOperation', '-', 0);
INSERT INTO ingrid_codelist_domain VALUES (523, 900001, 121, 'in Produktion', 'Informationssystem als produktiv genutztes System', 0);
INSERT INTO ingrid_codelist_domain VALUES (525, 5, 94, 'Dataset', 'information applies to the dataset', 1);
INSERT INTO ingrid_codelist_domain VALUES (525, 5, 121, 'Datensatz', 'Information zu dem Datensatz', 1);
INSERT INTO ingrid_codelist_domain VALUES (525, 6, 94, 'Dataseries', 'information applies to the series', 0);
INSERT INTO ingrid_codelist_domain VALUES (525, 6, 121, 'Datenserie', 'Information zu der Datenserie', 0);
INSERT INTO ingrid_codelist_domain VALUES (526, 1, 94, 'vector', 'vector data is used to represent geographic data', 0);
INSERT INTO ingrid_codelist_domain VALUES (526, 1, 121, 'Vektor', 'Geographische Daten werden mittels Verktordaten pr�sentiert', 0);
INSERT INTO ingrid_codelist_domain VALUES (526, 2, 94, 'grid', 'grid data is used to represent geographic data', 0);
INSERT INTO ingrid_codelist_domain VALUES (526, 2, 121, 'Rasterdaten', 'Geographische Daten werden mittels Rasterdaten dargestellt', 0);
INSERT INTO ingrid_codelist_domain VALUES (526, 3, 94, 'textTable', 'textual or tabular data is used to represent geographic data', 0);
INSERT INTO ingrid_codelist_domain VALUES (526, 3, 121, 'Texttabelle', 'Geographische Daten werden mittels Texttabellen dargestellt', 0);
INSERT INTO ingrid_codelist_domain VALUES (526, 4, 94, 'TIN', 'triangulated irregular network', 0);
INSERT INTO ingrid_codelist_domain VALUES (526, 4, 121, 'TIN', 'Geographische Daten werden mittels eines trinangul�ren irregul�ren Netzes dargestellt dargestellt', 0);
INSERT INTO ingrid_codelist_domain VALUES (526, 5, 94, 'stereoModel', 'three-dimensional view formed by the intersecting homologous rays of an overlapping pair of images', 0);
INSERT INTO ingrid_codelist_domain VALUES (526, 5, 121, 'Stereomodell', 'Geographische Daten werden mittels eines stereosehenden Models dargestellt', 0);
INSERT INTO ingrid_codelist_domain VALUES (526, 6, 94, 'video', 'scene from a video recording', 0);
INSERT INTO ingrid_codelist_domain VALUES (526, 6, 121, 'Video', 'Geographische Daten werden mittels einer Videoaufnahme dargestellt', 0);
INSERT INTO ingrid_codelist_domain VALUES (527, 1, 94, 'Farming', 'rearing of animals and/or cultivation of plants', 0);
INSERT INTO ingrid_codelist_domain VALUES (527, 1, 121, 'Landwirtschaft', 'Landwirtschaft (Tierzucht oder Pflanzenanbau)', 0);
INSERT INTO ingrid_codelist_domain VALUES (527, 2, 94, 'Biota', 'flora and/or fauna in natural environment. Examples: wildlife, vegetation, biological sciences, ecology, wilderness, sealife, wetlands, habitat', 0);
INSERT INTO ingrid_codelist_domain VALUES (527, 2, 121, 'Flora, Fauna, Habitate', 'Flora und Fauna in der nat�rlichen Umwelt', 0);
INSERT INTO ingrid_codelist_domain VALUES (527, 3, 94, 'Boundaries', 'legal land descriptions. Examples: political and administrative boundaries', 0);
INSERT INTO ingrid_codelist_domain VALUES (527, 3, 121, 'Grenzen', 'Rechtl. Beschreibungen und Grenzen von Land', 0);
INSERT INTO ingrid_codelist_domain VALUES (527, 4, 94, 'Climatology MeteorologyAtmosphere', 'processes and phenomena of the atmosphere. Examples: cloud cover, weather, climate, atmospheric conditions, climate change, precipitation', 0);
INSERT INTO ingrid_codelist_domain VALUES (527, 4, 121, 'Klima und Atmosph�re', 'Prozesse und Ph�nomene der Atmosph�re', 0);
INSERT INTO ingrid_codelist_domain VALUES (527, 5, 94, 'Economy', 'economic activities, conditions and employment. Examples: production, labour, revenue, commerce, industry, tourism and ecotourism, forestry, fisheries, commercial or subsistence hunting, etc.', 0);
INSERT INTO ingrid_codelist_domain VALUES (527, 5, 121, '�konomie', '�konomische Aktivit�ten, Konditionen und besch�ftigung', 0);
INSERT INTO ingrid_codelist_domain VALUES (527, 6, 94, 'Elevation', 'height above or below sea level. Examples: altitude, bathymetry, digital elevation models, slope, derived products', 0);
INSERT INTO ingrid_codelist_domain VALUES (527, 6, 121, 'H�he', 'H�he �ber oder unter NN', 0);
INSERT INTO ingrid_codelist_domain VALUES (527, 7, 94, 'Environment', 'environmental resources, protection and conservation. Examples: environmental pollution, waste storage and treatment, environmental impact assessment, monitoring environmental risk, nature reserves, landscape', 1);
INSERT INTO ingrid_codelist_domain VALUES (527, 7, 121, 'Umwelt', 'Umweltresourcen, -schutz und -erhaltung', 1);
INSERT INTO ingrid_codelist_domain VALUES (527, 8, 94, 'Geoscientific Information', 'information pertaining to earth sciences. Examples: geophysical features and processes, geology, minerals, sciences dealing with the composition, structure and origin of the earth¿s rocks, risks of earthquakes', 0);
INSERT INTO ingrid_codelist_domain VALUES (527, 8, 121, 'Geowissenschaft', 'Information die Geowissenshaften betreffend', 0);
INSERT INTO ingrid_codelist_domain VALUES (527, 9, 94, 'Health', 'health, health services, human ecology, and safety. Examples: disease and illness, factors affecting health, hygiene, substance abuse, mental and physical health, health services', 0);
INSERT INTO ingrid_codelist_domain VALUES (527, 9, 121, 'Gesundheit', 'Gesundheit, Gesundheitsservices, Human�kologie und Sicherheit', 0);
INSERT INTO ingrid_codelist_domain VALUES (527, 10, 94, 'Imagery Base Maps EarthCover', 'base maps. Examples: land cover, topographic maps, imagery, unclassified images, annotations', 0);
INSERT INTO ingrid_codelist_domain VALUES (527, 10, 121, 'Karten', 'Karten', 0);
INSERT INTO ingrid_codelist_domain VALUES (527, 11, 94, 'Intelligence Military', 'military bases, structures, activities. Examples: barracks, training grounds, military transportation, information', 0);
INSERT INTO ingrid_codelist_domain VALUES (527, 11, 121, 'Milit�r', 'Milit�rische St�tzpunkte, Strikturen und Aktivit�ten', 0);
INSERT INTO ingrid_codelist_domain VALUES (527, 12, 94, 'Inland Waters', 'inland water features, drainage systems and their characteristics. Examples: rivers and glaciers, salt lakes, water utilization plans, dams, currents, floods, water quality, hydrographic charts', 0);
INSERT INTO ingrid_codelist_domain VALUES (527, 12, 121, 'Binnengew�sser', 'Inlandwasser, Abfl�sse und deren Eigenschaften und Charakteristika', 0);
INSERT INTO ingrid_codelist_domain VALUES (527, 13, 94, 'Location', 'positional information and services. Examples: addresses, geodetic networks, control points, postal zones and services, place names', 0);
INSERT INTO ingrid_codelist_domain VALUES (527, 13, 121, 'Ortsangabe', 'Ortsangaben und -services', 0);
INSERT INTO ingrid_codelist_domain VALUES (527, 14, 94, 'Oceans', 'features and characteristics of salt water bodies (excluding inland waters): Examples: tides, tidal waves, coastal information, reefs', 0);
INSERT INTO ingrid_codelist_domain VALUES (527, 14, 121, 'Ozeane', 'Ozeane und deren Charakteristika und Eigenschaften', 0);
INSERT INTO ingrid_codelist_domain VALUES (527, 15, 94, 'PlanningCadastre', 'information used for appropriate actions for future use of the land Examples: land use maps, zoning maps, cadastral surveys, land ownership', 0);
INSERT INTO ingrid_codelist_domain VALUES (527, 15, 121, 'Kataster', 'Informationen zu angemessenem Handeln f�r die zuk�nftige Nutzung des Landes', 0);
INSERT INTO ingrid_codelist_domain VALUES (527, 16, 94, 'Society', 'characteristics of society and cultures. Examples: settlements, anthropology, archaeology, education, traditionalbeliefs, manners and customs, demographic data, recreational areas and activities,', 0);
INSERT INTO ingrid_codelist_domain VALUES (527, 16, 121, 'Gesellschaft', 'Charakteristika von Gesellschaft und Kulturen', 0);
INSERT INTO ingrid_codelist_domain VALUES (527, 17, 94, 'Structure', 'man-made construction. Examples: buildings, museums, churches, factories, housing, monuments, shops, towers', 0);
INSERT INTO ingrid_codelist_domain VALUES (527, 17, 121, 'Bau', 'Kontsruktionen (von Menschen geshaffen)', 0);
INSERT INTO ingrid_codelist_domain VALUES (527, 18, 94, 'Transportation', 'means and aids for conveying persons and/or goods. Examples: roads, airports/airstrips, shipping routes, tunnels, nautical charts, vehicle or vessel location, aeronautical charts, railways', 0);
INSERT INTO ingrid_codelist_domain VALUES (527, 18, 121, 'Transport', 'Hilfsmittel und Ger�te zum Bef�rdern von Personen und/oder G�tern', 0);
INSERT INTO ingrid_codelist_domain VALUES (527, 19, 94, 'Utilities Communication', 'energy, water and waste systems and communications infrastructure and services. Examples: hydroelectricity, geothermal, solar and nuclear sources of energy, water purification and distribution, sewage collection and disposal, etc.', 0);
INSERT INTO ingrid_codelist_domain VALUES (527, 19, 121, 'Energie und Kommunikation', 'Energie-, Wasser- und Abfallsysteme sowie Kommunikationsinfrastruktur und Services.', 0);
INSERT INTO ingrid_codelist_domain VALUES (528, 1, 94, 'geometryOnly', 'geometry objects without any additional structure which describes topology', 1);
INSERT INTO ingrid_codelist_domain VALUES (528, 1, 121, 'geometrisch', 'Geometrisch Objekte ohn jegliche Struktur, die die Topologie beschreibt', 1);
INSERT INTO ingrid_codelist_domain VALUES (528, 2, 94, 'topology1D', '1-dimensional topological complex', 0);
INSERT INTO ingrid_codelist_domain VALUES (528, 2, 121, 'Topologie (1D)', '1-dimensionaler topologischer Komplex', 0);
INSERT INTO ingrid_codelist_domain VALUES (528, 3, 94, 'planarGraph', '1-dimensional topological complex which is planar', 0);
INSERT INTO ingrid_codelist_domain VALUES (528, 3, 121, 'Planar (1D)', '1-dimensionaler topologischer Komplex, der eine Fl�che ist', 0);
INSERT INTO ingrid_codelist_domain VALUES (528, 4, 94, 'fullPlanarGraph', '2-dimensional topological complex which is planar', 0);
INSERT INTO ingrid_codelist_domain VALUES (528, 4, 121, 'Planar (2D)', '2-dimensionaler topologischer Komplex, der eine Fl�che ist', 0);
INSERT INTO ingrid_codelist_domain VALUES (528, 5, 94, 'surfaceGraph', '1-dimensional topological complex which is isomorphic to a subset of a surface', 0);
INSERT INTO ingrid_codelist_domain VALUES (528, 5, 121, 'Oberfl�chengraph (1D)', '1-dimensionaler topologischer Komplex, der isomorph zu einer Untermenge einer Oberfl�che ist', 0);
INSERT INTO ingrid_codelist_domain VALUES (528, 6, 94, 'fullSurfaceGraph', '2-dimensional topological complex which is isomorphic to a subset of a surface', 0);
INSERT INTO ingrid_codelist_domain VALUES (528, 6, 121, 'Oberfl�che(2D)', '2-dimensionaler topologischer Komplex, der isomorph zu einer Untermenge einer Oberfl�che ist', 0);
INSERT INTO ingrid_codelist_domain VALUES (528, 7, 94, 'topology3D', '3-dimensional topological complex', 0);
INSERT INTO ingrid_codelist_domain VALUES (528, 7, 121, 'Topologie (3D)', '3-dimensionaler topologischer Komplex', 0);
INSERT INTO ingrid_codelist_domain VALUES (528, 8, 94, 'fullTopology3D', 'complete coverage of a 3D coordinate space', 0);
INSERT INTO ingrid_codelist_domain VALUES (528, 8, 121, 'Raum (3D)', 'Komplette Abdeckung eines 3-D Koordinatenraumes', 0);
INSERT INTO ingrid_codelist_domain VALUES (528, 9, 94, 'abstract', 'topological complex without any specified geometric realization', 0);
INSERT INTO ingrid_codelist_domain VALUES (528, 9, 121, 'Abstrakte Topologie', 'Topologischer Komplex ohne jegliche spezifische geometrische Realisierung', 0);
INSERT INTO ingrid_codelist_domain VALUES (99999999, 94, 94, 'English', '-', 0);
INSERT INTO ingrid_codelist_domain VALUES (99999999, 94, 121, 'Englisch', '-', 0);
INSERT INTO ingrid_codelist_domain VALUES (99999999, 121, 94, 'German', '-', 1);
INSERT INTO ingrid_codelist_domain VALUES (99999999, 121, 121, 'Deutsch', '-', 1);


DROP TABLE IF EXISTS qrtz_job_listeners;
DROP TABLE IF EXISTS qrtz_trigger_listeners;
DROP TABLE IF EXISTS qrtz_fired_triggers;
DROP TABLE IF EXISTS qrtz_paused_trigger_grps;
DROP TABLE IF EXISTS qrtz_scheduler_state;
DROP TABLE IF EXISTS qrtz_locks;
DROP TABLE IF EXISTS qrtz_simple_triggers;
DROP TABLE IF EXISTS qrtz_cron_triggers;
DROP TABLE IF EXISTS qrtz_blob_triggers;
DROP TABLE IF EXISTS qrtz_triggers;
DROP TABLE IF EXISTS qrtz_job_details;
DROP TABLE IF EXISTS qrtz_calendars;


CREATE TABLE qrtz_job_details
  (
    JOB_NAME  VARCHAR(80) NOT NULL,
    JOB_GROUP VARCHAR(80) NOT NULL,
    DESCRIPTION VARCHAR(120) NULL,
    JOB_CLASS_NAME   VARCHAR(128) NOT NULL,
    IS_DURABLE VARCHAR(1) NOT NULL,
    IS_VOLATILE VARCHAR(1) NOT NULL,
    IS_STATEFUL VARCHAR(1) NOT NULL,
    REQUESTS_RECOVERY VARCHAR(1) NOT NULL,
    JOB_DATA BLOB NULL,
    PRIMARY KEY (JOB_NAME,JOB_GROUP)
);

CREATE TABLE qrtz_job_listeners
  (
    JOB_NAME  VARCHAR(80) NOT NULL,
    JOB_GROUP VARCHAR(80) NOT NULL,
    JOB_LISTENER VARCHAR(80) NOT NULL,
    PRIMARY KEY (JOB_NAME,JOB_GROUP,JOB_LISTENER),
    FOREIGN KEY (JOB_NAME,JOB_GROUP)
        REFERENCES qrtz_job_details(JOB_NAME,JOB_GROUP)
);

CREATE TABLE qrtz_triggers
  (
    TRIGGER_NAME VARCHAR(80) NOT NULL,
    TRIGGER_GROUP VARCHAR(80) NOT NULL,
    JOB_NAME  VARCHAR(80) NOT NULL,
    JOB_GROUP VARCHAR(80) NOT NULL,
    IS_VOLATILE VARCHAR(1) NOT NULL,
    DESCRIPTION VARCHAR(120) NULL,
    NEXT_FIRE_TIME BIGINT(13) NULL,
    PREV_FIRE_TIME BIGINT(13) NULL,
    PRIORITY INTEGER NULL,
    TRIGGER_STATE VARCHAR(16) NOT NULL,
    TRIGGER_TYPE VARCHAR(8) NOT NULL,
    START_TIME BIGINT(13) NOT NULL,
    END_TIME BIGINT(13) NULL,
    CALENDAR_NAME VARCHAR(80) NULL,
    MISFIRE_INSTR SMALLINT(2) NULL,
    JOB_DATA BLOB NULL,
    PRIMARY KEY (TRIGGER_NAME,TRIGGER_GROUP),
    FOREIGN KEY (JOB_NAME,JOB_GROUP)
        REFERENCES qrtz_job_details(JOB_NAME,JOB_GROUP)
);

CREATE TABLE qrtz_simple_triggers
  (
    TRIGGER_NAME VARCHAR(80) NOT NULL,
    TRIGGER_GROUP VARCHAR(80) NOT NULL,
    REPEAT_COUNT BIGINT(7) NOT NULL,
    REPEAT_INTERVAL BIGINT(12) NOT NULL,
    TIMES_TRIGGERED BIGINT(7) NOT NULL,
    PRIMARY KEY (TRIGGER_NAME,TRIGGER_GROUP),
    FOREIGN KEY (TRIGGER_NAME,TRIGGER_GROUP)
        REFERENCES qrtz_triggers(TRIGGER_NAME,TRIGGER_GROUP)
);

CREATE TABLE qrtz_cron_triggers
  (
    TRIGGER_NAME VARCHAR(80) NOT NULL,
    TRIGGER_GROUP VARCHAR(80) NOT NULL,
    CRON_EXPRESSION VARCHAR(80) NOT NULL,
    TIME_ZONE_ID VARCHAR(80),
    PRIMARY KEY (TRIGGER_NAME,TRIGGER_GROUP),
    FOREIGN KEY (TRIGGER_NAME,TRIGGER_GROUP)
        REFERENCES qrtz_triggers(TRIGGER_NAME,TRIGGER_GROUP)
);

CREATE TABLE qrtz_blob_triggers
  (
    TRIGGER_NAME VARCHAR(80) NOT NULL,
    TRIGGER_GROUP VARCHAR(80) NOT NULL,
    BLOB_DATA BLOB NULL,
    PRIMARY KEY (TRIGGER_NAME,TRIGGER_GROUP),
    FOREIGN KEY (TRIGGER_NAME,TRIGGER_GROUP)
        REFERENCES qrtz_triggers(TRIGGER_NAME,TRIGGER_GROUP)
);

CREATE TABLE qrtz_trigger_listeners
  (
    TRIGGER_NAME  VARCHAR(80) NOT NULL,
    TRIGGER_GROUP VARCHAR(80) NOT NULL,
    TRIGGER_LISTENER VARCHAR(80) NOT NULL,
    PRIMARY KEY (TRIGGER_NAME,TRIGGER_GROUP,TRIGGER_LISTENER),
    FOREIGN KEY (TRIGGER_NAME,TRIGGER_GROUP)
        REFERENCES qrtz_triggers(TRIGGER_NAME,TRIGGER_GROUP)
);


CREATE TABLE qrtz_calendars
  (
    CALENDAR_NAME  VARCHAR(80) NOT NULL,
    CALENDAR BLOB NOT NULL,
    PRIMARY KEY (CALENDAR_NAME)
);



CREATE TABLE qrtz_paused_trigger_grps
  (
    TRIGGER_GROUP  VARCHAR(80) NOT NULL, 
    PRIMARY KEY (TRIGGER_GROUP)
);

CREATE TABLE qrtz_fired_triggers
  (
    ENTRY_ID VARCHAR(95) NOT NULL,
    TRIGGER_NAME VARCHAR(80) NOT NULL,
    TRIGGER_GROUP VARCHAR(80) NOT NULL,
    IS_VOLATILE VARCHAR(1) NOT NULL,
    INSTANCE_NAME VARCHAR(80) NOT NULL,
    FIRED_TIME BIGINT(13) NOT NULL,
    PRIORITY INTEGER NOT NULL,
    STATE VARCHAR(16) NOT NULL,
    JOB_NAME VARCHAR(80) NULL,
    JOB_GROUP VARCHAR(80) NULL,
    IS_STATEFUL VARCHAR(1) NULL,
    REQUESTS_RECOVERY VARCHAR(1) NULL,
    PRIMARY KEY (ENTRY_ID)
);

CREATE TABLE qrtz_scheduler_state
  (
    INSTANCE_NAME VARCHAR(80) NOT NULL,
    LAST_CHECKIN_TIME BIGINT(13) NOT NULL,
    CHECKIN_INTERVAL BIGINT(13) NOT NULL,
    PRIMARY KEY (INSTANCE_NAME)
);

CREATE TABLE qrtz_locks
  (
    LOCK_NAME  VARCHAR(40) NOT NULL, 
    PRIMARY KEY (LOCK_NAME)
);


INSERT INTO qrtz_locks values('TRIGGER_ACCESS');
INSERT INTO qrtz_locks values('JOB_ACCESS');
INSERT INTO qrtz_locks values('CALENDAR_ACCESS');
INSERT INTO qrtz_locks values('STATE_ACCESS');
INSERT INTO qrtz_locks values('MISFIRE_ACCESS');
