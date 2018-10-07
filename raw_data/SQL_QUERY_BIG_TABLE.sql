INSERT INTO reg_ios
( SELECT  registrations.day, COUNT(registrations.device_type) FROM registrations WHERE registrations.device_type LIKE 'ios' GROUP BY registrations.day, registrations.reg_date ORDER BY registrations.reg_date);
INSERT INTO reg_andr
( SELECT  registrations.day, COUNT(registrations.device_type) FROM registrations WHERE registrations.device_type LIKE 'android' GROUP BY registrations.day, registrations.reg_date ORDER BY registrations.reg_date);
INSERT INTO reg_error
( SELECT  registrations.day, COUNT(registrations.device_type) FROM registrations WHERE registrations.device_type LIKE 'error' GROUP BY registrations.day, registrations.reg_date ORDER BY registrations.reg_date);
INSERT INTO reg_google
( SELECT  registrations.day, COUNT(registrations.source) FROM registrations WHERE registrations.source LIKE 'google' GROUP BY registrations.day, registrations.reg_date ORDER BY registrations.reg_date);
INSERT INTO reg_invite
( SELECT  registrations.day, COUNT(registrations.source) FROM registrations WHERE registrations.source LIKE 'invite_a_friend' GROUP BY registrations.day, registrations.reg_date ORDER BY registrations.reg_date);
INSERT INTO reg_article
( SELECT  registrations.day, COUNT(registrations.source) FROM registrations WHERE registrations.source LIKE 'article' GROUP BY registrations.day, registrations.reg_date ORDER BY registrations.reg_date);
INSERT INTO reg_paid
( SELECT  registrations.day, COUNT(registrations.source) FROM registrations WHERE registrations.source LIKE 'paid' GROUP BY registrations.day, registrations.reg_date ORDER BY registrations.reg_date);
INSERT INTO reg_germany
( SELECT  registrations.day, COUNT(registrations.country) FROM registrations WHERE registrations.country LIKE 'germany' GROUP BY registrations.day, registrations.reg_date ORDER BY registrations.reg_date);
INSERT INTO reg_brazil
( SELECT  registrations.day, COUNT(registrations.country) FROM registrations WHERE registrations.country LIKE 'brazil' GROUP BY registrations.day, registrations.reg_date ORDER BY registrations.reg_date);
INSERT INTO reg_us
( SELECT  registrations.day, COUNT(registrations.country) FROM registrations WHERE registrations.country LIKE 'united_states' GROUP BY registrations.day, registrations.reg_date ORDER BY registrations.reg_date);
INSERT INTO reg_sweden
( SELECT  registrations.day, COUNT(registrations.country) FROM registrations WHERE registrations.country LIKE 'sweden' GROUP BY registrations.day, registrations.reg_date ORDER BY registrations.reg_date);
INSERT INTO reg_philip
( SELECT  registrations.day, COUNT(registrations.country) FROM registrations WHERE registrations.country LIKE 'philippines' GROUP BY registrations.day, registrations.reg_date ORDER BY registrations.reg_date);
INSERT INTO reg_born197
( SELECT  registrations.day, COUNT(registrations.birth_year) FROM registrations WHERE registrations.birth_year LIKE '197%' GROUP BY registrations.day, registrations.reg_date ORDER BY registrations.reg_date);
INSERT INTO reg_born198
( SELECT  registrations.day, COUNT(registrations.birth_year) FROM registrations WHERE registrations.birth_year LIKE '198%' GROUP BY registrations.day, registrations.reg_date ORDER BY registrations.reg_date);
INSERT INTO reg_born199
( SELECT  registrations.day, COUNT(registrations.birth_year) FROM registrations WHERE registrations.birth_year LIKE '199%' GROUP BY registrations.day, registrations.reg_date ORDER BY registrations.reg_date);
INSERT INTO day_supertree
( SELECT  super_tree.day, COUNT(super_tree.event) FROM super_tree WHERE super_tree.event LIKE 'sent_a_super_tree' GROUP BY super_tree.day, super_tree.sent_date ORDER BY super_tree.sent_date);
INSERT INTO day_freetree
( SELECT  free_tree.day, COUNT(free_tree.event) FROM free_tree WHERE free_tree.event LIKE 'sent_a_free_tree' GROUP BY free_tree.day, free_tree.sent_date ORDER BY free_tree.sent_date);

