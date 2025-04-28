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

# Spring Boot API service
dc_resource('springboot-api',
  labels=['backend', 'java'],
  resource_deps=['db'],
  trigger_mode=TRIGGER_MODE_AUTO,
  auto_init=True)

# Spring Boot specific file watching
# This watches all .java, .gradle, and application properties files
custom_build(
  'springboot-api-watcher',
  'echo "Spring Boot file change detected"',
  deps=['./easy_3tire_springboot_api/src', './easy_3tire_springboot_api/build.gradle'],
  live_update=[
    fall_back_on(['./easy_3tire_springboot_api/build.gradle', './easy_3tire_springboot_api/settings.gradle']),
  ],
  skips_local_docker=True,
  auto_init=False
)

# Frontend service
dc_resource('frontend',
  labels=['frontend'],
  resource_deps=['api', 'springboot-api'],
  trigger_mode=TRIGGER_MODE_AUTO,
  auto_init=True)

# Enable port forwarding
config.define_string_list('services', args=True)
cfg = config.parse()
services = cfg.get('services', [])

# Configure Tilt UI
config.set_enabled_resources(['db', 'api', 'springboot-api', 'frontend'])

# Allow selective service startup
if len(services) > 0:
    config.clear_enabled_resources()
    config.set_enabled_resources(services)