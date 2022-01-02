CREATE TABLE master_wards (
  id bigserial PRIMARY KEY,

  "name" varchar NOT NULL,

  "code" int8 NOT NULL,

  code_name varchar NOT NULL,

  division_type varchar NOT NULL,

  short_code_name varchar NOT NULL,

  master_district_id int8 NOT NULL,

  created_at timestamp without time zone NOT NULL,

  updated_at timestamp without time zone NOT NULL
);

COMMENT ON TABLE master_wards IS 'Ward';

-- Column comments

COMMENT ON COLUMN master_wards.id IS 'ID';

COMMENT ON COLUMN master_wards."name" IS 'Name';

COMMENT ON COLUMN master_wards."code" IS 'Code';

COMMENT ON COLUMN master_wards."code_name" IS 'Code Name';

COMMENT ON COLUMN master_wards."division_type" IS 'Division Type';

COMMENT ON COLUMN master_wards."short_code_name" IS 'Short Code Name';

COMMENT ON COLUMN master_wards.master_district_id IS 'District ID';

COMMENT ON COLUMN master_wards.created_at IS 'Created At';

COMMENT ON COLUMN master_wards.updated_at IS 'Updated At';
