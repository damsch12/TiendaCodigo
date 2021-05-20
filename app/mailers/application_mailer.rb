# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'sales@tiendacodigo.com'
  layout 'mailer'
end
