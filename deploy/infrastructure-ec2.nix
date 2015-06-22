let
  region = "us-west-1";
  accessKeyId = "hiplambda"; # symbolic name looked up in ~/.ec2-keys

  ec2 = { resources, ... }: {
    deployment = {
      targetEnv = "ec2";
      ec2 = {
        accessKeyId = accessKeyId;
        region = region;
        instanceType = "t2.micro";
        keyPair = resources.ec2KeyPairs.my-key-pair;
        securityGroups = [ "allow-ssh" "allow-http" ];
      };
    };
  };

in { 
  hiplambda = ec2;

  # Provision an EC2 key pair.
  resources.ec2KeyPairs.my-key-pair = { inherit region accessKeyId; };
}

