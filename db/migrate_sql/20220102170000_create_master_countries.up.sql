CREATE TABLE master_countries (
  id bigserial PRIMARY KEY,

  "name" varchar NOT NULL,

  "code" int8 NOT NULL,

  code_name varchar NOT NULL,

  phone_code int8 NOT NULL,

  created_at timestamp without time zone NOT NULL,

  updated_at timestamp without time zone NOT NULL
);

COMMENT ON TABLE master_countries IS 'Country';

-- Column comments

COMMENT ON COLUMN master_countries.id IS 'ID';

COMMENT ON COLUMN master_countries."name" IS 'Name';

COMMENT ON COLUMN master_countries."code" IS 'Code';

COMMENT ON COLUMN master_countries."code_name" IS 'Code Name';

COMMENT ON COLUMN master_countries."phone_code" IS 'Phone Code';

COMMENT ON COLUMN master_countries.created_at IS 'Created At';

COMMENT ON COLUMN master_countries.updated_at IS 'Updated At';
