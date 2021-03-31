variable "project" {
    type = string
    description = "Project name, used for naming resources."
}
variable "location" {
    type = string
    description = "Azure Region"
    default = "westus2"
}