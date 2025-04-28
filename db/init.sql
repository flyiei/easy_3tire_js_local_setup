-- Create tables
CREATE TABLE IF NOT EXISTS items (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  description TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Insert sample data
INSERT INTO items (name, description) VALUES
  ('Item 1', 'Description for item 1'),
  ('Item 2', 'Description for item 2'),
  ('Item 3', 'Description for item 3');

-- Grant permissions
GRANT ALL PRIVILEGES ON TABLE items TO devuser;
GRANT USAGE, SELECT ON SEQUENCE items_id_seq TO devuser;