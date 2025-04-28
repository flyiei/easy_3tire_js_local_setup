-- Create table for Node.js API
CREATE TABLE IF NOT EXISTS items (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  description TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Create table for Spring Boot API
CREATE TABLE IF NOT EXISTS spring_items (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  description TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Insert sample data for Node.js API
INSERT INTO items (name, description) VALUES
  ('Node Item 1', 'This item comes from the Node.js API'),
  ('Node Item 2', 'Another item from Express backend'),
  ('Node Item 3', 'Third item from JavaScript backend');

-- Insert sample data for Spring Boot API
INSERT INTO spring_items (name, description) VALUES
  ('Spring Item 1', 'This item comes from the Spring Boot API'),
  ('Spring Item 2', 'Java-powered item from Spring backend'),
  ('Spring Item 3', 'Third item from Spring Boot backend'),
  ('Spring Item 4', 'Fourth item with Spring framework');

-- Grant permissions
GRANT ALL PRIVILEGES ON TABLE items TO devuser;
GRANT USAGE, SELECT ON SEQUENCE items_id_seq TO devuser;
GRANT ALL PRIVILEGES ON TABLE spring_items TO devuser;
GRANT USAGE, SELECT ON SEQUENCE spring_items_id_seq TO devuser;