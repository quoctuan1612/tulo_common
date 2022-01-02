CREATE TABLE users (
  id bigserial PRIMARY KEY,

  employee_id int8 NOT NULL,

  user_name varchar NOT NULL,

  encrypted_password varchar NOT NULL,

  created_at timestamp without time zone NOT NULL,

  updated_at timestamp without time zone NOT NULL 
);

COMMENT ON TABLE users IS 'Users';

-- Column comments

COMMENT ON COLUMN users.id IS 'ID';

COMMENT ON COLUMN users.employee_id IS 'Employee ID';

COMMENT ON COLUMN users.user_name IS 'User Name';

COMMENT ON COLUMN users.encrypted_password IS 'Password';

COMMENT ON COLUMN users.created_at IS 'Created At';

COMMENT ON COLUMN users.updated_at IS 'Updated At';
