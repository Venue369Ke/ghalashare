# Configure API settings while passing on the data that we need
Rails.configuration.stripe = {
  :publishable_key => 'pk_test_t0WF8iBGbP8VBrxMdCdne0Oa00OABcga46',
  :secret_key => 'sk_test_f3FtHK1MMrYg3HZuKHPbh7rc00xTrViT4j'
}
Stripe.api_key = Rails.configuration.stripe[:secret_key]
