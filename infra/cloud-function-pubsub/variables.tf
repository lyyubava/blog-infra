variable "location" {
  type = string
}

variable "name" {
  type = string
}

variable "entry_point" {
  type = string
}


variable "path_to_code_archive" {
  type = string
}

variable "topic_name" {
  type = string
}

variable "runtime" {
  type = string
}

variable "environment_variables" {
  type = map(string)

}

variable "project_id" {
    type = string 
}