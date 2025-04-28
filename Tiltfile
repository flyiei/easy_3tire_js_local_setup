# Enable Docker Compose
docker_compose('docker-compose.yml')

# Configure resources with labels and dependencies
dc_resource('db', 
  labels=['database'],
  auto_init=True)

dc_resource('api',
  labels=['backend'],
  resource_deps=['db'],
  serve_cmd='cd easy_3tire_js_api && npm run dev',
  trigger_mode=TRIGGER_MODE_AUTO,
  auto_init=True)

dc_resource('frontend',
  labels=['frontend'],
  resource_deps=['api'],
  serve_cmd='cd easy_3tire_js_frontend && npm start',
  trigger_mode=TRIGGER_MODE_AUTO,
  auto_init=True)

# Enable port forwarding
config.define_string_list('services', args=True)
cfg = config.parse()
services = cfg.get('services', [])

# Set live update configuration
# Watch frontend files and sync them to the container
sync('./easy_3tire_js_frontend/src', '/app/src')
# Watch API files and sync them to the container
sync('./easy_3tire_js_api/src', '/app/src')

# Configure Tilt UI
config.set_enabled_resources(['db', 'api', 'frontend'])

# Allow selective service startup
if len(services) > 0:
    config.clear_enabled_resources()
    config.set_enabled_resources(services)