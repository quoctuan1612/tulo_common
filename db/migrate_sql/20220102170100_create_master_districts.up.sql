CREATE TABLE master_districts (
  id bigserial PRIMARY KEY,

  "name" varchar NOT NULL,

  "code" int8 NOT NULL,

  code_name varchar NOT NULL,

  division_type varchar NOT NULL,

  short_code_name varchar NOT NULL,

  master_province_id int8 NOT NULL,

  created_at timestamp without time zone NOT NULL,

  updated_at timestamp without time zone NOT NULL
);

COMMENT ON TABLE master_districts IS 'District';

-- Column comments

COMMENT ON COLUMN master_districts.id IS 'ID';

COMMENT ON COLUMN master_districts."name" IS 'Name';

COMMENT ON COLUMN master_districts."code" IS 'Code';

COMMENT ON COLUMN master_districts."code_name" IS 'Code Name';

COMMENT ON COLUMN master_districts."division_type" IS 'Division Type';

COMMENT ON COLUMN master_districts."short_code_name" IS 'Short Code Name';

COMMENT ON COLUMN master_districts.master_province_id IS 'Province ID';

COMMENT ON COLUMN master_districts.created_at IS 'Created At';

COMMENT ON COLUMN master_districts.updated_at IS 'Updated At';
