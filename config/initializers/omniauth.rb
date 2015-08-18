Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1877713805787981', '48c99651a3d50a0e0cbe5fdb826466c1',
           :scope => 'email,user_birthday,manage_pages,publish_pages,public_profile',
           :display => 'popup'
end