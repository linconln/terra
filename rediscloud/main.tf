provider {
  rediscloud = {
    source  = "RedisLabs/rediscloud"
    version = "1.6.0"
  }
}

resource "rediscloud_subscription" "linconln" {
  api_key    = "A5n4r5kgz1vybujbbnz92coj49clyn7rijvxmclg3y3wuojbljo"
  secret_key = "S54m2hrfjgai1ymyw2q1ct3rxonbqdcyd0f7b2u7n750z1orhhp"
}

data "rediscloud_database" "linconln" {
  subscription_id = "2078861"
}

data "rediscloud_subscription_peerings" "example" {
  subscription_id = "2078861"
}

output "rediscloud_subscription_peerings" {
  value = data.rediscloud_subscription_peerings.example.peerings
}
