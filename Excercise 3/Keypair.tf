resource "aws_key_pair" "dove_key" {
  key_name   = "dove-key"
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGdgGE8YXWAZwMV0O0WOvU8NwoCv7RvB0DTEXQfE0w11 Maaz Khan@DESKTOP-OBA38KV"
}

resource "aws_key_pair" "test_key" {
  key_name   = "test_key"
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIPwUoV35KwprO+x60jWfucFaiAPnVvannsXtswODhTE Maaz Khan@DESKTOP-OBA38KV"
}

