# save public key in 
resource "aws_key_pair" "iti_tf_key" {
  key_name   = "iti_tf_key"
  public_key = tls_private_key.iti_tls.public_key_openssh

}

# create RSA key of size 4096 bits ( create a key)
resource "tls_private_key" "iti_tls" {
  algorithm = "RSA"
  rsa_bits  = 4096
}


# -------------------------------- create aws secrects manager ------------------------
resource "aws_secretsmanager_secret" "iti_secret" {
  name          = "iti_secret"
  recovery_window_in_days = 0
}

resource "aws_secretsmanager_secret_version" "priv_key_secrects" {
  secret_id     = aws_secretsmanager_secret.iti_secret.id
  secret_string = tls_private_key.iti_tls.private_key_openssh
}