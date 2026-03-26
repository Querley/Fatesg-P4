CREATE TABLE companies (
  comp_no INT,
  name VARCHAR(100),
  created_at DATE,
  adress VARCHAR(150),
  phone VARCHAR(20)
)
TABLESPACE tbs_meu_espaco
ROW_FORMAT=COMPRESSED;
