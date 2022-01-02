CREATE TABLE roles (
  id bigserial PRIMARY KEY,

  role_id varchar NOT NULL,

  role_name varchar NOT NULL,

  description varchar NULL,

  created_at timestamp without time zone NOT NULL,

  updated_at timestamp without time zone NOT NULL 
);

COMMENT ON TABLE roles IS 'Roles';

-- Column comments

COMMENT ON COLUMN roles.id IS 'ID';

COMMENT ON COLUMN roles.role_id IS 'Role ID';

COMMENT ON COLUMN roles.role_name IS 'Role Name';

COMMENT ON COLUMN roles.description IS 'Description';

COMMENT ON COLUMN roles.created_at IS 'Created At';

COMMENT ON COLUMN roles.updated_at IS 'Updated At';