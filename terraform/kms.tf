resource "aws_kms_key" "eks_key" {
  description             = "KMS key for EKS secrets encryption"
  deletion_window_in_days = 7
  enable_key_rotation     = true
  tags = {
    Name = "vprofile-eks1"
  }
}

resource "aws_kms_alias" "eks_alias" {
  name          = "alias/eks/vprofile-eks1"
  target_key_id = aws_kms_key.eks_key.id # <- link to the key in the same module
}