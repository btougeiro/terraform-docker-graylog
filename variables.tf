# -----------------------------------------------------------------------------
# VARIABLES
# -----------------------------------------------------------------------------

variable "network_name" {
  type        = string
  description = "Name given to docker network to link the applications."
  default     = null
}

variable "keep_locally" {
  type        = bool
  description = "(Boolean) If true, then the Docker image won't be deleted on destroy operation. If this is false, it will delete the image from the docker local storage on destroy operation."
  default     = false
}

variable "restart" {
  type        = string
  description = "(String) The restart policy for the container. Must be one of 'no', 'on-failure', 'always', 'unless-stopped'. Defaults to no."
  default     = "no"
}

# -----------------------------------------------------------------------------
# MONGO
# -----------------------------------------------------------------------------

variable "mongo_container_name" {
  type        = string
  description = "Name given to mongo container."
  default     = "mongo"
}

variable "mongo_ports" {
  type        = list(any)
  description = "List of ports to allow connection on MongoDB."
  default     = []
}

variable "mongo_image" {
  type        = string
  description = "Official MongoDB Docker image name."
  default     = "mongo"
}

variable "mongo_version" {
  type        = string
  description = "Official MongoDB Docker image version."
  default     = "latest"
}

variable "mongo_num_of_containers" {
  type        = number
  description = "Specify number of containers for MongoDB."
  default     = 1
}

variable "mongo_labels" {
  type        = list(any)
  description = "List of labels to attach to MongoDB."
  default     = []
}

variable "mongo_env_vars" {
  type        = set(string)
  description = "(Set of String) Environment variables to set in the form of KEY=VALUE, e.g. DEBUG=0"
  default     = null
}

variable "mongo_volumes" {
  type        = list(any)
  description = "(Block Set) Spec for mounting volumes in the container."
  default     = []
}

# -----------------------------------------------------------------------------
# GRAYLOG
# -----------------------------------------------------------------------------

variable "graylog_container_name" {
  type        = string
  description = "Name given to graylog container."
  default     = "graylog"
}

variable "graylog_ports" {
  type        = list(any)
  description = "List of ports to allow connection on Graylog."
  default     = []
}

variable "graylog_image" {
  type        = string
  description = "Official Graylog Docker image name."
  default     = "graylog/graylog"
}

variable "graylog_version" {
  type        = string
  description = "Official Graylog Docker image version."
  default     = "latest"
}

variable "graylog_num_of_containers" {
  type        = number
  description = "Specify number of containers for Graylog."
  default     = 1
}

variable "graylog_labels" {
  type        = list(any)
  description = "List of labels to attach to Graylog."
  default     = []
}

variable "graylog_env_vars" {
  type        = set(string)
  description = "(Set of String) Environment variables to set in the form of KEY=VALUE, e.g. DEBUG=0"
  default     = null
}

variable "graylog_volumes" {
  type        = list(any)
  description = "(Block Set) Spec for mounting volumes in the container."
  default     = []
}

# -----------------------------------------------------------------------------
#  ELASTICSEARCH
# -----------------------------------------------------------------------------

variable "elasticsearch_container_name" {
  type        = string
  description = "Name given to elasticsearch container."
  default     = "elasticsearch"
}

variable "elasticsearch_ports" {
  type        = list(any)
  description = "List of ports to allow connection on Elasticsearch."
  default     = []
}

variable "elasticsearch_image" {
  type        = string
  description = "Official Elasticsearch Docker image name."
  default     = "elasticsearch"
}

variable "elasticsearch_version" {
  type        = string
  description = "Official Elasticsearch Docker image version."
  default     = "latest"
}

variable "elasticsearch_num_of_containers" {
  type        = number
  description = "Specify number of containers for Elasticsearch."
  default     = 1
}

variable "elasticsearch_labels" {
  type        = list(any)
  description = "List of labels to attach to Elasticsearch."
  default     = []
}

variable "elasticsearch_env_vars" {
  type        = set(string)
  description = "(Set of String) Environment variables to set in the form of KEY=VALUE, e.g. DEBUG=0"
  default     = null
}

variable "elasticsearch_volumes" {
  type        = list(any)
  description = "(Block Set) Spec for mounting volumes in the container."
  default     = []
}
