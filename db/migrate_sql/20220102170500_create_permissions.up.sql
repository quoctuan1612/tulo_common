CREATE TABLE "permissions" (
  id bigserial PRIMARY KEY,

  role_id varchar NOT NULL,

  description varchar NULL,

  created_at timestamp without time zone NOT NULL,

  updated_at timestamp without time zone NOT NULL
);

COMMENT ON TABLE permissions IS 'Permission';

-- Column comments

COMMENT ON COLUMN permissions.id IS 'ID';

COMMENT ON COLUMN permissions.role_id IS 'Role ID';

COMMENT ON COLUMN permissions.description IS 'Description';

COMMENT ON COLUMN permissions.created_at IS 'Created At';

COMMENT ON COLUMN permissions.updated_at IS 'Updated At';
