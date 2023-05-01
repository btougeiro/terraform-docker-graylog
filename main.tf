# -----------------------------------------------------------------------------
# MAIN
# -----------------------------------------------------------------------------

# -----------------------------------------------------------------------------
# BACKEND
# -----------------------------------------------------------------------------

terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = ">=2.16.0"
    }
  }
}

# -----------------------------------------------------------------------------
# DOCKER NETWORK
# -----------------------------------------------------------------------------

resource "docker_network" "this" {
  name = var.network_name
}

# -----------------------------------------------------------------------------
# MONGO
# -----------------------------------------------------------------------------

resource "docker_image" "mongo" {
  name         = format("%s:%s", var.mongo_image, var.mongo_version)
  keep_locally = var.keep_locally
}

resource "docker_container" "mongo" {
  count = var.mongo_num_of_containers
  name  = var.mongo_container_name

  env = var.mongo_env_vars

  restart = var.restart
  image   = docker_image.mongo.image_id

  dynamic "ports" {
    for_each = var.mongo_ports
    content {
      internal = lookup(ports.value, "internal", null)
      external = lookup(ports.value, "external", null)
      ip       = lookup(ports.value, "ip", null)
      protocol = lookup(ports.value, "protocol", null)
    }
  }

  networks_advanced {
    name = docker_network.this.name
  }

  dynamic "labels" {
    for_each = var.mongo_labels
    content {
      label = lookup(labels.value, "label", null)
      value = lookup(labels.value, "value", null)
    }
  }

  dynamic "volumes" {
    for_each = var.mongo_volumes
    content {
      container_path = lookup(volumes.value, "container_path", null)
      from_container = lookup(volumes.value, "from_container", null)
      host_path      = lookup(volumes.value, "host_path", null)
      read_only      = lookup(volumes.value, "read_only", null)
      volume_name    = lookup(volumes.value, "volume_name", null)
    }
  }
}

# -----------------------------------------------------------------------------
# GRAYLOG
# -----------------------------------------------------------------------------

resource "docker_image" "graylog" {
  name         = format("%s:%s", var.graylog_image, var.graylog_version)
  keep_locally = var.keep_locally
}

resource "docker_container" "graylog" {
  count = var.graylog_num_of_containers
  name  = var.graylog_container_name

  env = var.graylog_env_vars

  restart = var.restart
  image   = docker_image.graylog.image_id

  networks_advanced {
    name = docker_network.this.name
  }

  dynamic "ports" {
    for_each = var.graylog_ports
    content {
      internal = lookup(ports.value, "internal", null)
      external = lookup(ports.value, "external", null)
      ip       = lookup(ports.value, "ip", null)
      protocol = lookup(ports.value, "protocol", null)
    }
  }

  dynamic "labels" {
    for_each = var.graylog_labels
    content {
      label = lookup(labels.value, "label", null)
      value = lookup(labels.value, "value", null)
    }
  }

  dynamic "volumes" {
    for_each = var.graylog_volumes
    content {
      container_path = lookup(volumes.value, "container_path", null)
      from_container = lookup(volumes.value, "from_container", null)
      host_path      = lookup(volumes.value, "host_path", null)
      read_only      = lookup(volumes.value, "read_only", null)
      volume_name    = lookup(volumes.value, "volume_name", null)
    }
  }
}

# -----------------------------------------------------------------------------
# ELASTICSEARCH
# -----------------------------------------------------------------------------

resource "docker_image" "elasticsearch" {
  name         = format("%s:%s", var.elasticsearch_image, var.elasticsearch_version)
  keep_locally = var.keep_locally
}

resource "docker_container" "elasticsearch" {
  count = var.elasticsearch_num_of_containers
  name  = var.elasticsearch_container_name

  env = var.elasticsearch_env_vars

  restart = var.restart
  image   = docker_image.elasticsearch.image_id

  networks_advanced {
    name = docker_network.this.name
  }

  dynamic "ports" {
    for_each = var.elasticsearch_ports
    content {
      internal = lookup(ports.value, "internal", null)
      external = lookup(ports.value, "external", null)
      ip       = lookup(ports.value, "ip", null)
      protocol = lookup(ports.value, "protocol", null)
    }
  }

  dynamic "labels" {
    for_each = var.elasticsearch_labels
    content {
      label = lookup(labels.value, "label", null)
      value = lookup(labels.value, "value", null)
    }
  }

  dynamic "volumes" {
    for_each = var.elasticsearch_volumes
    content {
      container_path = lookup(volumes.value, "container_path", null)
      from_container = lookup(volumes.value, "from_container", null)
      host_path      = lookup(volumes.value, "host_path", null)
      read_only      = lookup(volumes.value, "read_only", null)
      volume_name    = lookup(volumes.value, "volume_name", null)
    }
  }
}
