CREATE TABLE "permission_details" (
  id bigserial PRIMARY KEY,

  permission_id int8 NOT NULL,

  permission_name varchar NOT NULL,

  permission varchar NOT NULL,

  is_active bool NOT NULL,

  created_at timestamp without time zone NOT NULL,

  updated_at timestamp without time zone NOT NULL
);

COMMENT ON TABLE permission_details IS 'Permission Details';

-- Column comments

COMMENT ON COLUMN permission_details.id IS 'ID';

COMMENT ON COLUMN permission_details.permission_id IS 'Permission ID';

COMMENT ON COLUMN permission_details.permission_name IS 'Permission Name';

COMMENT ON COLUMN permission_details.permission IS 'Permission';

COMMENT ON COLUMN permission_details.is_active IS 'Is Active';

COMMENT ON COLUMN permission_details.created_at IS 'Created At';

COMMENT ON COLUMN permission_details.updated_at IS 'Updated At';
