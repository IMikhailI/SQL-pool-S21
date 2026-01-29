CREATE sequence seq_person_discounts start 1;
ALTER TABLE person_discounts ALTER column id SET DEFAULT nextval('seq_person_discounts');
SELECT setval('seq_person_discounts', (SELECT count(*) + 1 
                                       FROM person_discounts));