# Enable Docker Compose
docker_compose('docker-compose.yml')

# Configure resources with labels and dependencies
dc_resource('db', 
  labels=['database'],
  auto_init=True)

# API service
dc_resource('api',
  labels=['backend'],
  resource_deps=['db'],
  trigger_mode=TRIGGER_MODE_AUTO,
  auto_init=True)

# Frontend service
dc_resource('frontend',
  labels=['frontend'],
  resource_deps=['api'],
  trigger_mode=TRIGGER_MODE_AUTO,
  auto_init=True)

# Enable port forwarding
config.define_string_list('services', args=True)
cfg = config.parse()
services = cfg.get('services', [])

# Configure Tilt UI
config.set_enabled_resources(['db', 'api', 'frontend'])

# Allow selective service startup
if len(services) > 0:
    config.clear_enabled_resources()
    config.set_enabled_resources(services)