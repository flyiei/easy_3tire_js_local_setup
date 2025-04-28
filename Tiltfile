# Enable Docker Compose
docker_compose('docker-compose.yml')

# Suppress warning for springboot-api-watcher (it's a helper, not used directly)
update_settings(suppress_unused_image_warnings=["springboot-api-watcher"])

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

# Spring Boot file watching - adding a custom watcher for files that might
# not trigger an automatic restart via Spring DevTools
custom_build(
  'springboot-api-watcher',
  'echo "Spring Boot file change detected"',
  deps=['./easy_3tire_springboot_api/src', './easy_3tire_springboot_api/build.gradle'],
  live_update=[
    # Fall back to a full rebuild for certain files - must be first!
    fall_back_on(['./easy_3tire_springboot_api/build.gradle', './easy_3tire_springboot_api/settings.gradle']),
    # Sync the source files to the container
    sync('./easy_3tire_springboot_api/src', '/app/src'),
    # Run a command when files change
    run('touch /app/src/main/resources/restart.trigger')
  ],
  skips_local_docker=True
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