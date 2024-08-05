class Post < ApplicationRecord
  after_create :send_create_webhook
  after_update :send_update_webhook

  private

  def send_create_webhook
    WebhookService.deliver('https://webhook.site/43ea3302-4db9-48cd-836f-ee18c0fc7559', { event: 'post_created', post: self })
  end

  def send_update_webhook
    WebhookService.deliver('https://webhook.site/43ea3302-4db9-48cd-836f-ee18c0fc7559', { event: 'post_updated', post: self })
  end
end