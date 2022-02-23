variable "db" {
    description = "PGSQL to monitor"
    type = object({
        id = string
        name = string
        resource_group_name = string
    })
}

variable "rg" {
    description = "rg to store alerts"
    type = object({
        name = string
    })
}

variable "action_group" {
    description = "action group to notify"
    type = object({
        id = string
    })
}
