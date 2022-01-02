CREATE TABLE master_provinces (
  id bigserial PRIMARY KEY,

  "name" varchar NOT NULL,

  "code" int8 NOT NULL,

  code_name varchar NOT NULL,

  division_type varchar NOT NULL,

  phone_code int8 NOT NULL,

  master_country_id int8 NOT NULL,

  created_at timestamp without time zone NOT NULL,

  updated_at timestamp without time zone NOT NULL
);

COMMENT ON TABLE master_provinces IS 'Province';

-- Column comments

COMMENT ON COLUMN master_provinces.id IS 'ID';

COMMENT ON COLUMN master_provinces."name" IS 'Name';

COMMENT ON COLUMN master_provinces."code" IS 'Code';

COMMENT ON COLUMN master_provinces."code_name" IS 'Code Name';

COMMENT ON COLUMN master_provinces."division_type" IS 'Division Type';

COMMENT ON COLUMN master_provinces."phone_code" IS 'Phone Code';

COMMENT ON COLUMN master_provinces.master_country_id IS 'Country ID';

COMMENT ON COLUMN master_provinces.created_at IS 'Created At';

COMMENT ON COLUMN master_provinces.updated_at IS 'Updated At';
